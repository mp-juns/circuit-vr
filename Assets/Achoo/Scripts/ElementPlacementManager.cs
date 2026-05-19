using System;
using UnityEngine;
using UnityEngine.XR.Interaction.Toolkit;
using UnityEngine.XR.Interaction.Toolkit.Interactors;
using UnityEngine.XR.Interaction.Toolkit.Interactables;

namespace Achoo
{
    /// <summary>
    /// Tracks the currently grabbed element (if any) so element placement can respond to hole clicks.
    /// </summary>
    [DefaultExecutionOrder(-200)]
    public sealed class ElementPlacementManager : MonoBehaviour
    {
        public static ElementPlacementManager Instance { get; private set; }

        /// <summary>
        /// Raised whenever the active grabbed element changes (including becoming null).
        /// </summary>
        public static event Action<ElementConfig> ActiveElementChanged;

        public ElementConfig CurrentElementConfig { get; private set; }
        public XRGrabInteractable CurrentGrabbedInteractable { get; private set; }
        public IXRSelectInteractor CurrentInteractor { get; private set; }

        void Awake()
        {
            if (Instance != null && Instance != this)
            {
                Destroy(gameObject);
                return;
            }

            Instance = this;
            DontDestroyOnLoad(gameObject);
        }

        public void NotifyElementGrabbed(ElementConfig config, XRGrabInteractable interactable, SelectEnterEventArgs args)
        {
            CurrentElementConfig = config;
            CurrentGrabbedInteractable = interactable;
            CurrentInteractor = args?.interactorObject as IXRSelectInteractor;
            ActiveElementChanged?.Invoke(CurrentElementConfig);
        }

        public void NotifyElementReleased(ElementConfig config)
        {
            if (config != CurrentElementConfig)
            {
                return;
            }

            ClearCurrentElement();
        }

        public void ForceReleaseCurrent()
        {
            if (CurrentGrabbedInteractable == null)
            {
                return;
            }

            var interactable = CurrentGrabbedInteractable;
            var interactor = CurrentInteractor;

            if (interactable.isSelected && interactor != null)
            {
                interactable.interactionManager?.SelectExit(interactor, interactable);
            }

            ClearCurrentElement();
        }

        void OnDestroy()
        {
            if (Instance == this)
            {
                Instance = null;
            }
        }

        void ClearCurrentElement()
        {
            CurrentInteractor = null;
            CurrentGrabbedInteractable = null;
            CurrentElementConfig = null;
            ActiveElementChanged?.Invoke(null);
        }
    }
}
