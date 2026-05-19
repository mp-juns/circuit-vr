using UnityEngine;
#if ENABLE_INPUT_SYSTEM
using UnityEngine.InputSystem; // 새 인풋 시스템
#endif

public class ClickPicker : MonoBehaviour
{
    public Camera cam;                  // 비워두면 자동 MainCamera
    public LayerMask holeMask;          // Hole 레이어만 맞추기

    void Awake()
    {
        if (!cam) cam = Camera.main;
    }

    void Update()
    {
        // 1) 마우스 다운 감지
        bool down =
        #if ENABLE_INPUT_SYSTEM
            Mouse.current != null && Mouse.current.leftButton.wasPressedThisFrame;
        #else
            Input.GetMouseButtonDown(0);
        #endif
        if (!down || cam == null) return;

        // 2) 화면→레이
        Ray ray = cam.ScreenPointToRay(Mouse.current != null ? Mouse.current.position.ReadValue() : (Vector2)Input.mousePosition);

        // 3) 레이캐스트 (Hole 레이어만)
        if (Physics.Raycast(ray, out var hit, 100f, holeMask))
        {
            var hole = hit.collider.GetComponent<BreadboardHole>();
            if (hole != null) hole.Press(); // 우리가 만든 함수 호출
        }
    }
}
