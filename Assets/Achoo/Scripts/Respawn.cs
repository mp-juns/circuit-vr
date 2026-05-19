using UnityEngine;

public class Respawn : MonoBehaviour
{
    public Transform playerOrigin;
    public Transform respawnPoint;
    public float deathHeight = -20f;    // 이 높이 아래로 떨어지면 리스폰

    private Rigidbody playerRigidbody;
    // Start is called once before the first execution of Update after the MonoBehaviour is created
    void Start()
    {
        if (playerOrigin != null)
        {
            playerRigidbody = playerOrigin.GetComponent<Rigidbody>();
        }
    }

    // Update is called once per frame
    void Update()
    {
        if (playerOrigin != null && playerOrigin.position.y < deathHeight)
        {
            RespawnPlayer();
        }
    }
    private void RespawnPlayer()
    {
        if (playerRigidbody != null)
        {
            playerRigidbody.linearVelocity = Vector3.zero;
            playerRigidbody.angularVelocity = Vector3.zero;
        }

        playerOrigin.position = respawnPoint.position;
    }
}
