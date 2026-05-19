using UnityEngine;

/// <summary>
/// Wire 모드와 Element 모드를 관리하는 싱글톤 매니저
/// </summary>
public class ModeManager : MonoBehaviour
{
    public static ModeManager Instance { get; private set; }

    public enum Mode
    {
        None,
        Wire,
        Element
    }

    private Mode currentMode = Mode.None;

    public Mode CurrentMode => currentMode;

    public bool IsWireMode => currentMode == Mode.Wire;
    public bool IsElementMode => currentMode == Mode.Element;

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

    /// <summary>
    /// Wire 모드로 전환
    /// </summary>
    public void SetWireMode()
    {
        currentMode = Mode.Wire;
        Debug.Log("[ModeManager] Wire 모드 활성화");
    }

    /// <summary>
    /// Element 모드로 전환
    /// </summary>
    public void SetElementMode()
    {
        currentMode = Mode.Element;
        Debug.Log("[ModeManager] Element 모드 활성화");
    }

    /// <summary>
    /// 모든 모드 비활성화
    /// </summary>
    public void ClearMode()
    {
        currentMode = Mode.None;
        Debug.Log("[ModeManager] 모든 모드 비활성화");
    }
}
