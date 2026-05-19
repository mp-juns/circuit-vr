using UnityEngine;
using UnityEngine.SceneManagement;

public class StartButton : MonoBehaviour
{
    // OnClick에 연결할 메서드는 public void, 매개변수 없어야 드롭다운에 뜹니다.
    public void LoadNextScene()
    {
        SceneManager.LoadScene("MainScene"); // Build Settings에 등록된 씬 이름
    }

    public void PrintMessage()
    {
        Debug.Log("Start Button Clicked!");
    }
}


