# Circuit Capston KDS2 - 프로젝트 상세 문서

## 📋 프로젝트 개요

**Circuit Capston KDS2**는 VR 환경에서 브레드보드 위에 전자 회로를 구성하고 검증할 수 있는 교육용 시뮬레이션 프로젝트입니다. 사용자는 Meta Quest 3와 같은 VR 헤드셋을 착용하고 가상의 브레드보드에 부품을 배치하고 와이어로 연결하여 회로를 만들 수 있습니다. 완성된 회로는 GPT Vision API를 활용하여 자동으로 검증되며, 회로의 정확성에 따라 LED가 점등되는 등의 시각적 피드백을 제공합니다.

### 핵심 기능

- **VR 인터랙션**: XR Interaction Toolkit을 사용한 직관적인 부품 배치 및 와이어 연결
- **자기 스냅 시스템**: 부품을 브레드보드 홀에 가까이 가져가면 자동으로 스냅되는 기능
- **와이어 토글 시스템**: 홀을 두 번 클릭하여 와이어를 생성하거나 제거
- **AI 기반 회로 검증**: GPT Vision API를 통한 회로 정확성 자동 판단
- **물리 기반 회로 분석**: Netlist 생성 및 토폴로지 검증 시스템
- **실시간 피드백**: LED 점등, 파티클 효과, 사운드를 통한 즉각적인 피드백

### 기술 스택

- **Unity 버전**: 6000.2.10f1
- **타겟 플랫폼**: Meta Quest 3 (OpenXR)
- **주요 패키지**:
  - XR Interaction Toolkit 3.2.1
  - XR Hands 1.7.0
  - Input System 1.14.2
  - OpenXR 1.15.1
  - Universal Render Pipeline (URP) 17.2.0

---

## 🏗️ 프로젝트 구조

```
Circuit_Capston_KDS2/
├── Assets/
│   ├── Achoo/                          # 핵심 게임플레이 시스템
│   │   ├── Scripts/                    # 주요 C# 스크립트
│   │   ├── Editor/                     # 에디터 전용 툴
│   │   ├── Prefabs/                    # 프리팹 모음
│   │   ├── Materials/                  # 머티리얼
│   │   └── Sounds/                     # 오디오 클립
│   ├── Scenes/                         # 유니티 씬 파일
│   │   └── CircuitScene_achoo.unity   # 메인 씬
│   ├── VRTemplateAssets/              # VR 템플릿 에셋
│   └── Samples/                        # XR 샘플 코드
├── Packages/                           # Unity 패키지 의존성
├── ProjectSettings/                    # 프로젝트 설정
└── claudedocs/                         # 문서 및 가이드
```

---

## 🎮 핵심 시스템 및 스크립트 상세 설명

### 1. 브레드보드 와이어 연결 시스템

이 시스템은 사용자가 브레드보드의 홀을 선택하여 와이어를 생성하고 제거하는 핵심 기능을 담당합니다.

#### `Breadboard.cs`

**위치**: `Assets/Achoo/Scripts/Breadboard.cs`

**주요 기능**:

- 홀 클릭 이벤트 수신 및 와이어 생성/삭제 로직 처리
- 와이어 토글 시스템 구현 (같은 두 홀을 다시 클릭하면 와이어 삭제)
- 와이어 딕셔너리 관리를 통한 중복 방지
- 오디오 피드백 제공 (홀 선택, 와이어 연결/삭제 사운드)
- 홀 하이라이트 시각 효과 제어

**핵심 메서드**:

- `OnHolePressed(BreadboardHole hole)`: 홀이 클릭되었을 때 호출되는 메인 진입점
- `HandleWireHolePressed(BreadboardHole hole)`: 와이어 생성/삭제 로직 처리
  - 첫 번째 클릭: 홀 선택 및 하이라이트
  - 두 번째 클릭 (다른 홀): 와이어 생성 또는 기존 와이어 삭제
  - 두 번째 클릭 (같은 홀): 선택 취소
- `SetHighlight(BreadboardHole hole, bool on)`: 홀의 Emission 색상을 변경하여 선택 상태 표시
- `ClearAllWires()`: 모든 와이어 제거 및 상태 초기화
- `GetAllWires()`: 현재 연결된 모든 와이어 정보 반환

**연결 관계**:

- **BreadboardHole** → 홀 클릭 이벤트를 받음
- **Wire** → 와이어 프리팹을 인스턴스화하여 시각화
- **CircuitAnalyzer** → 회로 분석 시 와이어 연결 정보 제공

---

#### `BreadboardHole.cs`

**위치**: `Assets/Achoo/Scripts/BreadboardHole.cs`

**주요 기능**:

- 브레드보드의 개별 홀을 나타내는 컴포넌트
- 마우스 클릭 및 VR 인터랙션 이벤트를 Breadboard로 전달
- 전역 홀 등록 시스템 (정적 리스트)

**핵심 메서드**:

- `Press()`: 홀이 눌렸을 때 부모 Breadboard의 `OnHolePressed()` 호출
- `OnMouseDown()`: 에디터/PC 테스트용 마우스 클릭 감지
- `OnEnable()/OnDisable()`: 전역 홀 리스트에 등록/해제

**연결 관계**:

- **Breadboard** ← 클릭 이벤트 전달
- **HoleData** → 홀의 행/열 정보 저장
- **BreadboardHoleMetadata** → 홀 타입 정보 (전원, 접지, 일반 등)
- **XRSimpleInteractable** → VR 인터랙션 컴포넌트 (에디터 툴로 자동 추가)

---

#### `Wire.cs`

**위치**: `Assets/Achoo/Scripts/Wire.cs`

**주요 기능**:

- LineRenderer를 사용하여 두 홀 사이의 와이어를 시각화
- 4점 아치형 와이어 렌더링 (ㄷ자 형태)
- 홀의 위치 변경 시 실시간 업데이트
- Wire 레이어 자동 할당

**핵심 메서드**:

- `Init(BreadboardHole holeA, BreadboardHole holeB, float wireWidth, float height)`: 와이어 초기화
- `UpdateLine()`: LineRenderer의 4개 점 위치 계산 및 설정
- `LateUpdate()`: 홀 위치 변경 감지 및 와이어 업데이트
- `GetEndpoints()`: 연결된 두 홀 반환

**시각화 알고리즘**:

```
p0: 첫 번째 홀 위치
p1: 첫 번째 홀에서 위로 jumpHeight만큼
p2: 두 번째 홀에서 위로 jumpHeight만큼
p3: 두 번째 홀 위치
```

**연결 관계**:

- **Breadboard** → 와이어 생성 및 관리
- **BreadboardHole** → 시작점과 끝점 참조
- **LineRenderer** → 시각적 렌더링 컴포넌트

---

### 2. 부품 배치 및 스냅 시스템

사용자가 저항, LED 등의 2핀 부품을 브레드보드에 배치할 때 자동으로 홀에 스냅되는 시스템입니다.

#### `ElementConfig.cs`

**위치**: `Assets/Achoo/Scripts/ElementConfig.cs`

**주요 기능**:

- 2핀 부품의 자기 스냅 기능 구현
- 실시간 스냅 미리보기
- 부품 회전 자동 계산
- 트리거 기반 홀 감지
- 배치 확정 시 Rigidbody 고정

**핵심 메서드**:

- `OnGrabbed(SelectEnterEventArgs args)`: 부품을 잡았을 때 물리 활성화
- `OnReleased(SelectExitEventArgs _)`: 부품을 놓았을 때 스냅 적용
- `HandleLegTriggerEnter/Exit(bool isLegA, Collider other)`: 다리 트리거 진입/이탈 처리
- `EvaluateDualLegSnap()`: 두 다리가 모두 홀에 닿았는지 확인 및 스냅 계산
- `ApplyPreviewFromHoles(BreadboardHole baseHole, BreadboardHole targetHole)`: 스냅 위치/회전 계산
- `ApplySnapPose()`: 계산된 스냅 포즈를 실제로 적용
- `LockInPlace()`: Rigidbody를 Kinematic으로 전환하여 고정

**스냅 계산 알고리즘**:

1. 두 홀의 위치 벡터 계산
2. 홀의 법선 벡터(up) 추출
3. LookRotation으로 기본 회전 계산
4. 부품의 다리 간 참조 회전을 역적용하여 최종 회전 도출
5. 첫 번째 다리의 로컬 오프셋을 고려하여 위치 계산

**연결 관계**:

- **ElementPlacementManager** → 현재 잡힌 부품 정보 등록
- **BreadboardHole** → 스냅 대상 홀
- **XRGrabInteractable** → VR 그랩 인터랙션
- **LegTriggerRelay** → 다리 끝의 트리거 감지 중계
- **CircuitComponentMetadata** → 부품 타입 및 극성 정보



#### `ElementPlacementManager.cs`

**위치**: `Assets/Achoo/Scripts/ElementPlacementManager.cs`

**주요 기능**:

- 싱글톤 패턴으로 현재 잡힌 부품 추적
- 부품 상태 변경 이벤트 발행
- 외부에서 현재 부품 정보 조회 가능

**핵심 메서드**:

- `NotifyElementGrabbed(ElementConfig config, XRGrabInteractable interactable, SelectEnterEventArgs args)`: 부품이 잡혔음을 등록
- `NotifyElementReleased(ElementConfig config)`: 부품이 놓였음을 등록
- `ForceReleaseCurrent()`: 현재 부품 강제 해제

**연결 관계**:

- **ElementConfig** → 부품 상태 업데이트 수신
- **XRAnalyzeTrigger** → 분석 시 현재 부품 확인

---

### 3. 회로 분석 및 검증 시스템

브레드보드에 구성된 회로를 물리적으로 분석하고, GPT Vision API를 통해 검증하는 시스템입니다.

#### `CircuitAnalyzer.cs`

**위치**: `Assets/Achoo/Scripts/CircuitAnalyzer.cs`

**주요 기능**:

- 서브 카메라를 통한 회로 이미지 캡처
- GPT Vision API 호출 및 응답 처리
- 물리 기반 Netlist 생성 및 토폴로지 검증
- 하이브리드 분석 모드 (이미지 + Netlist JSON)
- 학습 데이터 자동 저장 (이미지, JSON, 프롬프트)

**분석 모드**:

1. **LogicOnly**: 물리 검증만 수행
2. **GptVisionOnly**: 이미지 분석만 수행
3. **GptHybridImagePlusNetlist**: 이미지 + Netlist JSON 결합 분석 (기본값)

**핵심 메서드**:

- `AnalyzeCurrentCircuit()`: 분석 프로세스 시작
- `AnalyzeWithLogicValidator()`: 물리 기반 회로 검증
- `AnalyzeRoutine(AnalysisMode mode)`: 코루틴으로 비동기 분석 수행
- `CaptureFromCamera(Camera cam, int width, int height)`: 서브 카메라로 스크린샷 캡처
- `OnAnalysisSuccess(string rawResponse, Texture2D texture, AnalysisMode mode)`: GPT 응답 처리
- `SaveTrainingData(CircuitAnalysisResult result, Texture2D texture, string timestamp)`: 학습 데이터 저장

**하이브리드 프롬프트 구조**:

```
시스템 프롬프트: "Netlist JSON을 절대적 진리로 사용하라"
사용자 프롬프트: "이미지는 부품 존재 확인용, 연결은 Netlist JSON 참조"
+ Netlist JSON 첨부
```

**학습 데이터 저장 구조**:

```
Application.persistentDataPath/TrainingData/
├── 0/  (잘못된 회로)
│   ├── Circuit_[timestamp].png
│   ├── Circuit_[timestamp].json
│   └── Circuit_[timestamp]_netlist.json
└── 1/  (올바른 회로)
    ├── Circuit_[timestamp].png
    ├── Circuit_[timestamp].json
    └── Circuit_[timestamp]_netlist.json
```

**연결 관계**:

- **GPTVisionAPI** → API 호출 처리
- **BreadboardNetlistBuilder** → Netlist 생성
- **CircuitTopologyValidator** → 회로 검증
- **BreadboardNetResolver** → 홀 연결 규칙 해석
- **UnityEvent** → `OnCircuitValid`, `OnCircuitInvalid` 이벤트 발행
- **LEDPowerVisualizer** → 검증 결과에 따른 시각 효과
- **GptFeedbackEffects** → 성공/실패 피드백 효과

---

#### `BreadboardNetlistBuilder.cs`

**위치**: `Assets/Achoo/Scripts/BreadboardNetlistBuilder.cs`

**주요 기능**:

- 브레드보드의 물리적 상태를 Netlist로 변환
- Disjoint Set Union (DSU) 알고리즘으로 전기적 연결 계산
- 부품, 와이어, 배터리 플러그 정보 통합
- 단락 감지 (Plus와 Minus가 같은 Net에 연결)

**Netlist 구조**:

```json
{
  "nets": [
    {
      "id": 0,
      "key": "plus",
      "holes": [홀 정보 배열],
      "baseKeys": ["plus"]
    }
  ],
  "edges": [
    {
      "componentType": "Led",
      "netA": 0,
      "netB": 1,
      "isPolarized": true
    }
  ],
  "terminals": {
    "plusNetId": 0,
    "minusNetId": 2
  },
  "directShort": false
}
```

**알고리즘**:

1. **초기화**: 각 홀을 독립 노드로 초기화
2. **내부 연결**: BreadboardNetResolver를 통해 브레드보드 내부 연결 처리 (같은 열의 홀들 자동 연결)
3. **와이어 연결**: 와이어로 연결된 홀들을 DSU로 Union
4. **Net 생성**: DSU의 루트별로 Net 노드 생성
5. **부품 등록**: 부품이 연결된 두 Net을 Edge로 등록
6. **터미널 등록**: Plus/Minus 배터리 플러그가 연결된 Net 등록

**연결 관계**:

- **CircuitRuntimeState** → 씬의 현재 상태 스냅샷 제공
- **BreadboardNetResolver** → 홀 간 내부 연결 규칙
- **CircuitComponentMetadata** → 부품 타입 및 극성 정보
- **CircuitTopologyValidator** → 생성된 Netlist 검증

---

#### `CircuitTopologyValidator.cs`

**위치**: `Assets/Achoo/Scripts/CircuitTopologyValidator.cs`

**주요 기능**:

- Netlist를 규칙 기반으로 검증
- 직렬 연결 패턴 매칭 (저항-LED, 저항-커패시터 등)
- 극성 검증 (LED, 다이오드 방향 확인)
- 다중 패턴 지원

**검증 패턴**:

```
CircuitPattern {
  name: "저항-LED 직렬 연결"
  patternType: SeriesTwoComponents
  seriesFirst: Resistor
  seriesSecond: Led
  allowEitherOrder: false
  enforcePolarity: true
}
```

**검증 알고리즘**:

1. **터미널 확인**: Plus와 Minus Net 존재 여부
2. **직접 단락 검사**: Plus와 Minus가 같은 Net인지
3. **부품 카운트 검증**: 필수 부품 개수 확인
4. **패턴 매칭**: Plus → 부품1 → 중간 Net → 부품2 → Minus 경로 탐색
5. **극성 검증**: 극성 부품의 +/- 방향 확인

**연결 관계**:

- **CircuitTopologyRules** (ScriptableObject) → 검증 규칙 정의
- **BreadboardNetlist** → 검증 대상
- **CircuitAnalyzer** → 검증 결과 수신

---

#### `GPTVisionAPI.cs`

**위치**: `Assets/Achoo/Scripts/GPTVisionAPI.cs`

**주요 기능**:

- OpenAI Chat Completions API 호출
- Base64 이미지 인코딩 및 전송
- JSON 응답 파싱
- 환경 변수에서 API 키 로드

**API 요청 구조**:

```json
{
  "model": "gpt-4.1-mini",
  "messages": [
    {
      "role": "system",
      "content": [{"type": "text", "text": "시스템 프롬프트"}]
    },
    {
      "role": "user",
      "content": [
        {"type": "text", "text": "사용자 프롬프트"},
        {"type": "image_url", "image_url": {"url": "data:image/png;base64,..."}}
      ]
    }
  ],
  "max_completion_tokens": 256,
  "temperature": 0
}
```

**응답 파싱**:

1. 첫 줄에서 0 또는 1 추출 (회로 정확성)
2. 나머지 줄을 JSON으로 파싱 (신뢰도, 이유 등)

**연결 관계**:

- **CircuitAnalyzer** → API 호출 요청
- **CameraCapture** → Base64 인코딩 유틸리티

---

### 4. 시각 및 오디오 피드백 시스템

회로 검증 결과에 따라 시각적, 청각적 피드백을 제공하는 시스템입니다.

#### `LEDPowerVisualizer.cs`

**위치**: `Assets/Achoo/Scripts/LEDPowerVisualizer.cs`

**주요 기능**:

- 회로가 올바르게 연결되면 LED의 Light 컴포넌트 활성화
- 부품이 브레드보드에 배치되어 있는지 확인
- 점등 시 파티클 효과 및 사운드 재생

**동작 조건**:

```
LED 점등 = (회로가 올바름 AND 부품이 배치됨)
```

**핵심 로직**:

- `Update()`에서 매 프레임 상태 체크
- 꺼진 상태 → 켜지는 순간 감지하여 효과 재생
- `ElementConfig.IsPlacedOnBoard` 속성으로 배치 상태 확인

**연결 관계**:

- **CircuitAnalyzer** → `OnCircuitValid/Invalid` 이벤트 구독
- **ElementConfig** → 부품 배치 상태 조회
- **Light** → LED 조명 컴포넌트
- **ParticleSystem** → 점등 효과
- **AudioSource** → 점등 사운드

---

#### `GptFeedbackEffects.cs`

**위치**: `Assets/Achoo/Scripts/GptFeedbackEffects.cs`

**주요 기능**:

- 회로 검증 성공 시 성공 사운드 및 파티클 재생
- 회로 검증 실패 시 실패 사운드 및 파티클 재생

**연결 관계**:

- **CircuitAnalyzer** → `OnCircuitValid/Invalid` 이벤트 구독

---

### 5. 보조 시스템 및 유틸리티

#### `CircuitClearManager.cs`

**위치**: `Assets/Achoo/Scripts/CircuitClearManager.cs`

**주요 기능**:

- 모든 와이어 삭제
- 배치된 모든 부품 제거
- 회로 초기화

**연결 관계**:

- **Breadboard** → `ClearAllWires()` 호출
- **ElementConfig** → 배치된 부품들 파괴

---

#### `TrashBin.cs`

**위치**: `Assets/Achoo/Scripts/TrashBin.cs`

**주요 기능**:

- 트리거 영역에 들어온 부품 자동 삭제
- 휴지통 기능 구현

---

#### `XRAnalyzeTrigger.cs`

**위치**: `Assets/Achoo/Scripts/XRAnalyzeTrigger.cs`

**주요 기능**:

- VR 컨트롤러의 특정 버튼 입력 감지
- Input Action을 통해 회로 분석 트리거
- 부품을 잡고 있지 않을 때만 분석 실행

**연결 관계**:

- **CircuitAnalyzer** → `AnalyzeCurrentCircuit()` 호출
- **ElementPlacementManager** → 현재 부품 상태 확인
- **Input Action** → VR 입력 바인딩

---

#### `BatteryPlug.cs`

**위치**: `Assets/Achoo/Scripts/BatteryPlug.cs`

**주요 기능**:

- 배터리의 Plus/Minus 플러그 구현
- 홀에 스냅되어 전원 공급 시뮬레이션
- 연결된 홀 정보 추적

**연결 관계**:

- **BreadboardNetlistBuilder** → 터미널 정보 제공
- **BreadboardHole** → 연결 대상

---

## 📊 주요 데이터 흐름

### 회로 분석 프로세스

```
[사용자 트리거]
    ↓
[XRAnalyzeTrigger] → Input Action 감지
    ↓
[CircuitAnalyzer.AnalyzeCurrentCircuit()]
    ↓
┌─────────────────────────────────────┐
│ 1. 물리 기반 검증                      │
│    CircuitRuntimeState.CaptureScene() │
│         ↓                             │
│    BreadboardNetlistBuilder.Build()   │
│         ↓                             │
│    CircuitTopologyValidator.Validate()│
└─────────────────────────────────────┘
    ↓
┌─────────────────────────────────────┐
│ 2. 이미지 캡처                        │
│    CaptureFromCamera(scanCamera)     │
└─────────────────────────────────────┘
    ↓
┌─────────────────────────────────────┐
│ 3. GPT Vision API 호출               │
│    GPTVisionAPI.AnalyzeCircuitWithPrompt()│
│    (이미지 + Netlist JSON 전송)       │
└─────────────────────────────────────┘
    ↓
┌─────────────────────────────────────┐
│ 4. 응답 파싱                         │
│    첫 줄: 0 또는 1                   │
│    나머지: JSON (신뢰도, 이유 등)      │
└─────────────────────────────────────┘
    ↓
┌─────────────────────────────────────┐
│ 5. 이벤트 발행                       │
│    OnCircuitValid 또는 OnCircuitInvalid│
└─────────────────────────────────────┘
    ↓
┌─────────────────────────────────────┐
│ 6. 피드백 시스템 반응                │
│    LEDPowerVisualizer → LED 점등     │
│    GptFeedbackEffects → 사운드/파티클 │
└─────────────────────────────────────┘
    ↓
[학습 데이터 저장]
    TrainingData/[0 or 1]/Circuit_[timestamp].json
```

---

### 부품 배치 프로세스

```
[사용자가 부품 잡기]
    ↓
[ElementConfig.OnGrabbed()]
    ↓
[ElementPlacementManager.NotifyElementGrabbed()]
    ↓
[Update() 루프]
    ├─ [LegTriggerRelay] → 다리 트리거 감지
    ├─ [HandleLegTriggerEnter()] → 홀 진입
    ├─ [EvaluateDualLegSnap()] → 두 다리 모두 확인
    └─ [ApplyPreviewFromHoles()] → 스냅 위치/회전 계산
         └─ [transform.SetPositionAndRotation()] → 미리보기 적용
              ↓
[사용자가 부품 놓기]
    ↓
[ElementConfig.OnReleased()]
    ├─ [ApplySnapPose()] → 최종 스냅 적용
    │    └─ [LockInPlace()] → Rigidbody Kinematic 전환
    └─ [SetPlacedHolesFromCurrent()] → 배치된 홀 정보 저장
         ↓
[ElementPlacementManager.NotifyElementReleased()]
```

---

### 와이어 연결 프로세스

```
[사용자가 홀 클릭 - 첫 번째]
    ↓
[BreadboardHole.Press()]
    ↓
[Breadboard.OnHolePressed()]
    ↓
[HandleWireHolePressed()]
    ├─ first = hole (첫 번째 홀 저장)
    └─ SetHighlight(hole, true) (하이라이트 켜기)
         ↓
[사용자가 홀 클릭 - 두 번째]
    ↓
[BreadboardHole.Press()]
    ↓
[Breadboard.OnHolePressed()]
    ↓
[HandleWireHolePressed()]
    ├─ 같은 홀? → 선택 취소
    │
    ├─ 이미 와이어 존재?
    │   └─ 와이어 삭제 (토글 OFF)
    │
    └─ 와이어 없음?
        └─ Wire 인스턴스화 (토글 ON)
            ├─ Wire.Init(first, hole)
            ├─ wireMap에 등록
            └─ first = null (초기화)
```

---

## 🔗 스크립트 간 의존성 맵

```
[입력 계층]
├─ BreadboardHole
├─ XRAnalyzeTrigger
└─ ElementConfig (XR 이벤트)

[비즈니스 로직 계층]
├─ Breadboard
│   ├─ Wire
│   └─ BreadboardHole
│
├─ ElementPlacementManager
│   └─ ElementConfig
│
└─ CircuitAnalyzer
    ├─ GPTVisionAPI
    ├─ BreadboardNetlistBuilder
    │   ├─ BreadboardNetResolver
    │   ├─ CircuitRuntimeState
    │   └─ BreadboardHole, Wire, ElementConfig
    └─ CircuitTopologyValidator
        └─ CircuitTopologyRules (SO)

[피드백 계층]
├─ LEDPowerVisualizer
│   ├─ CircuitAnalyzer (이벤트)
│   └─ ElementConfig (배치 상태)
│
└─ GptFeedbackEffects
    └─ CircuitAnalyzer (이벤트)

[유틸리티 계층]
├─ CircuitClearManager
├─ TrashBin
└─ BatteryPlug
```

---

## 🎯 에디터 도구

### `HoleGroupSetup.cs`

**위치**: `Assets/Achoo/Editor/HoleGroupSetup.cs`

**주요 기능**:

- 선택한 브레드보드 홀들에 XRSimpleInteractable 자동 추가
- Activate 이벤트를 BreadboardHole.Press()에 자동 연결
- 대량 홀 설정 자동화 도구

---

## 📚 주요 데이터 구조

### `BreadboardNetlist`

```csharp
public class BreadboardNetlist {
    public List<NetNode> nets;           // 전기적으로 연결된 노드 그룹
    public List<NetEdge> edges;          // 부품 (두 Net 연결)
    public Terminals terminals;          // Plus/Minus Net ID
    public List<WireShort> wireShorts;   // 와이어 정보
    public bool directShort;             // 직접 단락 여부
}
```

### `CircuitValidationReport`

```csharp
public class CircuitValidationReport {
    public int result;                   // 0: 실패, 1: 성공
    public float confidence;             // 신뢰도 (0.0 ~ 1.0)
    public List<string> reasons;         // 검증 결과 이유
    public string netlistJson;           // Netlist JSON 문자열
}
```

### `CircuitAnalysisResult`

```csharp
public class CircuitAnalysisResult {
    public string rawResponse;           // GPT 원본 응답
    public int isCorrect;                // 0 또는 1
    public float confidence;             // 신뢰도
    public string[] reasons;             // 이유 배열
    public string netlistJson;           // Netlist JSON
    public string source;                // "LOGIC", "GPT", "HYBRID"
}
```

---

## 🚀 시작하기

### 필수 요구 사항

- Unity 6000.2.10f1 이상
- Meta Quest 3 헤드셋 (또는 OpenXR 호환 VR 기기)
- OpenAI API 키 (GPT Vision 사용 시)

### 설정 방법

1. **프로젝트 열기**
   
   - Unity Hub에서 프로젝트 열기
   - Unity 6000.2.10f1 버전 사용 권장

2. **OpenAI API 키 설정**
   
   ```bash
   # 환경 변수 설정 (Windows)
   setx OPENAI_API_KEY "your-api-key-here"
   
   # 또는 GPTVisionAPI 컴포넌트의 인스펙터에서 직접 입력
   ```

3. **메인 씬 열기**
   
   - `Assets/Scenes/CircuitScene_achoo.unity` 열기

4. **XR 입력 확인**
   
   - `Trigger_Activate_Setup.md` 및 `Trigger_Activate_Implementation_Guide.md` 참조
   - Trigger 버튼이 Activate Action에 매핑되어 있는지 확인

5. **실행**
   
   - 에디터: XR Device Simulator로 테스트
   - 빌드: Android (Quest 3) 타겟으로 빌드

---

## 🧪 테스트 회로 예제

### 기본 LED 회로

```
[Battery +] → [Resistor] → [LED +] → [LED -] → [Battery -]
```

1. 배터리 Plus 플러그를 브레드보드 홀에 연결
2. 저항의 한 다리를 Plus와 같은 열에 배치
3. 저항의 다른 다리를 중간 열에 배치
4. LED의 Anode(+)를 저항과 같은 열에 배치
5. LED의 Cathode(-)를 다른 열에 배치
6. 배터리 Minus 플러그를 LED Cathode와 같은 열에 연결
7. 분석 버튼 클릭 → LED 점등 확인

---

## 📝 학습 데이터 파인튜닝

### 데이터 수집

- CircuitAnalyzer가 자동으로 `TrainingData/0` 및 `TrainingData/1`에 데이터 저장
- 각 데이터 포함 항목:
  - 회로 이미지 (PNG)
  - Netlist JSON
  - GPT 원본 응답
  - 시스템/사용자 프롬프트
  - 검증 이유

### 파인튜닝 실행

```bash
python finetune_pipline.py
```

자세한 내용은 `README_FINETUNING.md` 참조.

---

## 🐛 알려진 이슈 및 제한사항

1. **브레드보드 홀 수 제한**
   
   - 현재 각 홀마다 GameObject 사용 → 성능 영향 가능
   - `HoleObjectPool.cs`를 통한 최적화 고려 중

2. **GPT Vision API 비용**
   
   - 이미지 분석마다 API 호출 → 비용 발생
   - 로컬 모델 또는 파인튜닝 모델 사용 권장

3. **극성 검증 제한**
   
   - LED 극성은 CircuitComponentMetadata에 수동 설정 필요
   - 시각적 자동 감지 미지원

---

## 📖 추가 문서

- `README.md`: 프로젝트 개요 (영문)
- `Trigger_Activate_Setup.md`: XR 입력 설정 가이드
- `Trigger_Activate_Implementation_Guide.md`: 입력 구현 상세 가이드
- `README_FINETUNING.md`: GPT 파인튜닝 가이드
- `breadboard_uv_snapping_codex.md`: UV 기반 스냅 최적화 아이디어 (실험적)
- `claudedocs/`: 이전 문서 및 최적화 노트

---

## 👥 기여 및 개발

이 프로젝트는 교육용 VR 회로 시뮬레이터로, 전자공학 교육에 활용될 수 있습니다.

### 개발 팁

- 새 부품 추가: `CircuitComponentType` enum 확장 및 `CircuitComponentMetadata` 설정
- 새 검증 패턴: `CircuitTopologyRules` ScriptableObject에 패턴 추가
- UI 개선: `CircuitAnalysisUI.cs` 수정 또는 새 UI 스크립트 작성

---

## 📄 라이선스

이 프로젝트의 라이선스 정보는 프로젝트 루트의 LICENSE 파일을 참조하십시오.

---

**마지막 업데이트**: 2025년 12월 22일
