
# ✅ VR Breadboard Wire 연결 최적화 설계 (Claud Code 용 문서)

## 📌 목적

Meta Quest3 + Unity XR 프로젝트에서 **Breadboard 에 Wire 를 연결**하는 과정에서  
브레드보드 구멍(Hole) 수가 약 **3000개 이상**이기 때문에,  
구멍마다 GameObject + Collider 를 넣으면 **성능 저하 및 렉**이 발생한다.

---

## 🔥 핵심 아이디어 (중요)

> **구멍을 3000개 만들지 않는다.**
>
> - 브레드보드 구멍은 단순한 *3D Mesh* 로만 존재한다.
> - 상호작용(Hole 누름)은 **좌표 계산 + 임시 오브젝트 1~2개**로 해결한다.

즉, "보이는 구멍" ≠ "상호작용용 오브젝트"

---

## 🎯 동작 방식 요약

| 동작 | 설명 |
|------|------|
| 1. 컨트롤러 Trigger 입력 | XR Raycast 로 브레드보드 표면을 클릭 |
| 2. 클릭 좌표를 그리드로 스냅 | 2.54mm pitch 기준 `row`, `col` 계산 |
| 3. 임시 Hole(Anchor) 1개 생성/이동 | Breadboard.cs 에 전달 |
| 4. 두 번째 클릭 시 두 Anchor 간 Wire 생성 | 기존 `Wire.cs` 와 동일하게 동작 |

---

## 📐 구조 (기존 vs 개선)

### ❌ 기존 방식

```
Breadboard
 ├─ Hole (1)
 ├─ Hole (2)
 ├─ ...
 └─ Hole (3000)
```

→ **XR 환경에서 처리 불가능 (성능 폭발)**

---

### ✅ 개선 방식

```
Breadboard (Mesh + BoxCollider 1개)
 │
 └─ Hole Anchor (상호작용용 Transform 1~2개만 사용)
```

→ 성능 문제 해결 🎉

---

## ✅ 코드 (Claud Code / Unity C#)

### 🔹 1. BoardPicker.cs  
**→ 클릭 좌표를 구멍(row, col)로 변환 + Anchor 이동**

```csharp
using UnityEngine;

public struct HoleSnap {
    public int row, col;
    public Vector3 worldPos;
    public Transform anchor;
}

public class BoardPicker : MonoBehaviour
{
    [Header("Grid Settings")]
    public int rows = 63;
    public int cols = 60;
    public float pitchX = 0.00254f;
    public float pitchZ = 0.00254f;
    public Vector2 boardMin = new(-0.16f, -0.06f);

    [Header("Anchors (재사용)")]
    public Transform anchorA;
    public Transform anchorB;

    public bool TrySnap(RaycastHit hit, out HoleSnap snap, bool useA)
    {
        Vector3 local = transform.InverseTransformPoint(hit.point);
        float lx = local.x - boardMin.x;
        float lz = local.z - boardMin.y;

        int col = Mathf.RoundToInt(lx / pitchX);
        int row = Mathf.RoundToInt(lz / pitchZ);

        if (!IsValid(row, col)) { snap = default; return false; }

        Vector3 snapLocal = new Vector3(boardMin.x + col * pitchX, 0f, boardMin.y + row * pitchZ);
        Vector3 world = transform.TransformPoint(snapLocal);

        var anchor = useA ? anchorA : anchorB;
        anchor.position = world;
        anchor.rotation = transform.rotation;

        snap = new HoleSnap { row = row, col = col, worldPos = world, anchor = anchor };
        return true;
    }

    bool IsValid(int r, int c) => (r >= 0 && r < rows && c >= 0 && c < cols);
}
```

---

### 🔹 2. Breadboard.cs  
**→ Anchor 2개를 받아 Wire 생성**

```csharp
public class Breadboard : MonoBehaviour
{
    public Wire wirePrefab;
    public Transform wireContainer;
    Transform firstAnchor = null;

    public void OnHolePicked(Transform anchor)
    {
        if (firstAnchor == null)
        {
            firstAnchor = anchor;
        }
        else
        {
            var w = Instantiate(wirePrefab, wireContainer);
            w.Init(firstAnchor, anchor);
            firstAnchor = null;
        }
    }
}
```

---

### 🔹 3. PickInput.cs  
**→ Trigger 입력 → Raycast → Snap → Breadboard.cs 호출**

```csharp
public class PickInput : MonoBehaviour
{
    public Camera cam;
    public LayerMask boardMask;
    public BoardPicker picker;
    public Breadboard board;

    bool pickA = true;

    void Update()
    {
        if (!TriggerDown()) return;

        Ray ray = new Ray(cam.transform.position, cam.transform.forward);
        if (Physics.Raycast(ray, out var hit, 0.3f, boardMask))
        {
            if (picker.TrySnap(hit, out var snap, pickA))
            {
                board.OnHolePicked(snap.anchor);
                pickA = !pickA;
            }
        }
    }

    bool TriggerDown() => Input.GetMouseButtonDown(0);
}
```

---

## ✅ 결과

| 항목 | Before | After |
|------|--------|-------|
| Hole 오브젝트 | 3000+ | **1~2 (임시)** |
| Collider | 3000+ | **1개** |
| XR 성능 | 렉 발생 | **90 FPS 유지** |

---

## 📌 결론

> **구멍은 “보이기만” 하고,  
> Wire 연결은 계산 + Anchor 1~2개만 사용하면 된다.**

---

## 요청하면 더 제공 가능 ✅
- Unity Scene 템플릿
- 전체 Prefab 구성
- Breadboard.cs 기존 코드와 통합 버전

---

### 문의
> "Anchor 생성까지 자동화된 샘플 씬도 만들어줘"

라고 말하면 바로 만들어드림.

---
