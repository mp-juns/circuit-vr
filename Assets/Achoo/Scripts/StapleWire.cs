using UnityEngine;

[RequireComponent(typeof(LineRenderer))]
public class StapleWire : MonoBehaviour
{
    [Header("Connection")]
    public Transform startPoint; // 배터리 쪽
    public Transform endPoint;   // 손잡이 쪽

    [Header("Appearance")]
    [Tooltip("전선 두께 (기존 0.004는 너무 얇음, 0.01 추천)")]
    public float wireWidth = 0.01f; // 여기서 조절하세요!

    [Header("Shape Settings")]
    [Tooltip("마지막에 꽂힐 때의 수직 높이")]
    public float dropHeight = 0.05f; 

    [Tooltip("전선이 오른쪽/왼쪽으로 휘는 정도 (양수:오른쪽, 음수:왼쪽)")]
    public float sideCurve = 0.05f; 

    [Tooltip("전선의 부드러움 (점 개수) - 높을수록 둥글게 보임")]
    public int resolution = 20;

    private LineRenderer lr;

    void Awake()
    {
        lr = GetComponent<LineRenderer>();
        lr.positionCount = resolution;
        lr.useWorldSpace = true;
        
        // 2D 스티커처럼 안 보이게 하려면 너비를 조금 줄이는 게 좋습니다.
        lr.startWidth = wireWidth;
        lr.endWidth = wireWidth;
    }

    void LateUpdate()
    {
        if (startPoint == null || endPoint == null) return;

        DrawWire();
    }

    void DrawWire()
    {
        Vector3 pStart = startPoint.position; // 시작점
        Vector3 pEnd = endPoint.position;     // 끝점 (구멍)

        // [핵심 로직] 제어점(Control Points) 4개 만들기
        
        // P0: 시작점 (배터리)
        Vector3 p0 = pStart;

        // P3: 끝점 (구멍)
        Vector3 p3 = pEnd;

        // P2: 끝점 바로 위 (수직 하강을 위한 점)
        // 구멍 바로 위에 점을 찍어서 마지막엔 무조건 수직으로 떨어지게 함
        Vector3 p2 = pEnd + Vector3.up * dropHeight;

        // P1: 중간 곡선 점 (3D 입체감 만들기)
        // 시작점과 P2 사이의 중간 지점을 구하고,
        // 거기서 옆으로(Right) 살짝 밀어서 전선이 회전한 것처럼 보이게 함
        Vector3 mid = (p0 + p2) / 2f;
        
        // 시작점에서 끝점을 바라보는 방향의 오른쪽 벡터 계산
        Vector3 forward = (pEnd - pStart).normalized;
        Vector3 right = Vector3.Cross(Vector3.up, forward).normalized;

        // 중간점을 위로 조금 올리고, 옆으로 밈 (sideCurve)
        Vector3 p1 = mid + (Vector3.up * (dropHeight * 0.5f)) + (right * sideCurve);

        // 베지에 곡선으로 점들 채우기
        for (int i = 0; i < resolution; i++)
        {
            float t = i / (float)(resolution - 1);
            Vector3 position = CalculateCubicBezier(t, p0, p1, p2, p3);
            lr.SetPosition(i, position);
        }
    }

    // 3차 베지에 곡선 공식 (점 4개 사용)
    Vector3 CalculateCubicBezier(float t, Vector3 p0, Vector3 p1, Vector3 p2, Vector3 p3)
    {
        float u = 1 - t;
        float tt = t * t;
        float uu = u * u;
        float uuu = uu * u;
        float ttt = tt * t;

        Vector3 p = uuu * p0; // (1-t)^3 * P0
        p += 3 * uu * t * p1; // 3(1-t)^2 * t * P1
        p += 3 * u * tt * p2; // 3(1-t) * t^2 * P2
        p += ttt * p3;        // t^3 * P3

        return p;
    }
}