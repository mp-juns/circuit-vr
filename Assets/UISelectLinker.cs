using UnityEngine;
using UnityEngine.UI;

public class UISelectLinker : MonoBehaviour
{
    [Header("Toggles")]
    public Toggle wireToggle;
    public Toggle elementToggle;

    [Header("Toggle Group (optional)")]
    public ToggleGroup toggleGroup;

    void Awake()
    {
        if (toggleGroup != null)
        {
            if (wireToggle != null) wireToggle.group = toggleGroup;
            if (elementToggle != null) elementToggle.group = toggleGroup;
        }
    }

    void Start()
    {
        if (wireToggle != null)
        {
            wireToggle.onValueChanged.AddListener(OnWireToggleChanged);
        }
        if (elementToggle != null)
        {
            elementToggle.onValueChanged.AddListener(OnElementToggleChanged);
        }
    }

    void OnDestroy()
    {
        if (wireToggle != null)
        {
            wireToggle.onValueChanged.RemoveListener(OnWireToggleChanged);
        }
        if (elementToggle != null)
        {
            elementToggle.onValueChanged.RemoveListener(OnElementToggleChanged);
        }
    }

    public void SelectWire()
    {
        if (wireToggle == null) return;
        wireToggle.isOn = true;
    }

    public void SelectElement()
    {
        if (elementToggle == null) return;
        elementToggle.isOn = true;
    }

    private void OnWireToggleChanged(bool isOn)
    {
        if (isOn && ModeManager.Instance != null)
        {
            ModeManager.Instance.SetWireMode();
        }
        else if (!isOn && ModeManager.Instance != null && ModeManager.Instance.IsWireMode)
        {
            ModeManager.Instance.ClearMode();
        }
    }

    private void OnElementToggleChanged(bool isOn)
    {
        if (isOn && ModeManager.Instance != null)
        {
            ModeManager.Instance.SetElementMode();
        }
        else if (!isOn && ModeManager.Instance != null && ModeManager.Instance.IsElementMode)
        {
            ModeManager.Instance.ClearMode();
        }
    }
}
