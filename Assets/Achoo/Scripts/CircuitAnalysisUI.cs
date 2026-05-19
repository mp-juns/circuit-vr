using UnityEngine;
using UnityEngine.UI;

namespace Achoo
{
    /// <summary>
    /// GPT 회로 분석 상태를 간단한 Text UI로 보여주는 스크립트.
    /// </summary>
    public class CircuitAnalysisUI : MonoBehaviour
    {
        [Header("UI References")]
        [SerializeField] private Text statusText;    // "분석 중..." / "정답" / "오답" 표시
        [SerializeField] private GameObject rootPanel; // 전체 패널(끄고 켜고 하고 싶으면 사용)

        private void Start()
        {
            SetWaiting();
        }

        /// <summary>기본 대기 상태 텍스트</summary>
        public void SetWaiting()
        {
            if (rootPanel != null) rootPanel.SetActive(true);
            if (statusText != null)
                statusText.text = "Waiting Analysis...\n(Click X button and Analysis)";
        }

        /// <summary>X 버튼을 눌렀을 때 호출 → \"분석 중\" 표시</summary>
        public void ShowAnalyzing()
        {
            if (rootPanel != null) rootPanel.SetActive(true);
            if (statusText != null)
                statusText.text = "GPT Analysising...";
        }

        /// <summary>CircuitAnalyzer.OnAnalysisCompleted 에 연결될 함수</summary>
        public void OnAnalysisCompleted(CircuitAnalysisResult result)
        {
            if (rootPanel != null) rootPanel.SetActive(true);
            if (statusText == null) return;

            if (result == null)
            {
                statusText.text = "Analysis Fail: No results";
                return;
            }

            string source = string.IsNullOrEmpty(result.source) ? "UNKNOWN" : result.source;
            if (result.isCorrect == 1)
            {
                statusText.text = $"Result: True ({source})";
            }
            else
            {
                statusText.text = $"Result: False ({source})";
                if (source == "LOGIC" && result.reasons != null && result.reasons.Length > 0)
                {
                    string failureReason = null;
                    foreach (var reason in result.reasons)
                    {
                        if (string.IsNullOrWhiteSpace(reason))
                        {
                            continue;
                        }

                        if (reason.StartsWith("Plus net") ||
                            reason.StartsWith("Minus net") ||
                            reason.StartsWith("Detected components") ||
                            reason.Contains(" nets: "))
                        {
                            continue;
                        }

                        failureReason = reason;
                        break;
                    }

                    if (!string.IsNullOrEmpty(failureReason))
                    {
                        statusText.text += $"\n{failureReason}";
                    }
                }
            }

            // 필요하면 rawResponse도 같이 보고 싶을 때:
            // statusText.text += "\n\n" + result.rawResponse;
        }
    }
}
