using UnityEngine;

namespace Achoo
{
    /// <summary>
    /// 회로 분석 결과 + 물리적 연결 상태에 따라 조명, 파티클, 소리를 제어합니다.
    /// </summary>
    [RequireComponent(typeof(AudioSource))] // 오디오 소스 컴포넌트 필수 추가
    public class LEDPowerVisualizer : MonoBehaviour
    {
        [Header("References")]
        [SerializeField] private CircuitAnalyzer circuitAnalyzer;
        private ElementConfig elementConfig;

        [Header("Light Settings")]
        [Tooltip("제어할 조명 컴포넌트")]
        [SerializeField] private Light statusLight; 

        [Header("Effects")]
        [Tooltip("불이 켜질 때 재생할 파티클 (Loop는 끄는 것을 권장)")]
        [SerializeField] private ParticleSystem successParticle;
        [Tooltip("불이 켜질 때 재생할 효과음")]
        [SerializeField] private AudioClip successSound;

        private AudioSource _audioSource;
        private bool isCircuitCorrect; // AI가 정답이라고 했는지
        private bool _wasOn = false;   // 바로 직전 프레임에 불이 켜져 있었는지 (상태 변화 감지용)

        private void Start()
        {
            _audioSource = GetComponent<AudioSource>();

            // CircuitAnalyzer 자동 찾기
            if (circuitAnalyzer == null)
            {
                circuitAnalyzer = FindFirstObjectByType<CircuitAnalyzer>();
            }

            // ElementConfig 자동 찾기
            if (elementConfig == null)
            {
                elementConfig = GetComponentInParent<ElementConfig>();
            }

            // 이벤트 연결
            if (circuitAnalyzer != null)
            {
                circuitAnalyzer.OnCircuitValid.AddListener(OnCircuitValid);
                circuitAnalyzer.OnCircuitInvalid.AddListener(OnCircuitInvalid);
            }

            // 초기 상태 설정
            UpdateLightState();
        }

        private void Update()
        {
            UpdateLightState();
        }

        private void OnDestroy()
        {
            if (circuitAnalyzer != null)
            {
                circuitAnalyzer.OnCircuitValid.RemoveListener(OnCircuitValid);
                circuitAnalyzer.OnCircuitInvalid.RemoveListener(OnCircuitInvalid);
            }
        }

        public void OnCircuitValid()
        {
            isCircuitCorrect = true;
            UpdateLightState();
        }

        public void OnCircuitInvalid()
        {
            isCircuitCorrect = false;
            UpdateLightState();
        }

        private void UpdateLightState()
        {
            if (statusLight == null) return;

            // 1. 현재 불이 켜져야 하는 상황인지 판단
            bool isPhysicallyPlaced = elementConfig != null && elementConfig.IsPlacedOnBoard;
            bool shouldBeOn = isCircuitCorrect && isPhysicallyPlaced;

            // 2. 조명 상태 적용
            statusLight.enabled = shouldBeOn;

            // 3. 상태 변화 감지 (꺼져 있다가 -> 켜지는 순간!)
            if (shouldBeOn && !_wasOn)
            {
                PlaySuccessEffects();
            }
            // (옵션) 켜져 있다가 -> 꺼지는 순간 파티클 멈추기
            else if (!shouldBeOn && _wasOn)
            {
                if (successParticle != null) successParticle.Stop();
            }

            // 현재 상태 기억 (다음 프레임 비교용)
            _wasOn = shouldBeOn;
        }

        private void PlaySuccessEffects()
        {
            // 파티클 재생
            if (successParticle != null)
            {
                successParticle.Play();
            }

            // 소리 재생
            if (_audioSource != null && successSound != null)
            {
                _audioSource.PlayOneShot(successSound);
            }
        }
    }
}