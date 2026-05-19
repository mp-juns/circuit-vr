using UnityEngine;
using Achoo;

public class CircuitClearManager : MonoBehaviour
{
    [Header("References")]
    [Tooltip("씬에 있는 Breadboard 오브젝트를 연결하세요")]
    [SerializeField] private Breadboard breadboard;

    /// <summary>
    /// UI 버튼에 연결할 함수
    /// </summary>
    public void OnClearButtonClicked()
    {
        // 1. 와이어 삭제
        if (breadboard != null)
        {
            breadboard.ClearAllWires();
        }

        // 2. 소자(부품) 삭제
        // 씬에 있는 모든 소자를 검사합니다.
        ElementConfig[] allElements = FindObjectsByType<ElementConfig>(FindObjectsSortMode.None);
        
        int count = 0;
        foreach (var element in allElements)
        {
            // 아까 만든 IsPlacedOnBoard가 true인 것(꽂힌 것)만 삭제!
            // 내 손에 들고 있거나, 책상 위에 굴러다니는 건 안 지워짐.
            if (element.IsPlacedOnBoard)
            {
                Destroy(element.gameObject);
                count++;
            }
        }

        Debug.Log($"[CircuitClearManager] 초기화 완료! (소자 {count}개 삭제됨)");
    }
}