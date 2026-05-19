using System.Collections.Generic;
using UnityEngine;
using UnityEngine.XR.Interaction.Toolkit; // XR 관련 네임스페이스 명시

namespace Achoo
{
    // 이 스크립트를 넣으면 자동으로 AudioSource 컴포넌트도 추가되도록 함
    [RequireComponent(typeof(AudioSource))] 
    public class TrashBin : MonoBehaviour
    {
        [Header("Settings")]
        [Tooltip("삭제될 때 재생할 효과음")]
        [SerializeField] private AudioClip deleteSound; // 효과음 파일 연결 변수

        private AudioSource _audioSource;

        // 트리거 안에 들어온 후보 소자들
        private readonly HashSet<ElementConfig> _candidates = new HashSet<ElementConfig>();

        private void Awake()
        {
            // 같은 오브젝트에 있는 AudioSource 컴포넌트 가져오기
            _audioSource = GetComponent<AudioSource>();
        }

        private void OnTriggerEnter(Collider other)
        {
            var element = other.GetComponentInParent<ElementConfig>();
            if (element != null)
            {
                _candidates.Add(element);
            }
        }

        private void OnTriggerExit(Collider other)
        {
            var element = other.GetComponentInParent<ElementConfig>();
            if (element != null)
            {
                _candidates.Remove(element);
            }
        }

        private void Update()
        {
            if (_candidates.Count == 0) return;

            // 순회 중 컬렉션 수정 방지용 임시 리스트
            var toRemove = new List<ElementConfig>();

            foreach (var element in _candidates)
            {
                if (element == null)
                {
                    toRemove.Add(element);
                    continue;
                }

                // XR Interaction Toolkit 버전에 따라 네임스페이스가 다를 수 있으나, 기존 코드 유지
                var grab = element.GetComponent<UnityEngine.XR.Interaction.Toolkit.Interactables.XRGrabInteractable>();

                // XRGrabInteractable 없거나, 현재 안 잡혀 있고, 여전히 트리거 안에 있을 때 삭제
                if (grab == null || !grab.isSelected)
                {
                    // 1. 효과음 재생 (소리가 없어도 에러 안 나게 null 체크)
                    if (_audioSource != null && deleteSound != null)
                    {
                        _audioSource.PlayOneShot(deleteSound);
                    }

                    Debug.Log($"[TrashBin] 요소 삭제: {element.gameObject.name}");
                    
                    // 2. 오브젝트 파괴
                    Destroy(element.gameObject);
                    toRemove.Add(element);
                }
            }

            // 삭제된 애들은 후보 목록에서도 제거
            foreach (var element in toRemove)
            {
                _candidates.Remove(element);
            }
        }
    }
}