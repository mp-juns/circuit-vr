# Circuit Capstone KDS2

> **VR 브레드보드 회로 시뮬레이터** — Meta Quest 3에서 가상 브레드보드에 부품을 꽂고 와이어를 연결해 회로를 조립한 뒤, GPT Vision AI가 정답 여부를 판정해주는 교육용 XR 캡스톤 프로젝트입니다.

---

## 목차

- [프로젝트 개요](#프로젝트-개요)
- [핵심 기능](#핵심-기능)
- [기술 스택](#기술-스택)
- [동작 방식](#동작-방식)
- [프로젝트 구조](#프로젝트-구조)
- [핵심 스크립트 설명](#핵심-스크립트-설명)
- [시작하기](#시작하기)
- [AI 분석 파이프라인](#ai-분석-파이프라인)
- [알려진 이슈](#알려진-이슈)

---

## 프로젝트 개요

전자회로 실습을 VR로 구현한 교육 시뮬레이터입니다. 사용자는 Meta Quest 3를 착용한 채로 손(또는 컨트롤러)을 사용해 가상 브레드보드에 저항·LED 등의 부품을 직접 꽂고 점퍼 와이어로 연결합니다. 조립이 끝나면 컨트롤러 버튼 한 번으로 GPT Vision API에 회로 사진과 넷리스트 JSON을 전송해 정답 여부를 판정받고, 결과에 따라 LED 점등·파티클·효과음으로 즉각적인 피드백을 받습니다.

학습 데이터 자동 수집 기능도 내장되어 있어, 매 분석마다 이미지·넷리스트·GPT 응답을 로컬에 저장하고 `finetune_pipeline.py`로 OpenAI 파인튜닝까지 이어질 수 있습니다.

---

## 핵심 기능

| 기능 | 설명 |
|------|------|
| **와이어 연결** | 브레드보드 홀을 순서대로 2번 클릭 → 와이어 생성. 같은 두 홀을 다시 클릭하면 삭제(토글) |
| **부품 자석 스냅** | 부품 두 다리(Leg A/B)가 홀에 가까워지면 자동으로 스냅 미리보기 → 손을 놓으면 고정 |
| **AI 회로 검증** | Quest X 버튼 → 회로 캡처 → GPT Vision API 호출 → 정답(1) / 오답(0) |
| **로컬 위상 검증** | 넷리스트를 DSU 알고리즘으로 분석해 GPT 호출 전에 물리적 정합성 먼저 체크 |
| **하이브리드 분석** | 이미지 + 넷리스트 JSON을 함께 GPT에 전송해 환각(hallucination) 방지 |
| **LED 피드백** | 정답 판정 + 부품이 보드에 꽂혀 있을 때만 LED 조명·파티클 ON |
| **휴지통 삭제** | 부품을 쓰레기통 트리거에 던지면 자동 삭제 |
| **전체 초기화** | 버튼 한 번으로 모든 와이어·배치된 부품 제거 |
| **학습 데이터 수집** | 분석마다 이미지·넷리스트·프롬프트·GPT 응답을 자동 저장 |

---

## 기술 스택

| 항목 | 버전 |
|------|------|
| Unity | 6000.2.10f1 |
| 타겟 플랫폼 | Meta Quest 3 (Android / OpenXR) |
| XR Interaction Toolkit | 3.2.1 |
| XR Hands | 1.7.0 |
| Input System | 1.14.2 |
| OpenXR | 1.15.1 |
| Universal Render Pipeline | 17.2.0 |
| AI 모델 | gpt-4.1-mini (OpenAI Vision) |

---

## 동작 방식

### 전체 흐름

```
사용자 (Quest 3)
    │
    ├─ 부품 집기 → 브레드보드에 스냅 배치
    ├─ 홀 클릭×2 → 와이어 연결/삭제
    │
    └─ X 버튼 누름
           │
           ▼
    XRAnalyzeTrigger
           │
           ▼
    CircuitAnalyzer.AnalyzeCurrentCircuit()
           │
           ├─ ① 로컬 검증
           │       BreadboardNetlistBuilder  →  DSU로 넷리스트 생성
           │       CircuitTopologyValidator  →  규칙 기반 위상 검증
           │
           ├─ ② 카메라 캡처
           │       scanCamera.Render()  →  Texture2D  →  Base64 PNG
           │
           └─ ③ GPT 요청 (Hybrid 모드)
                   System:  "넷리스트 JSON을 절대적 진리로 사용하라"
                   User:    이미지 + 넷리스트 JSON 첨부
                   응답:    첫 줄 "1"(정답) / "0"(오답) + 한국어 JSON 상세
                        │
                        ▼
               OnCircuitValid / OnCircuitInvalid 이벤트 발행
                        │
               ┌────────┴────────┐
               ▼                 ▼
        LEDPowerVisualizer   GptFeedbackEffects
        (LED 조명 ON/OFF)    (파티클 + 효과음)
                        │
                        ▼
               학습 데이터 저장
               TrainingData/1/ 또는 TrainingData/0/
```

### 부품 스냅 흐름

```
부품 잡기 (XR Grab)
    │
    └─ ElementConfig.OnGrabbed()
            │  Rigidbody 활성화
            │  ElementPlacementManager에 등록
            │
            ▼ (매 프레임 Update)
    LegTriggerRelay (Leg A / Leg B 콜라이더)
            │  홀 콜라이더 감지
            ▼
    EvaluateDualLegSnap()
            │  두 다리가 각각 다른 홀에 닿음?
            │  YES → 스냅 위치·회전 계산 → 미리보기 이동
            ▼
    부품 놓기 (XR Release)
            │
            └─ ApplySnapPose() → LockInPlace()
                   Rigidbody Kinematic ON, 위치 고정
```

---

## 프로젝트 구조

```
Circuit_Capston_KDS2/
├── Assets/
│   ├── Achoo/                        ← 핵심 커스텀 시스템 (네임스페이스: Achoo)
│   │   ├── Scripts/
│   │   │   ├── Breadboard.cs         ← 와이어 연결 관리
│   │   │   ├── BreadboardHole.cs     ← 개별 홀 인터랙션
│   │   │   ├── Wire.cs               ← LineRenderer 와이어 (4점 ㄷ자)
│   │   │   ├── ElementConfig.cs      ← 부품 자석 스냅 + XR Grab
│   │   │   ├── ElementPlacementManager.cs
│   │   │   ├── CircuitAnalyzer.cs    ← 분석 진입점 (3가지 모드)
│   │   │   ├── GPTVisionAPI.cs       ← OpenAI API 호출
│   │   │   ├── CameraCapture.cs      ← 카메라 → Texture2D → Base64
│   │   │   ├── BreadboardNetlistBuilder.cs  ← DSU 넷리스트 생성
│   │   │   ├── CircuitTopologyValidator.cs  ← 규칙 기반 검증
│   │   │   ├── CircuitRuntimeState.cs       ← 씬 상태 스냅샷
│   │   │   ├── LEDPowerVisualizer.cs ← LED 조명/파티클 제어
│   │   │   ├── GptFeedbackEffects.cs ← 성공/실패 효과음·파티클
│   │   │   ├── CircuitAnalysisUI.cs  ← 분석 결과 텍스트 UI
│   │   │   ├── XRAnalyzeTrigger.cs   ← Quest X버튼 → 분석 트리거
│   │   │   ├── TrashBin.cs           ← 트리거 휴지통
│   │   │   ├── CircuitClearManager.cs← 전체 초기화
│   │   │   ├── BatteryPlug.cs        ← 배터리 플러그 스냅
│   │   │   ├── StapleWire.cs         ← 배터리 고정선 (베지에)
│   │   │   └── Not_Using/            ← 미사용 구버전 스크립트
│   │   └── Editor/                   ← 에디터 전용 툴
│   │       ├── HoleGroupSetup.cs     ← 홀 일괄 XR 설정 도구
│   │       └── BreadboardHoleConfigurator.cs
│   ├── Scenes/
│   │   ├── CircuitScene_achoo.unity  ← 메인 게임 씬
│   │   └── SampleScene.unity         ← 시작 메뉴 씬
│   ├── VRTemplateAssets/             ← Unity VR 템플릿 (서드파티)
│   └── Samples/                      ← XR Toolkit 샘플 (서드파티)
│
├── Packages/
│   ├── manifest.json                 ← 패키지 의존성 목록
│   └── packages-lock.json
│
├── ProjectSettings/                  ← 빌드·XR·입력 설정
├── finetune_pipeline.py              ← OpenAI 파인튜닝 파이프라인
└── README.md
```

---

## 핵심 스크립트 설명

### Breadboard.cs
와이어 연결의 핵심. 홀 클릭 이벤트를 받아 "첫 번째 홀 선택 → 두 번째 홀 클릭 시 와이어 생성/삭제"를 처리합니다. `Dictionary<string, Wire>`(키: 홀 인스턴스ID 쌍)로 중복 방지 및 토글을 구현합니다.

### ElementConfig.cs
XRGrabInteractable을 래핑해 부품의 자석 스냅을 구현합니다. 부품 두 다리 끝에 `LegTriggerRelay` 콜라이더를 붙여 홀 감지 → 스냅 위치·회전 계산 → 손을 놓는 순간 `isKinematic = true`로 고정합니다.

### CircuitAnalyzer.cs
세 가지 분석 모드를 지원합니다.
- `LogicOnly` — GPT 없이 로컬 검증만
- `GptVisionOnly` — 이미지만 GPT에 전송
- `GptHybridImagePlusNetlist` (**기본값**) — 이미지 + 넷리스트 JSON을 함께 전송해 환각 방지

### GPTVisionAPI.cs
`UnityWebRequest`로 OpenAI Chat Completions API를 호출합니다. API 키는 인스펙터 필드 또는 환경변수 `OPENAI_API_KEY`에서 로드합니다. **씬 파일에 API 키를 직접 입력하면 GitHub에 노출되므로 반드시 환경변수를 사용하세요.**

### BreadboardNetlistBuilder.cs
씬의 현재 상태(홀, 와이어, 배치된 부품, 배터리 플러그)를 읽어 DSU(Disjoint Set Union) 알고리즘으로 전기적 연결 관계를 분석하고 넷리스트 JSON을 생성합니다.

---

## 시작하기

### 요구 사항

- Unity **6000.2.10f1**
- Meta Quest 3 또는 OpenXR 호환 VR 기기
- OpenAI API 키 (GPT Vision 사용 시)

### 설치 및 실행

```bash
# 1. 저장소 클론
git clone https://github.com/<your-repo>/Circuit_Capston_KDS2.git

# 2. Unity Hub에서 프로젝트 열기
#    Unity 버전: 6000.2.10f1
```

```bash
# 3. API 키 환경변수 설정 (Windows)
setx OPENAI_API_KEY "sk-..."
```

```
# 4. Unity에서
#    Assets/Scenes/CircuitScene_achoo.unity 열기
#    Play 버튼 → XR Device Simulator로 에디터 내 테스트
```

```
# 5. Quest 3 빌드
#    File → Build Settings → Android
#    Run Device: Quest 3
#    Build And Run
```

### API 키 주의사항

> **⚠️ 중요:** `GPTVisionAPI` 컴포넌트의 인스펙터 `Api Key` 필드에 키를 직접 입력하면 씬 파일(`.unity`) YAML에 평문으로 저장되어 GitHub에 노출됩니다.  
> 반드시 필드를 **비워두고** 환경변수 `OPENAI_API_KEY`를 사용하세요.

---

## AI 분석 파이프라인

### 회로 검증 (런타임)

Quest X 버튼을 누르면:
1. 로컬 넷리스트 생성 → 위상 규칙 검증
2. `scanCamera`로 브레드보드 이미지 캡처 (기본 1024×1024)
3. 넷리스트 JSON + 이미지를 GPT에 전송
4. 응답 첫 줄 `1` → `OnCircuitValid`, `0` → `OnCircuitInvalid` 이벤트 발행
5. 분석 아티팩트를 `Application.persistentDataPath/AnalysisArtifacts/`에 저장

### 파인튜닝 데이터 수집

매 분석마다 `Application.persistentDataPath/TrainingData/[0 or 1]/`에 자동 저장:
- `Circuit_[timestamp].png` — 회로 이미지
- `Circuit_[timestamp].json` — 프롬프트·GPT 응답·넷리스트 통합 메타데이터
- `Circuit_[timestamp]_netlist.json` — 넷리스트 JSON 단독

### 파인튜닝 실행

```bash
python finetune_pipeline.py
# Photos/0, Photos/1 폴더의 이미지를 읽어
# training_data.jsonl, validation_data.jsonl 생성 후 OpenAI 파인튜닝 API 호출
```

---

## 알려진 이슈

| 이슈 | 상태 |
|------|------|
| `StartButton.cs`가 로드하는 씬명이 `"MainScene"`이지만 실제 씬명과 다름 | 미수정 |
| `Assets/StartFlow.cs.cs` 파일명에 `.cs` 중복 | 미수정 |
| `debugSavePath = "D:/Achoo_Captures/"` — Quest 기기에서 경로 없음 | 미수정 |
| 홀마다 GameObject 사용으로 홀 수 증가 시 성능 저하 가능 | 최적화 예정 (`HoleObjectPool.cs` 참조) |
| GPT Vision API 호출마다 비용 발생 | 파인튜닝 모델 전환 고려 중 |

---

## 라이선스

이 프로젝트는 학술 캡스톤 프로젝트입니다.  
`Assets/VRTemplateAssets`, `Assets/Samples`, `Assets/_PoiyomiShaders` 등 서드파티 에셋은 각 원저작자의 라이선스를 따릅니다.
