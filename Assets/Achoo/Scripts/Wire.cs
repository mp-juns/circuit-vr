using UnityEngine;

[RequireComponent(typeof(LineRenderer))]
public class Wire : MonoBehaviour
{
    [Header("Layer & Collision")]
    [SerializeField] private string wireLayerName = "Wire";
    [SerializeField] private bool disableCollidersOnSpawn = true;

    Transform a, b;
    float width, jumpHeight;
    LineRenderer lr;
    Vector3 lastAPosition;
    Vector3 lastBPosition;
    Vector3 lastUpDirection;
    bool hasCachedPositions;

    public BreadboardHole HoleA { get; private set; }
    public BreadboardHole HoleB { get; private set; }

    public void Init(BreadboardHole holeA, BreadboardHole holeB, float wireWidth, float height)
    {
        if (lr == null)
        {
            lr = GetComponent<LineRenderer>();
            if (lr == null)
            {
                Debug.LogError("[Wire] No LineRenderer found on this GameObject.");
                return;
            }
        }

        if (holeA == null || holeB == null)
        {
            Debug.LogError("[Wire] Init called with null A or B. Check Breadboard.OnHolePressed logic.");
            return;
        }

        HoleA = holeA;
        HoleB = holeB;
        a = holeA.transform;
        b = holeB.transform;
        width = wireWidth;
        jumpHeight = height; // '높이' 값을 받습니다.

        lr.useWorldSpace = true;
        lr.positionCount = 4; // 'ㄷ'자 모양을 위해 4개의 점이 필요합니다.
        lr.startWidth = lr.endWidth = width;

        ApplyLayerRecursively();
        UpdateLine(); // 즉시 라인을 그립니다.
    }

    public (BreadboardHole a, BreadboardHole b) GetEndpoints()
    {
        return (HoleA, HoleB);
    }


    void UpdateLine()
    {
        if (!a || !b) return; // 구멍이 없으면 실행 중지

        // '위' 방향을 월드 Vector3.up이 아닌,
        // 구멍(Hole)의 로컬 '위' 방향(transform.up)으로 설정합니다.
        // 이래야 브레드보드를 돌려도 와이어가 함께 돌아갑니다.
        Vector3 upDir = a.transform.up;

        // 4개의 점 위치를 계산합니다.
        Vector3 p0 = a.position; // 1. 첫 번째 구멍 위치
        Vector3 p1 = a.position + upDir * jumpHeight; // 2. 첫 번째 구멍에서 위로
        Vector3 p2 = b.position + upDir * jumpHeight; // 3. 두 번째 구멍에서 위로
        Vector3 p3 = b.position; // 4. 두 번째 구멍 위치

        // LineRenderer에 4개의 점 위치를 설정합니다.
        lr.SetPosition(0, p0);
        lr.SetPosition(1, p1);
        lr.SetPosition(2, p2);
        lr.SetPosition(3, p3);
    }

    void LateUpdate()
    {
        if (!a || !b)
        {
            return;
        }

        Vector3 upDir = a.transform.up;
        if (!hasCachedPositions ||
            a.position != lastAPosition ||
            b.position != lastBPosition ||
            upDir != lastUpDirection)
        {
            UpdateLine();
            lastAPosition = a.position;
            lastBPosition = b.position;
            lastUpDirection = upDir;
            hasCachedPositions = true;
        }
    }

    void ApplyLayerRecursively()
    {
        int wireLayer = LayerMask.NameToLayer(wireLayerName);
        if (wireLayer < 0)
        {
            Debug.LogWarning($"[Wire] Layer \"{wireLayerName}\" was not found. Please create it in Project Settings > Tags and Layers.");
            return;
        }

        foreach (Transform t in GetComponentsInChildren<Transform>(true))
        {
            t.gameObject.layer = wireLayer;
        }
    }
}
