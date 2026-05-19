
# 🚀 VR Breadboard 최적화 설계
### Unity + Meta Quest3 / XR Interaction Toolkit

---

## ✅ 목적

브레드보드에는 약 **3,000개 이상의 구멍(Hole)** 이 존재한다.  
이를 모두 GameObject / Collider 로 생성하면 성능이 급격하게 떨어진다.

> **문제:** 3000개의 Hole GameObject → Physics / XR Interaction / DrawCall 증가 → 렉 발생

---

## ✅ 해결 전략 (핵심 아이디어)

> **보이는 구멍은 전부 "메쉬"로만 사용하고, 상호작용되는 Hole 오브젝트는 단 하나만 사용한다.**

✅ 구멍을 전부 GameObject 로 만들 필요 없음  
✅ 컨트롤러가 가리킨 위치를 계산하여 "해당 구멍" 을 결정  
✅ 그 위치에 임시 Hole 오브젝트 1개(또는 소수만) 생성하여 Wire 로직만 실행

---

## 📌 왜 가능한가?

브레드보드는 일정한 간격(2.54mm pitch)을 가진 **그리드 구조**다.

Raycast 로 충돌 위치를 얻고,
그 좌표를 그리드로 스냅하여 row/column 을 계산할 수 있다.

```csharp
int row = Mathf.RoundToInt(local.z / pitchZ);
int col = Mathf.RoundToInt(local.x / pitchX);
```

따라서, **구멍을 GameObject 로 만들 필요 없이 계산으로 위치를 결정할 수 있다.**

---

## 🔍 동작 흐름

| 단계 | 동작 설명 |
|------|------------|
| 1 | 컨트롤러 Trigger 입력 → Breadboard 를 향해 Raycast |
| 2 | 충돌된 좌표를 `row / column` grid index 로 변환 |
| 3 | 그 위치에 **임시 Hole 오브젝트를 생성** |
| 4 | `Breadboard.OnHolePressed()` 호출 |
| 5 | 두 번째 선택이 들어오면 `Wire` 생성 |
| 6 | 임시 Hole 오브젝트는 삭제 또는 Object Pool 로 반환 |

---

## ❌ 기존 방식 (문제점)

```
Breadboard
 ├─ Hole (1)
 ├─ Hole (2)
 ├─ Hole (3)
 ...
 └─ Hole (3000)
```

| 항목 | 문제점 |
|------|--------|
| GameObject 3000개 | 씬이 무거워지고 XR 환경에서는 프레임 저하 |
| Collider 3000개 | 물리/Raycast 처리량 증가 |
| XR Interaction | 각 Hole 이 이벤트 대상이 되어 과부하 |

---

## ✅ 최적화된 설계

```
Breadboard (FBX Mesh + Box Collider 1개)
 │
 └─ Hole (필요할 때만 생성되는 1개의 임시 오브젝트)
```

| 항목 | 최적화 결과 |
|------|-------------|
| Hole GameObject 수 | **3000 → 1 (또는 2~3개)** |
| Collider 수 | **3000 → 1** |
| 성능 | XR에서도 안정된 FPS 유지 |
| 유지관리 | Hierarchy 깔끔, 디버깅 용이 |

---

## ✏️ 코드 예시 (핵심)

### 1) Breadboard surface 에 Raycast → local position 을 구함

```csharp
Ray ray = new Ray(controller.position, controller.forward);
if (Physics.Raycast(ray, out var hit, 0.3f, boardLayer))
{
    Vector3 local = board.transform.InverseTransformPoint(hit.point);
    int row = Mathf.RoundToInt(local.z / pitchZ);
    int col = Mathf.RoundToInt(local.x / pitchX);
}
```

### 2) 구멍 위치에만 임시 Hole 생성

```csharp
var hole = holePool.Spawn(snapWorldPos);
hole.Press(); // 기존 Breadboard.cs 로직 그대로 사용
```

### 3) Wire 생성이 끝나면 반환

```csharp
holePool.Despawn(hole);
```

---

## 📈 성능 향상 효과

| 항목 | Before | After |
|------|--------|--------|
| GameObject 수 | 3000+ | 1~3 |
| Collider 수 | 3000+ | 1 |
| XR Interaction 비용 | 매우 높음 | 매우 낮음 |
| FPS | 불안정 (드랍 발생) | 안정적 (90Hz 유지) |

---

## 📌 결론

> 🔥 **구멍은 보여주기만 하고, 상호작용되는 Hole 은 하나만 생성한다.**

이 방식은 VR/XR 에서 필수적인 최적화 기법이며,  
Wire 생성, Breadboard.cs 구조를 그대로 유지하면서도 **성능을 극적으로 향상**시킨다.

---

## 문의 / 개선 요청

- Hole 스냅 알고리즘 코드가 필요하다면 추가 제공 가능
- Object Pool or Wire 생성까지 포함한 Sample Scene 제작 가능

```
요청: "샘플 씬 코드도 주세요"
→ 즉시 생성해드립니다.
```

---
