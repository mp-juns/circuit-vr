using System;
using System.Collections;
using System.Globalization;
using System.Text;
using System.Text.RegularExpressions;
using UnityEngine;
using UnityEngine.Networking;

namespace Achoo
{
    /// <summary>
    /// Sends a captured image to an OpenAI vision-capable chat completion model and returns the raw response.
    /// </summary>
    public class GPTVisionAPI : MonoBehaviour
    {
        [Header("API Settings")]
        [SerializeField] private string apiKey = string.Empty;
        [SerializeField] private string modelName = "gpt-4.1-mini";
        [SerializeField] private string apiUrl = "https://api.openai.com/v1/chat/completions";

        [Header("Prompts")]
        [TextArea(3, 8)]
        [SerializeField] private string systemPrompt =
            "You are an expert assistant for a breadboard circuit simulation game. " +
            "You will receive an image of a virtual breadboard circuit. If the circuit is electrically correct and matches the intended design, answer with '1'. " +
            "If the circuit is incorrect, incomplete, or obviously wrong, answer with '0'. " +
            "IMPORTANT: Output ONLY the digit '1' or '0'. Do not add any text, punctuation, or explanation.";

        [SerializeField] private string userInstruction = "Analyze this breadboard circuit. Return '1' if the circuit is valid, else '0'.";

        [Header("Request Tuning")]
        [SerializeField] private int maxTokens = 256;
        [SerializeField] [Range(0f, 2f)] private float temperature = 0f;
        [SerializeField] private bool logTraffic = false;

        private const string ApiKeyEnvVar = "OPENAI_API_KEY";

        public string SystemPrompt => systemPrompt;
        public string UserInstruction => userInstruction;

        private void Awake()
        {
            if (string.IsNullOrEmpty(apiKey))
            {
                apiKey = Environment.GetEnvironmentVariable(ApiKeyEnvVar);
            }
        }

        /// <summary>
        /// Sends the provided image to the GPT vision endpoint and returns the raw text content.
        /// </summary>
        public IEnumerator AnalyzeCircuit(Texture2D image, Action<string> onSuccess, Action<string> onError = null)
        {
            yield return AnalyzeCircuitWithPrompt(image, systemPrompt, userInstruction, true, onSuccess, onError);
        }

        public IEnumerator AnalyzeCircuitWithPrompt(
            Texture2D image,
            string systemPromptOverride,
            string userPromptOverride,
            bool includeImage,
            Action<string> onSuccess,
            Action<string> onError = null)
        {
            if (string.IsNullOrEmpty(apiKey))
            {
                string error = "API key is missing.";
                Debug.LogError($"[GPTVisionAPI] {error}");
                onError?.Invoke(error);
                yield break;
            }

            string base64Image = string.Empty;
            if (includeImage)
            {
                if (image == null)
                {
                    string error = "Image is null.";
                    Debug.LogError($"[GPTVisionAPI] {error}");
                    onError?.Invoke(error);
                    yield break;
                }

                base64Image = CameraCapture.EncodeToBase64(image, true);
                if (string.IsNullOrEmpty(base64Image))
                {
                    string error = "Failed to encode image to Base64.";
                    Debug.LogError($"[GPTVisionAPI] {error}");
                    onError?.Invoke(error);
                    yield break;
                }
            }

            string requestBody = BuildRequestBody(base64Image, systemPromptOverride, userPromptOverride, includeImage);
            byte[] payload = Encoding.UTF8.GetBytes(requestBody);

            using (UnityWebRequest request = new UnityWebRequest(apiUrl, UnityWebRequest.kHttpVerbPOST))
            {
                request.uploadHandler = new UploadHandlerRaw(payload);
                request.downloadHandler = new DownloadHandlerBuffer();
                request.SetRequestHeader("Content-Type", "application/json");
                request.SetRequestHeader("Authorization", $"Bearer {apiKey}");

                if (logTraffic)
                {
                    Debug.Log($"[GPTVisionAPI] Sending request ({payload.Length} bytes) to {apiUrl} using model {modelName}.");
                }

                yield return request.SendWebRequest();

                if (request.result != UnityWebRequest.Result.Success)
                {
                    string error = $"API request failed: {request.error}";
                    string responseText = request.downloadHandler != null ? request.downloadHandler.text : string.Empty;
                    if (!string.IsNullOrEmpty(responseText))
                    {
                        error = $"{error} | {responseText}";
                    }

                    Debug.LogError($"[GPTVisionAPI] {error}");
                    onError?.Invoke(error);
                    yield break;
                }

                string response = request.downloadHandler.text;
                string content = ExtractContent(response).Trim();

                if (logTraffic)
                {
                    Debug.Log($"[GPTVisionAPI] Response: {response}");
                }

                if (string.IsNullOrEmpty(content))
                {
                    Debug.LogWarning("[GPTVisionAPI] Empty content returned; passing raw response.");
                    content = response ?? string.Empty;
                }

                onSuccess?.Invoke(content);
            }
        }

        private string BuildRequestBody(string base64Image, string systemPromptOverride, string userPromptOverride, bool includeImage)
        {
            string escapedSystem = EscapeJson(string.IsNullOrEmpty(systemPromptOverride) ? systemPrompt : systemPromptOverride);
            string escapedUser = EscapeJson(string.IsNullOrEmpty(userPromptOverride) ? userInstruction : userPromptOverride);

            StringBuilder sb = new StringBuilder();
            sb.Append('{');
            sb.Append("\"model\":\"").Append(modelName).Append("\",");
            sb.Append("\"messages\":[");
            sb.Append("{\"role\":\"system\",\"content\":[{\"type\":\"text\",\"text\":\"").Append(escapedSystem).Append("\"}]},");
            sb.Append("{\"role\":\"user\",\"content\":[");
            sb.Append("{\"type\":\"text\",\"text\":\"").Append(escapedUser).Append("\"}");
            if (includeImage)
            {
                sb.Append(",{\"type\":\"image_url\",\"image_url\":{\"url\":\"data:image/png;base64,").Append(base64Image).Append("\"}}");
            }
            sb.Append("]}],");
            sb.Append("\"max_completion_tokens\":").Append(maxTokens).Append(',');
            sb.Append("\"temperature\":").Append(temperature.ToString(CultureInfo.InvariantCulture));
            sb.Append('}');
            return sb.ToString();
        }

        private static string EscapeJson(string value)
        {
            if (string.IsNullOrEmpty(value))
            {
                return string.Empty;
            }

            return value
                .Replace("\\", "\\\\")
                .Replace("\"", "\\\"")
                .Replace("\n", "\\n")
                .Replace("\r", "\\r");
        }

        private string ExtractContent(string json)
        {
            if (string.IsNullOrEmpty(json))
            {
                return string.Empty;
            }

            // Try modern content array shape first.
            try
            {
                ChatResponseArray parsed = JsonUtility.FromJson<ChatResponseArray>(json);
                if (parsed?.choices != null && parsed.choices.Length > 0)
                {
                    MessageArray message = parsed.choices[0].message;
                    if (message?.content != null && message.content.Length > 0 && !string.IsNullOrEmpty(message.content[0].text))
                    {
                        return message.content[0].text;
                    }
                }
            }
            catch
            {
                // ignored
            }

            // Fall back to legacy single-string content shape.
            try
            {
                ChatResponseString parsed = JsonUtility.FromJson<ChatResponseString>(json);
                if (parsed?.choices != null && parsed.choices.Length > 0)
                {
                    MessageString message = parsed.choices[0].message;
                    if (message != null && !string.IsNullOrEmpty(message.content))
                    {
                        return message.content;
                    }
                }
            }
            catch
            {
                // ignored
            }

            // Regex as a last resort.
            Match textMatch = Regex.Match(json, "\"text\"\\s*:\\s*\"(.*?)\"", RegexOptions.Singleline);
            if (textMatch.Success)
            {
                return textMatch.Groups[1].Value;
            }

            Match contentMatch = Regex.Match(json, "\"content\"\\s*:\\s*\"(.*?)\"", RegexOptions.Singleline);
            if (contentMatch.Success)
            {
                return contentMatch.Groups[1].Value;
            }

            return string.Empty;
        }

        [Serializable]
        private class ChatResponseArray
        {
            public ChoiceArray[] choices;
        }

        [Serializable]
        private class ChoiceArray
        {
            public MessageArray message;
        }

        [Serializable]
        private class MessageArray
        {
            public ContentPart[] content;
        }

        [Serializable]
        private class ContentPart
        {
            public string type;
            public string text;
        }

        [Serializable]
        private class ChatResponseString
        {
            public ChoiceString[] choices;
        }

        [Serializable]
        private class ChoiceString
        {
            public MessageString message;
        }

        [Serializable]
        private class MessageString
        {
            public string content;
        }
    }
}
