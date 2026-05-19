using UnityEngine;
using UnityEngine.XR.Interaction.Toolkit;
using UnityEngine.XR.Interaction.Toolkit.Interactors;

namespace Achoo
{
    /// <summary>
    /// Forces the XR Ray Interactor to send Activate events to hovered holes so the trigger alone can click them.
    /// </summary>
    [DisallowMultipleComponent]
    [RequireComponent(typeof(XRRayInteractor))]
    public sealed class RayHoverActivatorConfigurator : MonoBehaviour
    {
        [SerializeField] private LayerMask holeRaycastMask = 0;
        [SerializeField] private string holeInteractionLayer = "Holes";

        XRRayInteractor rayInteractor;

        void Awake()
        {
            rayInteractor = GetComponent<XRRayInteractor>();
            if (holeRaycastMask == 0)
                holeRaycastMask = LayerMask.GetMask("Hole");
        }

        void OnEnable()
        {
            ApplySettings();
        }

#if UNITY_EDITOR
        void OnValidate()
        {
            if (!isActiveAndEnabled)
                return;
            ApplySettings();
        }
#endif

        void ApplySettings()
        {
            if (rayInteractor == null)
                rayInteractor = GetComponent<XRRayInteractor>();

            rayInteractor.allowHoveredActivate = true;
            if (holeRaycastMask != 0)
                rayInteractor.raycastMask = holeRaycastMask;

            if (!string.IsNullOrEmpty(holeInteractionLayer))
                rayInteractor.interactionLayers = InteractionLayerMask.GetMask(holeInteractionLayer);
        }
    }
}
