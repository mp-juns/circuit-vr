using System.Collections; // 코루틴 사용
using System.Collections.Generic; // 리스트 사용을 위해 필수
using UnityEngine;

namespace Achoo
{
    /// <summary>
    /// GPT 검증 결과에 따라 리스트에 등록된 효과음과 파티클들을 재생합니다.
    /// </summary>
    public sealed class GptFeedbackEffects : MonoBehaviour
    {
        [Header("Audio Source Reference")]
        [Tooltip("효과음을 재생할 오디오 소스")]
        [SerializeField] private AudioSource oneShotSource;
        [Tooltip("성공 상태 동안 루프 재생할 소스 (선택 사항)")]
        [SerializeField] private AudioSource successLoopSource;

        [Header("✅ Success Settings (성공)")]
        [Tooltip("성공 시 재생할 파티클 목록 (원하는 만큼 추가)")]
        [SerializeField] private List<ParticleSystem> successParticles;
        [Tooltip("성공 시 재생할 효과음 목록 (동시에 재생됨)")]
        [SerializeField] private List<AudioClip> successSounds;

        [Header("❌ Failure Settings (실패)")]
        [Tooltip("실패 시 재생할 파티클 목록")]
        [SerializeField] private List<ParticleSystem> failParticles;
        [Tooltip("실패 시 재생할 효과음 목록")]
        [SerializeField] private List<AudioClip> failSounds;

        [Header("Debug")]
        [Tooltip("테스트용: 체크하면 콘솔에 로그를 남깁니다.")]
        [SerializeField] private bool debugMode = false;

        private Coroutine autoStopRoutine;

        // 에디터 테스트용 버튼 (인스펙터 컨텍스트 메뉴)
        [ContextMenu("Test Success")]
        private void TestSuccess() => OnGptResult(true);

        [ContextMenu("Test Failure")]
        private void TestFailure() => OnGptResult(false);

        private void Awake()
        {
            if (oneShotSource == null)
            {
                oneShotSource = GetComponent<AudioSource>();
            }
        }

        /// <summary>
        /// 외부에서 호출하는 함수 (True: 성공 효과, False: 실패 효과)
        /// </summary>
        public void OnGptResult(bool isSuccess)
        {
            if (isSuccess)
            {
                PlaySuccess();
            }
            else
            {
                PlayFailure();
            }
        }

        private void PlaySuccess()
        {
            if (debugMode) Debug.Log("[GptFeedbackEffects] Success Effect Triggered");

            // 1. 실패 효과(파티클) 정리
            StopParticles(failParticles);

            // 2. 성공 효과 재생
            PlayParticles(successParticles);
            PlaySounds(successSounds);

            StartAutoStopTimer();
        }

        private void PlayFailure()
        {
            if (debugMode) Debug.Log("[GptFeedbackEffects] Failure Effect Triggered");

            // 1. 성공 효과(파티클) 정리
            StopParticles(successParticles);

            // 2. 실패 효과 재생
            PlayParticles(failParticles);
            PlaySounds(failSounds);

            StartAutoStopTimer();
        }

        // --- Helper Methods ---

        /// <summary>
        /// 외부 리셋 버튼에서 호출하여 모든 효과를 즉시 정지/초기화합니다.
        /// </summary>
        public void StopAllEffects()
        {
            StopAutoStopTimer();
            StopParticles(successParticles);
            StopParticles(failParticles);

            if (oneShotSource != null)
            {
                oneShotSource.Stop();
            }

            if (successLoopSource != null)
            {
                successLoopSource.Stop();
            }
        }

        private void PlayParticles(List<ParticleSystem> particles)
        {
            if (particles == null) return;

            foreach (var ps in particles)
            {
                if (ps != null)
                {
                    ps.Play(true); // true: 자식 파티클까지 함께 재생
                }
            }
        }

        private void StopParticles(List<ParticleSystem> particles)
        {
            if (particles == null) return;

            foreach (var ps in particles)
            {
                if (ps == null) continue;

                // StopEmittingAndClear: 나오던 거 싹 지우고 멈춤
                ps.Stop(true, ParticleSystemStopBehavior.StopEmittingAndClear);
            }
        }

        private void PlaySounds(List<AudioClip> clips)
        {
            if (clips == null || oneShotSource == null) return;

            foreach (var clip in clips)
            {
                if (clip != null)
                {
                    oneShotSource.PlayOneShot(clip);
                }
            }
        }

        private void StartAutoStopTimer()
        {
            StopAutoStopTimer();
            autoStopRoutine = StartCoroutine(AutoStopAfterDelay());
        }

        private void StopAutoStopTimer()
        {
            if (autoStopRoutine != null)
            {
                StopCoroutine(autoStopRoutine);
                autoStopRoutine = null;
            }
        }

        private IEnumerator AutoStopAfterDelay()
        {
            yield return new WaitForSeconds(10f);
            StopAllEffects();
            autoStopRoutine = null;
        }

        private void OnDisable()
        {
            StopAllEffects();
        }
    }
}
