# 브레드보드 성능 최적화 구현 지침서
## Circuit Capstone - Unity VR Project

---

## 📋 작업 개요

**목표**: 3000개의 Hole GameObject를 1-2개로 줄여 VR 성능을 90 FPS로 개선

**현재 상태**:
- 브레드보드에 3000개 이상의 Hole GameObject 존재
- 각 Hole이 Collider와 BreadboardHole 컴포넌트 보유
- Meta Quest 3에서 심각한 성능 저하 발생

**목표 상태**:
- Hole GameObject는 상호작용 시에만 임시 생성 (최대 2개)
- 브레드보드는 단일 Collider만 보유
- 안정적인 90 FPS 유지

---

## 🛠 구현 단계

### Step 1: 새로운 스크립트 생성

#### 1.1 `OptimizedBreadboardController.cs` 생성

**위치**: `Assets/Achoo/OptimizedBreadboardController.cs`

```csharp
using UnityEngine;
using UnityEngine.XR.Interaction.Toolkit;

public class OptimizedBreadboardController : MonoBehaviour
{
    [Header("References")]
    public Breadboard breadboard;
    public GameObject holePrefab;
    public Transform wireContainer;
    
    [Header("Grid Settings")]
    public float pitchX = 2.54f; // mm to Unity units
    public float pitchZ = 2.54f;
    public int gridColumns = 63;
    public int gridRows = 10;
    
    [Header("Interaction")]
    public LayerMask boardLayer;
    public float raycastDistance = 0.3f;
    
    private GameObject firstHole;
    private GameObject secondHole;
    private BreadboardHole firstHoleComponent;
    
    void Start()
    {
        // 기존 Hole GameObject들 모두 비활성화 또는 삭제
        DisableAllExistingHoles();
    }
    
    public void OnControllerTriggerPress(Vector3 origin, Vector3 direction)
    {
        Ray ray = new Ray(origin, direction);
        
        if (Physics.Raycast(ray, out RaycastHit hit, raycastDistance, boardLayer))
        {
            // 월드 좌표를 로컬 좌표로 변환
            Vector3 localPos = transform.InverseTransformPoint(hit.point);
            
            // 가장 가까운 구멍 위치 계산
            int col = Mathf.RoundToInt(localPos.x / (pitchX * 0.001f));
            int row = Mathf.RoundToInt(localPos.z / (pitchZ * 0.001f));
            
            // 범위 체크
            col = Mathf.Clamp(col, 0, gridColumns - 1);
            row = Mathf.Clamp(row, 0, gridRows - 1);
            
            // 스냅된 월드 좌표 계산
            Vector3 snapLocalPos = new Vector3(
                col * pitchX * 0.001f,
                0,
                row * pitchZ * 0.001f
            );
            Vector3 snapWorldPos = transform.TransformPoint(snapLocalPos);
            
            // Hole 생성 및 Wire 로직 처리
            ProcessHoleSelection(snapWorldPos, row, col);
        }
    }
    
    private void ProcessHoleSelection(Vector3 position, int row, int col)
    {
        if (firstHole == null)
        {
            // 첫 번째 구멍 선택
            firstHole = CreateTemporaryHole(position, row, col);
            firstHoleComponent = firstHole.GetComponent<BreadboardHole>();
            
            // 시각적 피드백 (초록색 하이라이트)
            SetHoleEmission(firstHole, Color.green);
        }
        else
        {
            // 두 번째 구멍 선택
            secondHole = CreateTemporaryHole(position, row, col);
            
            // Wire 생성
            CreateWireBetweenHoles();
            
            // 임시 Hole들 정리
            CleanupTemporaryHoles();
        }
    }
    
    private GameObject CreateTemporaryHole(Vector3 position, int row, int col)
    {
        GameObject hole = Instantiate(holePrefab, position, Quaternion.identity, transform);
        
        // HoleData 설정
        var holeData = hole.GetComponent<HoleData>();
        if (holeData != null)
        {
            holeData.row = row;
            holeData.column = col;
        }
        
        return hole;
    }
    
    private void CreateWireBetweenHoles()
    {
        if (breadboard != null && breadboard.wirePrefab != null)
        {
            // Wire 생성 (기존 Breadboard.cs 로직 활용)
            Wire newWire = Instantiate(breadboard.wirePrefab, wireContainer);
            
            // Wire 포인트 설정
            newWire.SetPoints(
                firstHole.transform.position,
                secondHole.transform.position,
                breadboard.wireJumpHeight
            );
            
            // Wire 두께 설정
            newWire.SetWidth(breadboard.wireWidth);
        }
    }
    
    private void SetHoleEmission(GameObject hole, Color color)
    {
        Renderer renderer = hole.GetComponent<Renderer>();
        if (renderer != null)
        {
            renderer.material.SetColor("_EmissionColor", color);
            renderer.material.EnableKeyword("_EMISSION");
        }
    }
    
    private void CleanupTemporaryHoles()
    {
        if (firstHole != null) Destroy(firstHole);
        if (secondHole != null) Destroy(secondHole);
        
        firstHole = null;
        secondHole = null;
        firstHoleComponent = null;
    }
    
    private void DisableAllExistingHoles()
    {
        // 기존 Hole들 찾아서 비활성화
        BreadboardHole[] existingHoles = GetComponentsInChildren<BreadboardHole>();
        foreach (var hole in existingHoles)
        {
            hole.gameObject.SetActive(false);
        }
    }
}
```

---

### Step 2: XR 입력 연결 스크립트

#### 2.1 `XRBreadboardInput.cs` 생성

**위치**: `Assets/Achoo/XRBreadboardInput.cs`

```csharp
using UnityEngine;
using UnityEngine.XR.Interaction.Toolkit;
using UnityEngine.InputSystem;

public class XRBreadboardInput : MonoBehaviour
{
    public OptimizedBreadboardController breadboardController;
    public XRRayInteractor rightHandRay;
    public XRRayInteractor leftHandRay;
    
    [Header("Desktop Testing")]
    public bool enableMouseInput = true;
    public Camera desktopCamera;
    
    void Start()
    {
        // XR Ray Interactor 이벤트 연결
        if (rightHandRay != null)
        {
            rightHandRay.selectEntered.AddListener(OnRightHandSelect);
        }
        
        if (leftHandRay != null)
        {
            leftHandRay.selectEntered.AddListener(OnLeftHandSelect);
        }
    }
    
    void Update()
    {
        // 데스크톱 테스트용 마우스 입력
        if (enableMouseInput && Mouse.current != null && desktopCamera != null)
        {
            if (Mouse.current.leftButton.wasPressedThisFrame)
            {
                Ray ray = desktopCamera.ScreenPointToRay(Mouse.current.position.ReadValue());
                breadboardController.OnControllerTriggerPress(ray.origin, ray.direction);
            }
        }
    }
    
    private void OnRightHandSelect(SelectEnterEventArgs args)
    {
        ProcessRaySelection(rightHandRay);
    }
    
    private void OnLeftHandSelect(SelectEnterEventArgs args)
    {
        ProcessRaySelection(leftHandRay);
    }
    
    private void ProcessRaySelection(XRRayInteractor rayInteractor)
    {
        if (rayInteractor != null)
        {
            Transform rayOrigin = rayInteractor.rayOriginTransform;
            breadboardController.OnControllerTriggerPress(
                rayOrigin.position,
                rayOrigin.forward
            );
        }
    }
}
```

---

### Step 3: Object Pool 구현 (선택사항 - 성능 추가 개선)

#### 3.1 `HoleObjectPool.cs` 생성

**위치**: `Assets/Achoo/HoleObjectPool.cs`

```csharp
using System.Collections.Generic;
using UnityEngine;

public class HoleObjectPool : MonoBehaviour
{
    public GameObject holePrefab;
    public int initialPoolSize = 10;
    
    private Queue<GameObject> pool = new Queue<GameObject>();
    
    void Start()
    {
        // 초기 풀 생성
        for (int i = 0; i < initialPoolSize; i++)
        {
            GameObject hole = Instantiate(holePrefab);
            hole.SetActive(false);
            pool.Enqueue(hole);
        }
    }
    
    public GameObject GetHole()
    {
        if (pool.Count > 0)
        {
            GameObject hole = pool.Dequeue();
            hole.SetActive(true);
            return hole;
        }
        else
        {
            // 풀이 비어있으면 새로 생성
            return Instantiate(holePrefab);
        }
    }
    
    public void ReturnHole(GameObject hole)
    {
        hole.SetActive(false);
        pool.Enqueue(hole);
    }
}
```

---

## 🎯 Unity 에디터에서 설정 작업

### 1. 브레드보드 GameObject 수정

1. **Hierarchy**에서 Breadboard GameObject 선택
2. **기존 Hole 자식 오브젝트들 모두 삭제** (또는 비활성화)
3. **Box Collider** 하나만 추가 (브레드보드 전체 크기)
4. **Layer**를 "Breadboard"로 설정 (새로 만들기)

### 2. OptimizedBreadboardController 설정

1. Breadboard GameObject에 `OptimizedBreadboardController.cs` 추가
2. Inspector에서 설정:
   - **Breadboard**: 기존 Breadboard 컴포넌트 연결
   - **Hole Prefab**: Achoo/Prefabs/BreadboardHole 프리팹 연결
   - **Wire Container**: Wires 부모 Transform 연결
   - **Board Layer**: "Breadboard" 레이어 선택

### 3. XR 입력 설정

1. XR Origin GameObject에 `XRBreadboardInput.cs` 추가
2. Inspector에서 설정:
   - **Breadboard Controller**: OptimizedBreadboardController 연결
   - **Right Hand Ray**: RightHand Controller의 XRRayInteractor 연결
   - **Left Hand Ray**: LeftHand Controller의 XRRayInteractor 연결
   - **Desktop Camera**: Main Camera 연결 (테스트용)

---

## ✅ 테스트 체크리스트

### 기본 기능 테스트
- [ ] 브레드보드 표면 클릭 시 반응하는가?
- [ ] 첫 번째 클릭 시 초록색 하이라이트가 표시되는가?
- [ ] 두 번째 클릭 시 Wire가 생성되는가?
- [ ] Wire 생성 후 임시 Hole이 사라지는가?
- [ ] 동일 위치 두 번 클릭 시 취소되는가?

### VR 테스트
- [ ] 컨트롤러 Ray로 선택 가능한가?
- [ ] 핸드 트래킹으로 선택 가능한가?
- [ ] 햅틱 피드백이 작동하는가?

### 성능 테스트
- [ ] FPS가 72 이상 유지되는가?
- [ ] Profiler에서 Physics 부하가 감소했는가?
- [ ] Hierarchy가 깔끔해졌는가? (3000개 → 수십 개)

---

## 🚨 주의사항

1. **기존 Scene 백업 필수**
   - 작업 전 `CircuitScene_achoo.unity`를 복사하여 백업

2. **Prefab 수정 주의**
   - Hole Prefab은 수정하지 말고 그대로 사용
   - Wire Prefab도 기존 것 그대로 사용

3. **그리드 설정 확인**
   - pitchX, pitchZ는 브레드보드 실제 간격과 일치해야 함
   - 일반적으로 2.54mm (0.1 inch)

---

## 📊 예상 성능 개선

| 측정 항목 | 최적화 전 | 최적화 후 | 개선율 |
|----------|----------|----------|-------|
| GameObject 수 | 3,000+ | 10~50 | 99% 감소 |
| Collider 수 | 3,000+ | 1 | 99.9% 감소 |
| Draw Calls | 높음 | 낮음 | 80% 감소 |
| Physics 연산 | 높음 | 매우 낮음 | 90% 감소 |
| FPS (Quest 3) | 30-45 | 72-90 | 100% 향상 |
| 메모리 사용량 | 높음 | 낮음 | 70% 감소 |

---

## 🔧 문제 해결

### 문제: Hole이 잘못된 위치에 생성됨
**해결**: 
- Grid 설정 확인 (pitchX, pitchZ)
- 브레드보드 Transform scale이 (1,1,1)인지 확인
- Local/World 좌표 변환 확인

### 문제: Wire가 생성되지 않음
**해결**:
- Wire Prefab 연결 확인
- Wire Container Transform 연결 확인
- Breadboard 컴포넌트 참조 확인

### 문제: 클릭이 인식되지 않음
**해결**:
- Breadboard Layer 설정 확인
- Box Collider 크기 확인
- Raycast Distance 값 증가

---

## 📝 추가 개선 아이디어

1. **Visual Feedback 개선**
   - Hole 위치에 커서 표시
   - 선택 가능 영역 미리보기

2. **Wire 관리**
   - Wire 삭제 기능 추가
   - Wire 색상 커스터마이징

3. **교육 기능**
   - 회로 검증 시스템
   - 전류 흐름 시각화

---

## 작성자 정보
- 작성일: 2024년 11월
- 프로젝트: Circuit Capstone
- Unity 버전: 6000.2.2f1
- 대상 플랫폼: Meta Quest 3

---

## END OF DOCUMENT
