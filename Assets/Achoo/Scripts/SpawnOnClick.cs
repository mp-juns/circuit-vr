using UnityEngine;

public class SpawnOnClick : MonoBehaviour
{
    public GameObject prefab;      // 생성할 프리팹 (예: Banana)
    public Transform spawnPoint;   // 책상 위 지점(빈 오브젝트)
    public Vector3 offset;         // 살짝 띄우고 싶으면 (0,0.02,0) 같은 값

    public void Spawn()
    {
        if (!prefab || !spawnPoint) return;
        Instantiate(prefab, spawnPoint.position + offset, spawnPoint.rotation);
    }
}
