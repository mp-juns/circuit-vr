using UnityEngine;
using UnityEngine.XR.Interaction.Toolkit;
using UnityEngine.XR.Interaction.Toolkit.Interactables;
public enum BatteryPlugPolarity
{
    Plus,
    Minus
}
[RequireComponent(typeof(AudioSource))]


public class BatteryPlug : MonoBehaviour
{
    [Header("Settings")]
    public BatteryPlugPolarity polarity = BatteryPlugPolarity.Plus;
    public float snapThreshold = 0.1f;

    [Header("Audio SFX")]
    public AudioClip[] connectSounds;
    public AudioClip[] detachSounds;

    private BreadboardHole currentHoverHole = null; 
    public BreadboardHole ConnectedHole { get; private set; }
    private XRGrabInteractable grabInteractable;
    private AudioSource audioSource;
    private bool isGrabbed = false;
    private bool isConnected = false;

    void Awake()
    {
        grabInteractable = GetComponent<XRGrabInteractable>();
        grabInteractable.selectEntered.AddListener(OnGrab);
        grabInteractable.selectExited.AddListener(OnRelease);
        audioSource = GetComponent<AudioSource>();
    }

    // ★ 구멍에 닿았을 때 (하이라이트 켜기)
    void OnTriggerEnter(Collider other)
    {
        BreadboardHole hole = other.GetComponent<BreadboardHole>();
        
        // 새로운 구멍을 감지했다면?
        if (hole != null)
        {
            // 기존에 켜져있던 건 끄고
            if (currentHoverHole != null && currentHoverHole != hole)
            {
                SetHoleHighlight(currentHoverHole, false);
            }

            // 새 구멍을 켭니다! (초록색 불)
            currentHoverHole = hole;
            SetHoleHighlight(currentHoverHole, true);
        }
    }

    // ★ 구멍에서 나갔을 때 (하이라이트 끄기)
    void OnTriggerExit(Collider other)
    {
        BreadboardHole hole = other.GetComponent<BreadboardHole>();
        
        if (hole != null && hole == currentHoverHole)
        {
            SetHoleHighlight(currentHoverHole, false);
            currentHoverHole = null;
        }
    }

    private void OnGrab(SelectEnterEventArgs args)
    {
        if (isConnected)
        {
            PlayRandomSound(detachSounds);
            isConnected = false;
        }

        ConnectedHole = null;
        isGrabbed = true;
    }

    private void OnRelease(SelectExitEventArgs args)
    {
        isGrabbed = false;
        TrySnap();
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

    private void TrySnap()
    {
        if (currentHoverHole != null)
        {
            float dist = Vector3.Distance(transform.position, currentHoverHole.transform.position);

            if (dist <= snapThreshold)
            {
                // 1. 위치 이동 (꽂기)
                transform.position = currentHoverHole.transform.position;
                isConnected = true;
                ConnectedHole = currentHoverHole;
                PlayRandomSound(connectSounds);
                
                // 2. 꽂혔으면 하이라이트는 끄는 게 깔끔합니다. 
                // (계속 켜두고 싶으면 이 줄을 주석 처리하세요)
                SetHoleHighlight(currentHoverHole, false); 
                currentHoverHole = null;

                Debug.Log("[BatteryPlug] 연결 완료!");
            }
        }
    }

    // Breadboard 스크립트의 하이라이트 기능을 호출하는 헬퍼 함수
    void SetHoleHighlight(BreadboardHole hole, bool on)
    {
        if (hole != null && hole.board != null)
        {
            hole.board.SetHighlight(hole, on);
        }
    }
}
