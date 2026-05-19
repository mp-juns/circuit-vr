using UnityEngine;
using UnityEngine.XR.Interaction.Toolkit;
using UnityEngine.XR.Interaction.Toolkit.Interactables;

namespace Achoo
{
    /// <summary>
    /// 브레드보드 홀에 두 다리를 스냅으로 맞추도록 잡기/해제 이벤트와 스냅 계산을 담당합니다.
    /// </summary>
    [DisallowMultipleComponent]
    [RequireComponent(typeof(AudioSource))]
    [RequireComponent(typeof(XRGrabInteractable))]
    public sealed class ElementConfig : MonoBehaviour
    {
        [Header("Placement")]
        [Tooltip("이 부품을 배치할 때 필요한 홀 클릭 횟수입니다.")]
        public int usingHoleCount = 2;

        [Header("Magnetic Snapping")]
        [Tooltip("부품을 잡고 있을 때 실시간 스냅 미리보기를 활성화합니다.")]
        public bool enableMagneticSnap = true;
        [Tooltip("Sound to play when snapped")]
        public AudioClip snapSound;
        [Tooltip("Sound to play when detached/unplugged")]
        public AudioClip detachSound;
        [Tooltip("첫 번째 다리(핀)의 끝 위치에 배치된 트랜스폼입니다.")]
        public Transform legA;
        [Tooltip("두 번째 다리(핀)의 끝 위치에 배치된 트랜스폼입니다.")]
        public Transform legB;
        [Tooltip("스냅된 회전을 만들 때 사용할 업 벡터입니다.")]
        public Vector3 snapUp = Vector3.up;

        XRGrabInteractable grabInteractable;
        Rigidbody cachedRigidbody;
        AudioSource audioSource;
        Vector3 legALocalPosition;
        Vector3 legBLocalPosition;
        Quaternion referenceLegRotation = Quaternion.identity;
        bool hasValidSnapPose;
        Vector3 snapPosition;
        Quaternion snapRotation;
        bool suppressNextSnapFinalize;
        BreadboardHole currentHoleA;
        BreadboardHole currentHoleB;
        public BreadboardHole PlacedHoleA { get; private set; }
        public BreadboardHole PlacedHoleB { get; private set; }
        BreadboardHole lastPreviewHoleA;
        BreadboardHole lastPreviewHoleB;
        bool isPlaced = false;

        /// <summary>
        /// XR 인터랙션 이벤트 등록, 다리 기준 회전 계산, 트리거 릴레이 구성 등 초기 설정을 수행합니다.
        /// </summary>
        void Awake()
        {
            grabInteractable = GetComponent<XRGrabInteractable>();
            grabInteractable.selectEntered.AddListener(OnGrabbed);
            grabInteractable.selectExited.AddListener(OnReleased);
            cachedRigidbody = GetComponent<Rigidbody>();
            audioSource = GetComponent<AudioSource>();

            if (legA != null)
                legALocalPosition = legA.localPosition;
            if (legB != null)
                legBLocalPosition = legB.localPosition;

            if (legA != null && legB != null)
            {
                var localVector = legBLocalPosition - legALocalPosition;
                if (localVector.sqrMagnitude > 0.000001f)
                {
                    referenceLegRotation = Quaternion.LookRotation(localVector.normalized, Vector3.up);
                }
                else
                {
                    referenceLegRotation = Quaternion.identity;
                }
            }
            else
            {
                enableMagneticSnap = false;
                Debug.LogWarning("[ElementConfig] Missing leg references; magnetic snapping disabled.", this);
            }

            EnsureLegTriggerRelay(legA, true);
            EnsureLegTriggerRelay(legB, false);
        }

        /// <summary>
        /// 이벤트 핸들러와 스냅 상태를 정리합니다.
        /// </summary>
        void OnDestroy()
        {
            ClearSnapState(true);
            if (grabInteractable != null)
            {
                grabInteractable.selectEntered.RemoveListener(OnGrabbed);
                grabInteractable.selectExited.RemoveListener(OnReleased);
            }
        }

        /// <summary>
        /// 스냅 미리보기를 갱신하거나 조건이 안 맞으면 상태를 초기화합니다.
        /// </summary>
        void Update()
        {
            if (!enableMagneticSnap)
            {
                ClearSnapState(true);
                return;
            }

            if (!IsHeldByInteractor())
            {
                ClearSnapState(true);
                return;
            }

            EvaluateDualLegSnap();
        }

        /// <summary>
        /// 지정된 다리 트랜스폼에 트리거 릴레이가 붙어있는지 보장합니다.
        /// </summary>
        void EnsureLegTriggerRelay(Transform leg, bool isLegA)
        {
            if (leg == null)
                return;

            var relay = leg.GetComponent<LegTriggerRelay>();
            if (relay == null)
            {
                relay = leg.gameObject.AddComponent<LegTriggerRelay>();
            }

            relay.Initialize(this, isLegA);
        }

        /// <summary>
        /// 부품을 잡았을 때 리지드바디를 물리적으로 활성화하고 매니저에 알립니다.
        /// </summary>
        void OnGrabbed(SelectEnterEventArgs args)
        {
            if (isPlaced && detachSound != null && audioSource != null)
            {
                audioSource.PlayOneShot(detachSound);
            }

            if (isPlaced)
            {
                PlacedHoleA = null;
                PlacedHoleB = null;
            }

            isPlaced = false;

            if (cachedRigidbody != null) 
            {
                cachedRigidbody.isKinematic = false;
            }

            ElementPlacementManager.Instance?.NotifyElementGrabbed(this, grabInteractable, args);
        }

        /// <summary>
        /// 부품을 놓을 때 스냅이 유효하면 위치/회전을 적용하고 상태를 정리합니다.
        /// </summary>
        void OnReleased(SelectExitEventArgs _)
        {
            bool shouldSnap = enableMagneticSnap && hasValidSnapPose && !suppressNextSnapFinalize;
            Debug.Log($"[ElementConfig] OnReleased 처리: shouldSnap={shouldSnap}", this);
            suppressNextSnapFinalize = false;

            if (shouldSnap)
            {
                Debug.Log("[ElementConfig] ApplySnapPose를 호출하여 스냅 포즈를 적용합니다.", this);
                ApplySnapPose();
                SetPlacedHolesFromCurrent();
            }

            ClearSnapState(true);
            ElementPlacementManager.Instance?.NotifyElementReleased(this);
        }

        /// <summary>
        /// 계산된 스냅 포즈를 실제 트랜스폼에 반영하고 이동을 잠급니다.
        /// </summary>
        void ApplySnapPose()
        {
            transform.SetPositionAndRotation(snapPosition, snapRotation);
            LockInPlace();

            isPlaced = true;

            if (snapSound != null && audioSource != null)
            {
                audioSource.PlayOneShot(snapSound);
            }
        }

        /// <summary>
        /// 현재 부품이 인터랙터에 잡혀 있는지 확인합니다.
        /// </summary>
        bool IsHeldByInteractor()
        {
            return grabInteractable != null && grabInteractable.isSelected;
        }

        /// <summary>
        /// 다리 트리거가 홀에 진입했을 때 현재 홀 정보를 갱신하고 스냅 미리보기를 평가합니다.
        /// </summary>
        internal void HandleLegTriggerEnter(bool isLegA, Collider other)
        {
            if (!enableMagneticSnap)
            {
                hasValidSnapPose = false;
                Debug.Log("[ElementConfig] 자기장 스냅 비활성화 상태라 트리거를 무시합니다.", this);
                return;
            }

            if (!IsHeldByInteractor())
            {
                hasValidSnapPose = false;
                Debug.Log("[ElementConfig] 현재 잡혀 있지 않아 트리거를 무시합니다.", this);
                return;
            }

            var hole = GetHoleFromCollider(other);
            if (hole == null)
                return;

            if (isLegA)
            {
                if (currentHoleA == hole)
                    return;

                ReleaseLeg(ref currentHoleA);
                currentHoleA = hole;
                SetHoleHighlight(currentHoleA, true);
                Debug.Log($"[ElementConfig] Leg A가 {hole.name} ({hole.GetInstanceID()}) 홀에 닿았습니다.", this);
            }
            else
            {
                if (currentHoleB == hole)
                    return;

                ReleaseLeg(ref currentHoleB);
                currentHoleB = hole;
                SetHoleHighlight(currentHoleB, true);
                Debug.Log($"[ElementConfig] Leg B가 {hole.name} ({hole.GetInstanceID()}) 홀에 닿았습니다.", this);
            }

            EvaluateDualLegSnap();
        }

        /// <summary>
        /// 다리 트리거가 홀에서 빠져나갈 때 상태를 해제합니다.
        /// </summary>
        internal void HandleLegTriggerExit(bool isLegA, Collider other)
        {
            var hole = GetHoleFromCollider(other);
            if (hole == null)
                return;

            if (isLegA)
            {
                if (hole != currentHoleA)
                    return;

                Debug.Log("[ElementConfig] Leg A가 홀에서 벗어났습니다.", this);
                ReleaseLeg(ref currentHoleA);
            }
            else
            {
                if (hole != currentHoleB)
                    return;

                Debug.Log("[ElementConfig] Leg B가 홀에서 벗어났습니다.", this);
                ReleaseLeg(ref currentHoleB);
            }

            hasValidSnapPose = false;
            lastPreviewHoleA = null;
            lastPreviewHoleB = null;
        }

        /// <summary>
        /// 두 다리가 서로 다른 홀에 동시에 닿아 있을 때만 스냅 포즈를 계산하거나 해제합니다.
        /// </summary>
        void EvaluateDualLegSnap()
        {
            if (currentHoleA == null || currentHoleB == null)
            {
                if (hasValidSnapPose)
                {
                    hasValidSnapPose = false;
                    Debug.Log("[ElementConfig] 두 다리가 모두 홀이 아니어서 스냅 미리보기를 해제합니다.", this);
                }
                lastPreviewHoleA = null;
                lastPreviewHoleB = null;
                return;
            }

            if (currentHoleA == currentHoleB)
            {
                if (hasValidSnapPose)
                {
                    hasValidSnapPose = false;
                    Debug.Log("[ElementConfig] 두 다리가 동일한 홀을 공유하고 있어 스냅이 무효입니다.", this);
                }
                lastPreviewHoleA = null;
                lastPreviewHoleB = null;
                return;
            }

            if (hasValidSnapPose && currentHoleA == lastPreviewHoleA && currentHoleB == lastPreviewHoleB)
                return;

            ApplyPreviewFromHoles(currentHoleA, currentHoleB);
        }

        /// <summary>
        /// 콜라이더에서 BreadboardHole 컴포넌트를 안전하게 찾습니다.
        /// </summary>
        BreadboardHole GetHoleFromCollider(Collider collider)
        {
            if (collider == null)
                return null;

            var hole = collider.GetComponent<BreadboardHole>();
            if (hole == null)
                hole = collider.GetComponentInParent<BreadboardHole>();

            return hole;
        }

        /// <summary>
        /// 두 홀 위치를 기준으로 스냅 위치/회전을 계산하고 미리보기를 적용합니다.
        /// </summary>
        void ApplyPreviewFromHoles(BreadboardHole baseHole, BreadboardHole targetHole)
        {
            if (baseHole == null || targetHole == null)
            {
                hasValidSnapPose = false;
                return;
            }

            var posA = baseHole.transform.position;
            var posB = targetHole.transform.position;
            var holeVector = posB - posA;
            if (holeVector.sqrMagnitude < 0.000001f)
            {
                hasValidSnapPose = false;
                Debug.Log("[ElementConfig] 두 홀 사이의 거리가 너무 짧아 포즈를 계산할 수 없습니다.", this);
                return;
            }

            var surfaceNormal = baseHole.transform.up;
            if (surfaceNormal.sqrMagnitude < 0.000001f)
            {
                surfaceNormal = snapUp.sqrMagnitude > 0.000001f ? snapUp.normalized : Vector3.up;
            }
            // 두 홀을 잇는 벡터를 바라보게 만든 뒤, 다리 간 기준 회전을 역적용하여 실제 오브젝트의 목표 회전을 구합니다.
            var lookRotation = Quaternion.LookRotation(holeVector.normalized, surfaceNormal.normalized);
            var targetRotation = lookRotation * Quaternion.Inverse(referenceLegRotation);
            // 첫 번째 다리의 로컬 위치를 현재 스케일과 회전에 맞춰 보정하여 스냅해야 할 월드 위치를 산출합니다.
            var scaledLegOffset = Vector3.Scale(legALocalPosition, transform.localScale);
            var targetPosition = posA - (targetRotation * scaledLegOffset);

            snapPosition = targetPosition;
            snapRotation = targetRotation;
            hasValidSnapPose = true;
            lastPreviewHoleA = baseHole;
            lastPreviewHoleB = targetHole;

            transform.SetPositionAndRotation(snapPosition, snapRotation);
            Debug.Log($"[ElementConfig] 스냅 포즈 적용 완료: {baseHole.name} -> {targetHole.name}", this);
        }

        /// <summary>
        /// 스냅 미리보기 및 홀 할당 상태를 정리합니다.
        /// </summary>
        void ClearSnapState(bool clearLegAssignments)
        {
            hasValidSnapPose = false;
            lastPreviewHoleA = null;
            lastPreviewHoleB = null;
            if (clearLegAssignments)
            {
                ReleaseLeg(ref currentHoleA);
                ReleaseLeg(ref currentHoleB);
            }
        }

        /// <summary>
        /// 다리에서 하이라이트를 제거하고 참조를 비웁니다.
        /// </summary>
        void ReleaseLeg(ref BreadboardHole hole)
        {
            if (hole == null)
                return;

            SetHoleHighlight(hole, false);
            hole = null;
        }

        /// <summary>
        /// 해당 홀의 하이라이트를 토글합니다.
        /// </summary>
        void SetHoleHighlight(BreadboardHole hole, bool on)
        {
            if (hole == null)
                return;

            if (hole.board != null)
            {
                hole.board.SetHighlight(hole, on);
            }
            else if (on)
            {
                Debug.LogWarning($"[ElementConfig] {hole.name} 에 연결된 Breadboard가 없어 하이라이트할 수 없습니다.", this);
            }
        }

        /// <summary>
        /// 다음 해제 시 스냅을 적용하지 않도록 일시적으로 막습니다.
        /// </summary>
        public void SuppressNextSnapFinalize()
        {
            suppressNextSnapFinalize = true;
        }

        /// <summary>
        /// 계산된 스냅 포즈를 외부에서 조회할 수 있도록 제공합니다.
        /// </summary>
        public bool TryGetSnapPose(out Vector3 position, out Quaternion rotation)
        {
            position = snapPosition;
            rotation = snapRotation;
            return hasValidSnapPose;
        }

        /// <summary>
        /// 물리 이동을 멈추고 오브젝트를 현재 위치/회전에 고정합니다.
        /// </summary>
        public void LockInPlace()
        {
            if (cachedRigidbody == null)
            {
                return;
            }

            cachedRigidbody.linearVelocity = Vector3.zero;
            cachedRigidbody.angularVelocity = Vector3.zero;
            cachedRigidbody.isKinematic = true;
            isPlaced = true;
        }
        
        public bool IsPlacedOnBoard => isPlaced;

        public bool TryGetPlacedHoles(out BreadboardHole a, out BreadboardHole b)
        {
            if (PlacedHoleA != null && PlacedHoleB != null && PlacedHoleA != PlacedHoleB)
            {
                a = PlacedHoleA;
                b = PlacedHoleB;
                return true;
            }

            a = null;
            b = null;
            return false;
        }

        void SetPlacedHolesFromCurrent()
        {
            if (currentHoleA != null && currentHoleB != null && currentHoleA != currentHoleB)
            {
                PlacedHoleA = currentHoleA;
                PlacedHoleB = currentHoleB;
                return;
            }

            PlacedHoleA = null;
            PlacedHoleB = null;
        }
    }

    [RequireComponent(typeof(Collider))]
    sealed class LegTriggerRelay : MonoBehaviour
    {
        ElementConfig owner;
        Collider cachedCollider;
        bool isLegA;

        /// <summary>
        /// 다리 트리거 릴레이를 초기화하여 어떤 다리인지와 소유자를 기억합니다.
        /// </summary>
        public void Initialize(ElementConfig config, bool isLegA)
        {
            owner = config;
            this.isLegA = isLegA;
            cachedCollider = GetComponent<Collider>();

            if (cachedCollider == null)
            {
                Debug.LogWarning("[LegTriggerRelay] Collider가 필요합니다.");
                return;
            }

            if (!cachedCollider.isTrigger)
            {
                Debug.LogWarning("[LegTriggerRelay] Collider를 Trigger 모드로 설정해야 합니다.");
            }
        }

        /// <summary>
        /// 콜라이더가 트리거에 진입했을 때 ElementConfig로 전달합니다.
        /// </summary>
        void OnTriggerEnter(Collider other)
        {
            owner?.HandleLegTriggerEnter(isLegA, other);
        }

        /// <summary>
        /// 콜라이더가 트리거에서 나갔을 때 ElementConfig로 전달합니다.
        /// </summary>
        void OnTriggerExit(Collider other)
        {
            owner?.HandleLegTriggerExit(isLegA, other);
        }
    }
}
