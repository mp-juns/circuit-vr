using System;
using System.Collections;
using UnityEngine;

namespace Achoo
{
    /// <summary>
    /// Captures a camera view into a Texture2D and exposes helpers to encode it.
    /// </summary>
    public class CameraCapture : MonoBehaviour
    {
        [Header("Camera")]
        [SerializeField] private Camera targetCamera;

        [Header("Capture Settings")]
        [SerializeField] private int captureWidth = 1024;
        [SerializeField] private int captureHeight = 768;

        /// <summary>
        /// Captures the assigned camera view at the configured resolution.
        /// </summary>
        public IEnumerator CaptureScreen(Action<Texture2D> onCaptured)
        {
            if (captureWidth <= 0 || captureHeight <= 0)
            {
                Debug.LogError("[CameraCapture] Capture resolution must be greater than zero.");
                onCaptured?.Invoke(null);
                yield break;
            }

            yield return new WaitForEndOfFrame();

            Camera cam = ResolveCamera();
            if (cam == null)
            {
                Debug.LogError("[CameraCapture] No camera available for capture.");
                onCaptured?.Invoke(null);
                yield break;
            }

            RenderTexture tempRT = RenderTexture.GetTemporary(captureWidth, captureHeight, 24);
            RenderTexture previousTarget = cam.targetTexture;
            RenderTexture previousActive = RenderTexture.active;

            cam.targetTexture = tempRT;
            cam.Render();

            RenderTexture.active = tempRT;
            Texture2D texture = new Texture2D(captureWidth, captureHeight, TextureFormat.RGB24, false);
            texture.ReadPixels(new Rect(0, 0, captureWidth, captureHeight), 0, 0);
            texture.Apply();

            cam.targetTexture = previousTarget;
            RenderTexture.active = previousActive;
            RenderTexture.ReleaseTemporary(tempRT);

            onCaptured?.Invoke(texture);
        }

        private Camera ResolveCamera()
        {
            if (targetCamera != null)
            {
                return targetCamera;
            }

            if (Camera.main != null)
            {
                return Camera.main;
            }

            return FindFirstObjectByType<Camera>();
        }

        /// <summary>
        /// Encodes a Texture2D into a Base64 data string.
        /// </summary>
        public static string EncodeToBase64(Texture2D texture, bool asPng = true)
        {
            if (texture == null)
            {
                return string.Empty;
            }

            byte[] bytes = asPng ? texture.EncodeToPNG() : texture.EncodeToJPG();
            return Convert.ToBase64String(bytes);
        }
    }
}
