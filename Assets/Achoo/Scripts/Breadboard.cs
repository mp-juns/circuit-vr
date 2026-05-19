using UnityEngine;
using Achoo;
using System.Collections.Generic;

[RequireComponent(typeof(AudioSource))]
// Breadboard는 모드 구분 없이 레이 클릭(홀 누르기)만으로 와이어 연결을 관리하는 스크립트입니다.
public class Breadboard : MonoBehaviour
{
    [Header("Wire prefab & parent")]
    public Wire wirePrefab;
    public Transform wireContainer;

    [Header("Wire look")]
    public float wireWidth = 0.004f;
    public float wireJumpHeight = 0.05f;

    [Header("Audio SFX")]
    public AudioClip[] holeSelectSounds;
    public AudioClip[] wireConnectSounds;
    public AudioClip[] wireDeleteSounds;
    public AudioClip[] holeCancelSounds;

    [Header("Debug")]
    public bool enableDebugLogs = true;

    AudioSource audioSource;
    BreadboardHole first;



    

    // 두 홀을 잇는 와이어를 관리하는 맵 (키: 홀 쌍, 값: Wire)
    readonly Dictionary<string, Wire> wireMap = new Dictionary<string, Wire>();

    // 두 홀로부터 "순서에 상관없는" 키를 만드는 함수
    string GetPairKey(BreadboardHole h1, BreadboardHole h2)
    {
        if (h1 == null || h2 == null) return string.Empty;

        int id1 = h1.GetInstanceID();
        int id2 = h2.GetInstanceID();

        // A-B나 B-A나 같은 키가 나오도록 정렬
        if (id1 < id2)
            return $"{id1}_{id2}";
        else
            return $"{id2}_{id1}";
    }




    void Awake()
    {
        audioSource = GetComponent<AudioSource>();
    }

    /// <summary>
    /// 레이 인터랙션으로 전달된 홀 클릭을 받아 와이어 생성 절차를 시작합니다.
    /// </summary>
    public void OnHolePressed(BreadboardHole hole)
    {
        // 레이로 홀이 눌리면 항상 와이어 연결 흐름을 실행합니다.
        if (enableDebugLogs)
        {
            Debug.Log($"[Breadboard] OnHolePressed 호출됨 - Hole: {hole.name} (Instance ID: {hole.GetInstanceID()})");
        }

        HandleWireHolePressed(hole);
    }

    /// <summary>
    /// 홀의 Emission 컬러를 켜서 선택 상태를 시각적으로 표시합니다.
    /// </summary>
    public void SetHighlight(BreadboardHole hole, bool on)
    {
        if (!hole) return;
        if (hole.TryGetComponent<Renderer>(out var r) &&
            r.material.HasProperty("_EmissionColor"))
        {
            r.material.SetColor("_EmissionColor", on ? Color.green * 1.5f : Color.black);
            if (enableDebugLogs)
            {
                Debug.Log($"[Breadboard] Highlight {(on ? "ON" : "OFF")}: {hole.name}");
            }
        }
    }

    // 현재 상태 확인용 디버그 메서드
    [ContextMenu("Show Current State")]
    public void ShowCurrentState()
    {
        // 디버그용으로 현재 선택 상태와 프리팹 설정을 출력합니다.
        Debug.Log("=== Breadboard 현재 상태 ===");
        Debug.Log($"first: {(first == null ? "null (대기 중)" : $"{first.name} (Instance ID: {first.GetInstanceID()})")}");
        Debug.Log($"wirePrefab: {(wirePrefab == null ? "NULL - 설정 필요!" : wirePrefab.name)}");
        Debug.Log($"wireContainer: {(wireContainer == null ? "null (this.transform 사용)" : wireContainer.name)}");
        Debug.Log("========================");
    }

    void PlayRandomSound(AudioClip[] clips)
    {
        if (clips == null || clips.Length == 0 || audioSource == null)
        {
            return;
        }

        var clip = clips[Random.Range(0, clips.Length)];
        if (clip == null)
        {
            return;
        }

        audioSource.PlayOneShot(clip);
    }

    /// <summary>
    /// 첫 번째 클릭으로 홀을 기억하고, 두 번째 클릭으로 와이어를 생성한 뒤 선택 상태를 초기화합니다.
    /// </summary>
        /// <summary>
    /// 첫 번째 클릭으로 홀을 기억하고,
    /// 두 번째 클릭으로 와이어를 "토글(ON/OFF)" 한 뒤 선택 상태를 초기화합니다.
    /// </summary>
    void HandleWireHolePressed(BreadboardHole hole)
    {
        if (enableDebugLogs)
        {
            Debug.Log($"[Breadboard] 와이어 연결 처리 - 현재 first 상태: {(first == null ? "null" : first.name)}");
        }

        // 1) 아직 아무 홀도 선택 안 된 상태 → 첫 번째 홀 선택
        if (first == null)
        {
            first = hole;
            SetHighlight(first, true);
            PlayRandomSound(holeSelectSounds);

            if (enableDebugLogs)
            {
                Debug.Log($"[Breadboard] ✓ 첫 번째 홀 선택됨: {first.name} (Instance ID: {first.GetInstanceID()})");
            }
            return;
        }

        // 2) 같은 홀을 다시 누른 경우 → 선택만 취소 (토글X, 단순 취소)
        if (hole == first)
        {
            SetHighlight(first, false);
            PlayRandomSound(holeCancelSounds);
            if (enableDebugLogs)
            {
                Debug.Log($"[Breadboard] 첫 번째 홀 재클릭 → 선택 취소: {first.name}");
            }

            first = null;
            return;
        }

        // 3) 두 번째 홀을 눌렀을 때 → 두 홀 쌍 키 생성
        string key = GetPairKey(first, hole);
        if (string.IsNullOrEmpty(key))
        {
            if (enableDebugLogs)
            {
                Debug.LogWarning("[Breadboard] GetPairKey 결과가 비어 있습니다. 와이어 토글 실패.");
            }
            SetHighlight(first, false);
            first = null;
            return;
        }

        // 3-1) 이미 이 두 홀을 잇는 와이어가 있으면 → 삭제 (토글 OFF)
        if (wireMap.TryGetValue(key, out var existingWire) && existingWire != null)
        {
            if (enableDebugLogs)
            {
                Debug.Log($"[Breadboard] 이미 존재하는 와이어를 삭제(토글 OFF): {existingWire.name}");
            }

            Destroy(existingWire.gameObject);
            wireMap.Remove(key);
            PlayRandomSound(wireDeleteSounds);

            SetHighlight(first, false);
            first = null;

            if (enableDebugLogs)
            {
                Debug.Log("[Breadboard] 와이어 삭제 후 first 초기화 완료 (다음 클릭 대기 중)");
            }
            return;
        }

        // 3-2) 없으면 새로 생성 (토글 ON)
        if (enableDebugLogs)
        {
            Debug.Log($"[Breadboard] ★ 와이어 생성 시작!");
            Debug.Log($"  - 첫 번째 홀: {first.name} (Instance ID: {first.GetInstanceID()}, Position: {first.transform.position})");
            Debug.Log($"  - 두 번째 홀: {hole.name} (Instance ID: {hole.GetInstanceID()}, Position: {hole.transform.position})");
            Debug.Log($"  - wirePrefab: {(wirePrefab == null ? "NULL!!!" : wirePrefab.name)}");
            Debug.Log($"  - wireContainer: {(wireContainer == null ? "null (using this.transform)" : wireContainer.name)}");
        }

        var parent = wireContainer == null ? transform : wireContainer;
        var w = Instantiate(wirePrefab, parent);
        w.Init(first, hole, wireWidth, wireJumpHeight);
        PlayRandomSound(wireConnectSounds);

        // 새로 만든 와이어를 맵에 등록
        wireMap[key] = w;

        if (enableDebugLogs)
        {
            Debug.Log($"[Breadboard] ✓ 와이어 생성 완료: {w.name}");
        }

        SetHighlight(first, false);
        first = null;

        if (enableDebugLogs)
        {
            Debug.Log("[Breadboard] first 상태 초기화 완료 (다음 클릭 대기 중)");
        }
    }

    public void ClearAllWires()
    {
        foreach (var wire in wireMap.Values)
        {
            if (wire != null)
            {
                Destroy(wire.gameObject);
            }
        }
        wireMap.Clear();

        if (first != null)
        {
           SetHighlight(first, false);
           first = null;
        }
        
        Debug.Log("[Breadboard] 모든 와이어가 삭제되고 상태가 초기화되었습니다.");
    }

    public IEnumerable<(BreadboardHole a, BreadboardHole b, Wire wire)> GetAllWires()
    {
        foreach (var wire in wireMap.Values)
        {
            if (wire == null || wire.HoleA == null || wire.HoleB == null)
            {
                continue;
            }

            yield return (wire.HoleA, wire.HoleB, wire);
        }
    }

}
