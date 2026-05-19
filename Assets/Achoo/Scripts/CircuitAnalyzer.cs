using System;
using System.Collections;
using System.IO;
using UnityEngine;
using UnityEngine.Events;

namespace Achoo
{
    // 이벤트 정의
    [Serializable]
    public class CircuitAnalysisUnityEvent : UnityEvent<CircuitAnalysisResult> { }

    public enum AnalysisMode
    {
        LogicOnly,
        GptVisionOnly,
        GptHybridImagePlusNetlist
    }

    public class CircuitAnalyzer : MonoBehaviour
    {
        [Header("References")]
        [SerializeField] private GPTVisionAPI visionApi;
        // [SerializeField] private CameraCapture cameraCapture; // 더 이상 사용 안 함

        [Header("Dual Camera Settings")]
        [Tooltip("촬영을 담당할 서브 카메라 (PhotoSpotView)")]
        [SerializeField] private Camera scanCamera; 
        [Tooltip("GPT에 전송할 이미지 해상도")]
        [SerializeField] private Vector2Int captureResolution = new Vector2Int(1024, 1024);

        [Header("Visual RAG Settings (KJS Data Collection)")]
        [SerializeField] private bool saveTrainingData = true;
        [SerializeField] private string trainingDataFolderName = "TrainingData";
        [SerializeField] private bool saveDebugImage = true;
        [SerializeField] private string debugSavePath = "D:/Achoo_Captures/";

        [Header("Analysis Mode")]
        [SerializeField] private AnalysisMode analysisMode = AnalysisMode.GptHybridImagePlusNetlist;

        [Header("Logic Validator Settings")]
        [SerializeField] private BreadboardConnectivitySettings defaultConnectivity;
        [SerializeField] private CircuitTopologyRules topologyRules;
        [SerializeField] private bool saveNetlistJson = true;

        [Header("Hybrid GPT Settings")]
        [TextArea(3, 8)]
        [SerializeField] private string hybridSystemPrompt =
            "You are an expert circuit analysis assistant. Use the provided netlist JSON as the ONLY source of truth for connectivity and topology. " +
            "The image is only for listing which parts appear to exist. Do NOT infer connections from the image. Follow the output format exactly.";

        [TextArea(8, 16)]
        [SerializeField] private string hybridUserPromptTemplate =
            "Analyze the circuit.\n" +
            "Rules:\n" +
            "- Use the netlist JSON as the only source of truth for electrical connectivity/topology.\n" +
            "- The image is only for parts presence/overview; do not infer which holes are connected.\n" +
            "Output format:\n" +
            "Line1: 0 or 1 only.\n" +
            "Line2+: JSON object in Korean with keys: confidence (0-1), image_summary (array), netlist_summary (array), reasons (array), uncertainties (array).\n" +
            "Do not wrap the JSON in code fences.\n" +
            "Netlist JSON:\n" +
            "{NETLIST_JSON}";

        [Header("Events")]
        public UnityEvent OnCircuitValid;
        public UnityEvent OnCircuitInvalid;
        public CircuitAnalysisUnityEvent OnAnalysisCompleted;

        private bool isAnalyzing = false;
        private string currentAnalysisTimestamp;
        private CircuitValidationReport currentLogicReport;
        private string currentNetlistPath;
        private string currentReasonsPath;
        private string currentGptPath;
        private string currentScreenshotPath;
        private string currentSystemPrompt;
        private string currentUserPrompt;

        // 외부 호출용
        public void AnalyzeCurrentCircuit()
        {
            if (isAnalyzing)
            {
                Debug.LogWarning("[CircuitAnalyzer] 이미 분석 중입니다.");
                return;
            }

            isAnalyzing = true;
            currentAnalysisTimestamp = DateTime.Now.ToString("yyyyMMdd_HHmmss_fff");
            currentNetlistPath = null;
            currentReasonsPath = null;
            currentGptPath = null;
            currentScreenshotPath = null;
            currentSystemPrompt = string.Empty;
            currentUserPrompt = string.Empty;
            currentLogicReport = AnalyzeWithLogicValidator();
            ExportAnalysisArtifacts(currentLogicReport, currentAnalysisTimestamp);

            if (analysisMode == AnalysisMode.LogicOnly)
            {
                var resultData = BuildLogicResult(currentLogicReport);
                OnAnalysisCompleted?.Invoke(resultData);
                ProcessAnalysisResult(resultData, null);
                isAnalyzing = false;
                return;
            }

            if (scanCamera == null)
            {
                Debug.LogError("[CircuitAnalyzer] Scan Camera(PhotoSpotView)가 연결되지 않았습니다!");
                isAnalyzing = false;
                return;
            }

            if (visionApi == null)
            {
                Debug.LogError("[CircuitAnalyzer] GPTVisionAPI가 연결되지 않았습니다!");
                isAnalyzing = false;
                return;
            }

            StartCoroutine(AnalyzeRoutine(analysisMode));
        }

        private CircuitValidationReport AnalyzeWithLogicValidator()
        {
            var resolver = new BreadboardNetResolver(defaultConnectivity);
            var builder = new BreadboardNetlistBuilder(resolver);
            var state = CircuitRuntimeState.CaptureScene();
            var netlist = builder.Build(state);
            return CircuitTopologyValidator.Validate(netlist, topologyRules);
        }

        private CircuitAnalysisResult BuildLogicResult(CircuitValidationReport report)
        {
            return new CircuitAnalysisResult
            {
                rawResponse = report != null && report.reasons != null
                    ? string.Join(" | ", report.reasons)
                    : "LogicValidator",
                isCorrect = report != null ? report.result : 0,
                confidence = report != null ? report.confidence : 1f,
                reasons = report != null ? report.reasons?.ToArray() : null,
                netlistJson = report != null ? report.netlistJson : string.Empty,
                source = "LOGIC"
            };
        }

        private IEnumerator AnalyzeRoutine(AnalysisMode mode)
        {
            Debug.Log("[CircuitAnalyzer] 분석 루틴 시작 (Dual Camera)...");

            yield return new WaitForEndOfFrame();

            // 1. 서브 카메라로 캡처 (순간이동 로직 대체)
            Texture2D captured = CaptureFromCamera(scanCamera, captureResolution.x, captureResolution.y);

            if (captured == null)
            {
                Debug.LogError("[CircuitAnalyzer] 캡처 실패.");
                isAnalyzing = false;
                yield break;
            }

            // 분석 아티팩트용 스크린샷 저장 (GPT/Hybrid에서는 항상 저장)
            bool shouldSaveScreenshot = saveDebugImage || mode != AnalysisMode.LogicOnly;
            if (shouldSaveScreenshot)
            {
                currentScreenshotPath = SaveCapturedTexture(captured, currentAnalysisTimestamp);
            }

            string systemPrompt = visionApi != null ? visionApi.SystemPrompt : string.Empty;
            string userPrompt = visionApi != null ? visionApi.UserInstruction : string.Empty;
            bool includeImage = true;

            if (mode == AnalysisMode.GptHybridImagePlusNetlist)
            {
                systemPrompt = hybridSystemPrompt;
                userPrompt = BuildHybridUserPrompt(currentLogicReport != null ? currentLogicReport.netlistJson : string.Empty);
                includeImage = true;
            }

            currentSystemPrompt = systemPrompt ?? string.Empty;
            currentUserPrompt = userPrompt ?? string.Empty;

            // 2. GPT 분석 요청
            yield return StartCoroutine(visionApi.AnalyzeCircuitWithPrompt(captured,
                systemPrompt,
                userPrompt,
                includeImage,
                onSuccess: (response) =>
                {
                    OnAnalysisSuccess(response, captured, mode);
                    isAnalyzing = false;
                },
                onError: (error) =>
                {
                    Debug.LogError($"[CircuitAnalyzer] GPT 오류: {error}");
                    isAnalyzing = false;
                }
            ));
        }

        /// <summary>
        /// 특정 카메라의 시점을 렌더링하여 Texture2D로 반환
        /// </summary>
        private Texture2D CaptureFromCamera(Camera cam, int width, int height)
        {
            // 임시 RenderTexture 생성
            RenderTexture rt = RenderTexture.GetTemporary(width, height, 24);
            
            // 카메라 설정을 잠시 변경하여 RT에 그리게 함
            RenderTexture prevTarget = cam.targetTexture;
            cam.targetTexture = rt;
            
            // 렌더링 수행 (카메라가 꺼져 있어도 강제로 그립니다)
            cam.Render();

            // RT에서 픽셀 읽어오기
            RenderTexture.active = rt;
            Texture2D screenShot = new Texture2D(width, height, TextureFormat.RGB24, false);
            screenShot.ReadPixels(new Rect(0, 0, width, height), 0, 0);
            screenShot.Apply();

            // 설정 복구 및 정리
            cam.targetTexture = prevTarget;
            RenderTexture.active = null;
            RenderTexture.ReleaseTemporary(rt);

            return screenShot;
        }

        // GPT 응답 처리
        private void OnAnalysisSuccess(string rawResponse, Texture2D texture, AnalysisMode mode)
        {
            Debug.Log($"[CircuitAnalyzer] GPT 응답: {rawResponse}");
            ExportGptArtifacts(rawResponse, currentAnalysisTimestamp, currentSystemPrompt, currentUserPrompt);

            int resultValue = 0;
            HybridGptPayload payload = null;
            if (!TryParseGptResponse(rawResponse, out resultValue, out payload))
            {
                Debug.LogWarning("[CircuitAnalyzer] GPT response missing leading 0/1. Defaulting to 0.");
            }

            string t = rawResponse ?? string.Empty;
            t = t.TrimStart('\uFEFF', ' ', '\t', '\r', '\n');

            Debug.Log($"[CircuitAnalyzer] RAW head='{t.Substring(0, Mathf.Min(80, t.Length))}'");
            Debug.Log($"[CircuitAnalyzer] PARSED resultValue={resultValue}");

            var resultData = new CircuitAnalysisResult
            {
                rawResponse = rawResponse,
                isCorrect = resultValue,
                confidence = payload != null ? payload.confidence : 0f,
                reasons = payload != null ? payload.reasons : null,
                netlistJson = currentLogicReport != null ? currentLogicReport.netlistJson : string.Empty,
                source = mode == AnalysisMode.GptHybridImagePlusNetlist ? "HYBRID" : "GPT"
            };

            OnAnalysisCompleted?.Invoke(resultData);
            Debug.Log($"[CircuitAnalyzer] After OnAnalysisCompleted: isCorrect={resultData.isCorrect}");
            ProcessAnalysisResult(resultData, texture);
        }

        private void ProcessAnalysisResult(CircuitAnalysisResult result, Texture2D texture)
        {
            Debug.Log($"[CircuitAnalyzer] Enter ProcessAnalysisResult: isCorrect={result.isCorrect}");
            
            if (saveTrainingData)
            {
                SaveTrainingData(result, texture, currentAnalysisTimestamp);
            }

            if (result.isCorrect == 1)
            {
                Debug.Log("Circuit Valid (1)");
                OnCircuitValid?.Invoke();
            }
            else
            {
                Debug.Log("Circuit Invalid (0)");
                OnCircuitInvalid?.Invoke();
            }
        }

        private string SaveCapturedTexture(Texture2D texture, string timestamp)
        {
            if (texture == null)
            {
                return null;
            }

            try
            {
                string safeTimestamp = string.IsNullOrEmpty(timestamp)
                    ? DateTime.Now.ToString("yyyyMMdd_HHmmss_fff")
                    : timestamp;
                string filename = $"Circuit_{safeTimestamp}.png";
                string directory = GetArtifactsDirectory();
                string path = Path.Combine(directory, filename);
                File.WriteAllBytes(path, texture.EncodeToPNG());
                Debug.Log($"[CircuitAnalyzer] 디버그 이미지 저장됨: {path}");
                return path;
            }
            catch (Exception e)
            {
                Debug.LogWarning($"[CircuitAnalyzer] 이미지 저장 실패: {e.Message}");
            }

            return null;
        }

        private void ExportAnalysisArtifacts(CircuitValidationReport report, string timestamp)
        {
            try
            {
                string directory = GetArtifactsDirectory();
                string safeTimestamp = BuildTimestamp(timestamp);

                string netlistPath = Path.Combine(directory, $"Circuit_{safeTimestamp}_netlist.json");
                string netlistJson = report != null ? report.netlistJson : string.Empty;
                if (string.IsNullOrEmpty(netlistJson))
                {
                    netlistJson = "{}";
                }

                File.WriteAllText(netlistPath, netlistJson);
                currentNetlistPath = netlistPath;

                string reasonsPath = Path.Combine(directory, $"Circuit_{safeTimestamp}_validator_reasons.txt");
                var reasons = report != null && report.reasons != null && report.reasons.Count > 0
                    ? report.reasons
                    : new System.Collections.Generic.List<string> { "No validator reasons available." };
                File.WriteAllLines(reasonsPath, reasons);
                currentReasonsPath = reasonsPath;
            }
            catch (Exception e)
            {
                Debug.LogWarning($"[CircuitAnalyzer] 분석 아티팩트 저장 실패: {e.Message}");
            }
        }

        private void ExportGptArtifacts(string rawResponse, string timestamp, string systemPrompt, string userPrompt)
        {
            try
            {
                string directory = GetArtifactsDirectory();
                string safeTimestamp = BuildTimestamp(timestamp);
                string gptPath = Path.Combine(directory, $"Circuit_{safeTimestamp}_gpt.json");

                var artifact = new GptAnalysisArtifact
                {
                    system_prompt = systemPrompt ?? string.Empty,
                    user_prompt = userPrompt ?? string.Empty,
                    gpt_raw_response = rawResponse ?? string.Empty
                };

                string json = JsonUtility.ToJson(artifact, true);
                File.WriteAllText(gptPath, json);
                currentGptPath = gptPath;
            }
            catch (Exception e)
            {
                Debug.LogWarning($"[CircuitAnalyzer] GPT 아티팩트 저장 실패: {e.Message}");
            }
        }

        private string GetArtifactsDirectory()
        {
            string fallback = Path.Combine(Application.persistentDataPath, "AnalysisArtifacts");
            string preferred = !string.IsNullOrEmpty(debugSavePath) ? debugSavePath : fallback;

            try
            {
                if (!Directory.Exists(preferred))
                {
                    Directory.CreateDirectory(preferred);
                }

                return preferred;
            }
            catch (Exception e)
            {
                Debug.LogWarning($"[CircuitAnalyzer] 아티팩트 경로 생성 실패({preferred}): {e.Message}");
                if (!Directory.Exists(fallback))
                {
                    Directory.CreateDirectory(fallback);
                }

                return fallback;
            }
        }

        private string BuildTimestamp(string timestamp)
        {
            return string.IsNullOrEmpty(timestamp)
                ? DateTime.Now.ToString("yyyyMMdd_HHmmss_fff")
                : timestamp;
        }

        private void SaveTrainingData(CircuitAnalysisResult result, Texture2D texture, string timestamp)
        {
            try
            {
                string label = result.isCorrect.ToString();
                string safeTimestamp = string.IsNullOrEmpty(timestamp)
                    ? DateTime.Now.ToString("yyyyMMdd_HHmmss_fff")
                    : timestamp;
                string baseFolder = Path.Combine(Application.persistentDataPath, trainingDataFolderName);
                string labelFolder = Path.Combine(baseFolder, label);

                if (!Directory.Exists(labelFolder)) Directory.CreateDirectory(labelFolder);

                string pngFilename = null;
                string pngPath = null;
                if (texture != null)
                {
                    pngFilename = $"Circuit_{safeTimestamp}.png";
                    pngPath = Path.Combine(labelFolder, pngFilename);
                    File.WriteAllBytes(pngPath, texture.EncodeToPNG());
                }

                string netlistPath = null;
                if (saveNetlistJson && !string.IsNullOrEmpty(result.netlistJson))
                {
                    string netlistFilename = $"Circuit_{safeTimestamp}_netlist.json";
                    netlistPath = Path.Combine(labelFolder, netlistFilename);
                    File.WriteAllText(netlistPath, result.netlistJson);
                }

                string[] validatorReasons = currentLogicReport != null ? currentLogicReport.reasons?.ToArray() : result.reasons;

                TrainingData data = new TrainingData
                {
                    system_prompt = currentSystemPrompt ?? string.Empty,
                    user_prompt = currentUserPrompt ?? string.Empty,
                    gpt_raw_response = result.rawResponse,
                    final_label = label,
                    netlist_json = result.netlistJson,
                    netlist_path = currentNetlistPath ?? netlistPath,
                    validator_reasons = validatorReasons,
                    confidence = result.confidence,
                    image_path = pngPath,
                    validator_reasons_path = currentReasonsPath,
                    screenshot_path = currentScreenshotPath,
                    source = result.source,
                    gpt_path = currentGptPath
                };

                string json = JsonUtility.ToJson(data, true);
                string jsonPath = Path.Combine(labelFolder, $"Circuit_{safeTimestamp}.json");
                
                File.WriteAllText(jsonPath, json);
                Debug.Log($"[CircuitAnalyzer] 학습 데이터 저장 완료: {jsonPath}");
            }
            catch (Exception e)
            {
                Debug.LogError($"[CircuitAnalyzer] 학습 데이터 저장 실패: {e.Message}");
            }
        }

        [Serializable]
        private class GptAnalysisArtifact
        {
            public string system_prompt;
            public string user_prompt;
            public string gpt_raw_response;
        }

        [Serializable]
        private class HybridGptPayload
        {
            public float confidence;
            public string[] image_summary;
            public string[] netlist_summary;
            public string[] reasons;
            public string[] uncertainties;
        }

        [Serializable]
        private class TrainingData
        {
            public string system_prompt;
            public string user_prompt;
            public string gpt_raw_response;
            public string final_label;
            public string netlist_json;
            public string netlist_path;
            public string[] validator_reasons;
            public float confidence;
            public string image_path;
            public string validator_reasons_path;
            public string screenshot_path;
            public string source;
            public string gpt_path;
        }

        private string BuildHybridUserPrompt(string netlistJson)
        {
            string safeNetlist = string.IsNullOrEmpty(netlistJson) ? "{}" : netlistJson;
            string template = string.IsNullOrEmpty(hybridUserPromptTemplate) ? string.Empty : hybridUserPromptTemplate;
            if (string.IsNullOrEmpty(template))
            {
                return $"Netlist JSON:\n{safeNetlist}";
            }

            if (!template.Contains("{NETLIST_JSON}"))
            {
                return $"{template}\n\nNetlist JSON:\n{safeNetlist}";
            }

            return template.Replace("{NETLIST_JSON}", safeNetlist);
        }

        private bool TryParseGptResponse(string rawResponse, out int resultValue, out HybridGptPayload payload)
        {
            resultValue = 0;
            payload = null;

            if (string.IsNullOrEmpty(rawResponse))
            {
                return false;
            }

            string text = rawResponse.TrimStart('\uFEFF', ' ', '\t', '\r', '\n');
            if (string.IsNullOrEmpty(text))
            {
                return false;
            }

            string[] lines = text.Split('\n');
            int resultLine = -1;
            for (int i = 0; i < lines.Length; i++)
            {
                string line = lines[i].Trim();
                if (line.Length == 0)
                {
                    continue;
                }

                if (line == "0" || line == "1")
                {
                    resultValue = line[0] - '0';
                    resultLine = i;
                    break;
                }

                if (line[0] == '0' || line[0] == '1')
                {
                    resultValue = line[0] - '0';
                    resultLine = i;
                    break;
                }

                break;
            }

            if (resultLine < 0)
            {
                if (text[0] == '0' || text[0] == '1')
                {
                    resultValue = text[0] - '0';
                    resultLine = 0;
                }
                else
                {
                    return false;
                }
            }

            if (lines.Length <= resultLine + 1)
            {
                return true;
            }

            string json = string.Join("\n", lines, resultLine + 1, lines.Length - (resultLine + 1));
            json = StripCodeFence(json).Trim();
            if (string.IsNullOrEmpty(json))
            {
                return true;
            }

            try
            {
                string candidate = json;
                int firstBrace = candidate.IndexOf('{');
                int lastBrace = candidate.LastIndexOf('}');
                if (firstBrace >= 0 && lastBrace > firstBrace)
                {
                    candidate = candidate.Substring(firstBrace, lastBrace - firstBrace + 1);
                }

                payload = JsonUtility.FromJson<HybridGptPayload>(candidate);
            }
            catch (Exception e)
            {
                Debug.LogWarning($"[CircuitAnalyzer] GPT JSON parse failed: {e.Message}");
            }

            return true;
        }

        private static string StripCodeFence(string text)
        {
            if (string.IsNullOrEmpty(text))
            {
                return string.Empty;
            }

            string trimmed = text.Trim();
            if (!trimmed.StartsWith("```"))
            {
                return text;
            }

            int firstNewline = trimmed.IndexOf('\n');
            if (firstNewline < 0)
            {
                return string.Empty;
            }

            string withoutFirstLine = trimmed.Substring(firstNewline + 1);
            int lastFence = withoutFirstLine.LastIndexOf("```", StringComparison.Ordinal);
            if (lastFence >= 0)
            {
                return withoutFirstLine.Substring(0, lastFence);
            }

            return withoutFirstLine;
        }

    }

    [Serializable]
    public class CircuitAnalysisResult
    {
        public string rawResponse;
        public int isCorrect;
        public float confidence;
        public string[] reasons;
        public string netlistJson;
        public string source;
    }
}
