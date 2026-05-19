using System.Collections.Generic;
using UnityEngine;

public class BreadboardHole : MonoBehaviour
{
    [Tooltip("같은 보드의 Breadboard 컴포넌트")]
    public Breadboard board;

    static readonly List<BreadboardHole> registeredHoles = new List<BreadboardHole>();
    public static IReadOnlyList<BreadboardHole> RegisteredHoles => registeredHoles;

    void Awake()
    {
        if (board == null)
        {
            board = GetComponentInParent<Breadboard>();
            if (board == null)
            {
                Debug.LogWarning($"[BreadboardHole] {name} could not find a Breadboard in parents. Check hierarchy.");
            }
        }
    }

#if UNITY_EDITOR
    void OnValidate()
    {
        if (board == null)
        {
            board = GetComponentInParent<Breadboard>();
        }
    }
#endif

    // 에디터/PC에서 마우스로 바로 테스트(콜라이더 필요)
    void OnMouseDown()
    {
        // OnMouseDown은 콜라이더가 있어야 동작함
        // (Unity 공식 설명 참조)
        Press();
    }

    void OnEnable()
    {
        if (!registeredHoles.Contains(this))
        {
            registeredHoles.Add(this);
        }
    }

    void OnDisable()
    {
        registeredHoles.Remove(this);
    }

    // XR의 Select Entered 이벤트에서 이 메서드를 호출하도록 연결하면 됨
    public void Press()
    {
        Debug.Log($"[BreadboardHole] Press: {name}, board={(board ? board.name : "NULL")}");
        if (board != null)
        {
            board.OnHolePressed(this);
        }
    }
}
