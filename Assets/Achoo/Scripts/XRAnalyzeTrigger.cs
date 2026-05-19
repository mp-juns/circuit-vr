using UnityEngine;
using UnityEngine.InputSystem;
using UnityEngine.Events;

namespace Achoo
{
    /// <summary>
    /// Listens for an Input System action and triggers CircuitAnalyzer when performed.
    /// Typical Quest 3 left-hand X binding: "<XRController>{LeftHand}/primaryButton".
    /// </summary>
    public class XRAnalyzeTrigger : MonoBehaviour
    {
        [SerializeField] private CircuitAnalyzer analyzer;
        [SerializeField] private InputActionReference analyzeAction;

        [SerializeField] private CircuitAnalysisUI analysisUI;
        public UnityEvent onAnalyzeStart;

        private void OnEnable()
        {
            if (analyzeAction == null || analyzeAction.action == null)
            {
                Debug.LogWarning("[XRAnalyzeTrigger] analyzeAction is not assigned or has no action.");
                return;
            }

            analyzeAction.action.Enable();
            analyzeAction.action.performed += OnAnalyzePerformed;
        }

        private void OnDisable()
        {
            if (analyzeAction != null && analyzeAction.action != null)
            {
                analyzeAction.action.performed -= OnAnalyzePerformed;
                analyzeAction.action.Disable();
            }
        }

        private void OnAnalyzePerformed(InputAction.CallbackContext ctx)
        {
            // ✅ UI에 "분석 중..." 먼저 띄우기
            if (analysisUI != null)
            {
                analysisUI.ShowAnalyzing();
            }

            onAnalyzeStart?.Invoke();

            if (analyzer != null)
            {
                analyzer.AnalyzeCurrentCircuit();
            }
            else
            {
                Debug.LogWarning("[XRAnalyzeTrigger] CircuitAnalyzer reference is missing.");
            }
        }
    }
}
