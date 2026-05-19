using System.Collections.Generic;
using UnityEngine;

/// <summary>
/// Hole GameObject Object Pool
///
/// 목적:
/// - Instantiate/Destroy 대신 재사용으로 성능 개선
/// - GC(Garbage Collection) 부하 감소
/// - 메모리 할당/해제 최소화
///
/// 사용 방법:
/// 1. OptimizedBreadboardController에 HoleObjectPool 추가
/// 2. CreateTemporaryHole에서 Instantiate 대신 pool.GetHole() 사용
/// 3. CleanupTemporaryHoles에서 Destroy 대신 pool.ReturnHole() 사용
/// </summary>
public class HoleObjectPool : MonoBehaviour
{
    [Header("▼ Pool Settings")]
    [Tooltip("Hole Prefab (HoleData 컴포넌트 필요)")]
    public GameObject holePrefab;

    [Tooltip("초기 풀 크기 (시작 시 미리 생성할 개수)")]
    public int initialPoolSize = 10;

    [Tooltip("최대 풀 크기 (0 = 무제한)")]
    public int maxPoolSize = 50;

    [Header("▼ Debug")]
    [Tooltip("디버그 로그 활성화")]
    public bool enableDebugLog = false;

    [Tooltip("풀 상태를 UI로 표시")]
    public bool showPoolStatus = false;

    // 내부 풀 (Queue 사용 - FIFO)
    private Queue<GameObject> availablePool = new Queue<GameObject>();

    // 사용 중인 오브젝트 추적 (디버그용)
    private HashSet<GameObject> activeObjects = new HashSet<GameObject>();

    // 통계
    private int totalCreated = 0;
    private int currentActive = 0;
    private int peakActive = 0;

    void Start()
    {
        if (holePrefab == null)
        {
            Debug.LogError("[HoleObjectPool] Hole Prefab is not assigned!");
            return;
        }

        // 초기 풀 생성
        InitializePool();

        if (enableDebugLog)
        {
            Debug.Log($"[HoleObjectPool] Initialized with {initialPoolSize} objects");
        }
    }

    /// <summary>
    /// 초기 풀 생성
    /// </summary>
    private void InitializePool()
    {
        for (int i = 0; i < initialPoolSize; i++)
        {
            GameObject hole = CreateNewHole();
            hole.SetActive(false);
            availablePool.Enqueue(hole);
        }

        totalCreated = initialPoolSize;
    }

    /// <summary>
    /// 새 Hole GameObject 생성 (Instantiate)
    /// </summary>
    private GameObject CreateNewHole()
    {
        GameObject hole = Instantiate(holePrefab, transform);
        hole.name = $"PooledHole_{totalCreated}";

        // HoleData 컴포넌트 확인
        if (!hole.GetComponent<HoleData>())
        {
            Debug.LogWarning("[HoleObjectPool] Hole Prefab missing HoleData component!");
        }

        return hole;
    }

    /// <summary>
    /// 풀에서 Hole 가져오기
    /// </summary>
    public GameObject GetHole()
    {
        GameObject hole;

        // 풀에 사용 가능한 오브젝트가 있으면 재사용
        if (availablePool.Count > 0)
        {
            hole = availablePool.Dequeue();
            hole.SetActive(true);

            if (enableDebugLog)
            {
                Debug.Log($"[HoleObjectPool] Reused hole from pool (Available: {availablePool.Count})");
            }
        }
        else
        {
            // 풀이 비어있으면 새로 생성 (최대 크기 체크)
            if (maxPoolSize > 0 && totalCreated >= maxPoolSize)
            {
                Debug.LogWarning($"[HoleObjectPool] Max pool size reached ({maxPoolSize})! Forcing reuse.");
                // 긴급 상황: 가장 오래된 활성 오브젝트 강제 재사용
                hole = ForceReuseOldest();
            }
            else
            {
                hole = CreateNewHole();
                hole.SetActive(true);
                totalCreated++;

                if (enableDebugLog)
                {
                    Debug.Log($"[HoleObjectPool] Created new hole (Total: {totalCreated})");
                }
            }
        }

        // 사용 중 추적
        activeObjects.Add(hole);
        currentActive = activeObjects.Count;

        // 피크 기록
        if (currentActive > peakActive)
        {
            peakActive = currentActive;
        }

        return hole;
    }

    /// <summary>
    /// Hole을 풀로 반환
    /// </summary>
    public void ReturnHole(GameObject hole)
    {
        if (hole == null)
        {
            Debug.LogWarning("[HoleObjectPool] Attempted to return null hole");
            return;
        }

        // 이미 반환된 오브젝트인지 체크
        if (!activeObjects.Contains(hole))
        {
            Debug.LogWarning($"[HoleObjectPool] Hole {hole.name} was not retrieved from pool or already returned");
            return;
        }

        // 비활성화
        hole.SetActive(false);

        // 위치 초기화 (선택사항)
        hole.transform.localPosition = Vector3.zero;
        hole.transform.localRotation = Quaternion.identity;

        // 풀에 반환
        availablePool.Enqueue(hole);

        // 추적 제거
        activeObjects.Remove(hole);
        currentActive = activeObjects.Count;

        if (enableDebugLog)
        {
            Debug.Log($"[HoleObjectPool] Returned hole to pool (Available: {availablePool.Count}, Active: {currentActive})");
        }
    }

    /// <summary>
    /// 여러 Hole을 한번에 반환
    /// </summary>
    public void ReturnHoles(params GameObject[] holes)
    {
        foreach (var hole in holes)
        {
            if (hole != null)
            {
                ReturnHole(hole);
            }
        }
    }

    /// <summary>
    /// 모든 활성 Hole을 풀로 반환
    /// </summary>
    public void ReturnAllActiveHoles()
    {
        // activeObjects를 복사 (순회 중 수정 방지)
        GameObject[] activeArray = new GameObject[activeObjects.Count];
        activeObjects.CopyTo(activeArray);

        foreach (var hole in activeArray)
        {
            ReturnHole(hole);
        }

        if (enableDebugLog)
        {
            Debug.Log($"[HoleObjectPool] Returned all active holes ({activeArray.Length})");
        }
    }

    /// <summary>
    /// 가장 오래된 활성 오브젝트 강제 재사용 (긴급 상황)
    /// </summary>
    private GameObject ForceReuseOldest()
    {
        // activeObjects에서 첫 번째 찾기
        GameObject oldest = null;
        foreach (var hole in activeObjects)
        {
            oldest = hole;
            break;
        }

        if (oldest != null)
        {
            Debug.LogWarning($"[HoleObjectPool] Force reusing {oldest.name}");
            ReturnHole(oldest);
            return GetHole(); // 재귀 호출
        }

        // 최악의 경우 새로 생성 (maxPoolSize 무시)
        Debug.LogError("[HoleObjectPool] No active objects to reuse! Creating emergency object.");
        return CreateNewHole();
    }

    /// <summary>
    /// 풀 정리 (사용하지 않는 오브젝트 삭제)
    /// </summary>
    public void TrimPool(int targetSize)
    {
        int removed = 0;

        while (availablePool.Count > targetSize)
        {
            GameObject hole = availablePool.Dequeue();
            Destroy(hole);
            totalCreated--;
            removed++;
        }

        if (enableDebugLog && removed > 0)
        {
            Debug.Log($"[HoleObjectPool] Trimmed {removed} objects from pool");
        }
    }

    /// <summary>
    /// 풀 상태 정보 가져오기
    /// </summary>
    public PoolStatus GetStatus()
    {
        return new PoolStatus
        {
            availableCount = availablePool.Count,
            activeCount = currentActive,
            totalCreated = totalCreated,
            peakActive = peakActive
        };
    }

    /// <summary>
    /// 풀 상태 구조체
    /// </summary>
    public struct PoolStatus
    {
        public int availableCount;
        public int activeCount;
        public int totalCreated;
        public int peakActive;

        public override string ToString()
        {
            return $"Available: {availableCount}, Active: {activeCount}, Total: {totalCreated}, Peak: {peakActive}";
        }
    }

    /// <summary>
    /// OnGUI로 풀 상태 표시 (디버그)
    /// </summary>
    void OnGUI()
    {
        if (!showPoolStatus) return;

        var status = GetStatus();

        GUILayout.BeginArea(new Rect(10, 170, 300, 120));
        GUILayout.Label("<b>Hole Object Pool Status</b>");
        GUILayout.Label($"Available: {status.availableCount}");
        GUILayout.Label($"Active: {status.activeCount}");
        GUILayout.Label($"Total Created: {status.totalCreated}");
        GUILayout.Label($"Peak Active: {status.peakActive}");
        GUILayout.EndArea();
    }

    /// <summary>
    /// 에디터에서 풀 상태 확인 (Inspector)
    /// </summary>
    void OnValidate()
    {
        if (initialPoolSize < 0)
        {
            initialPoolSize = 0;
        }

        if (maxPoolSize < 0)
        {
            maxPoolSize = 0;
        }

        if (maxPoolSize > 0 && initialPoolSize > maxPoolSize)
        {
            initialPoolSize = maxPoolSize;
        }
    }

    /// <summary>
    /// 애플리케이션 종료 시 정리
    /// </summary>
    void OnApplicationQuit()
    {
        if (enableDebugLog)
        {
            var status = GetStatus();
            Debug.Log($"[HoleObjectPool] Final Stats - {status}");
        }
    }

    /// <summary>
    /// 씬 언로드 시 모든 풀 오브젝트 정리
    /// </summary>
    void OnDestroy()
    {
        // 모든 활성 오브젝트 반환
        ReturnAllActiveHoles();

        // 풀의 모든 오브젝트 삭제
        while (availablePool.Count > 0)
        {
            GameObject hole = availablePool.Dequeue();
            if (hole != null)
            {
                Destroy(hole);
            }
        }

        if (enableDebugLog)
        {
            Debug.Log("[HoleObjectPool] Destroyed all pooled objects");
        }
    }
}
