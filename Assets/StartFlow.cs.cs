using UnityEngine;
using UnityEngine.UI;

public class StartFlow : MonoBehaviour
{
    [Header("UI Panels")]
    public GameObject startUI;   // Start 화면 패널
    public GameObject selectUI;  // Select 화면 패널

    

    // Start 버튼에서 호출할 함수
    public void OnClickStart()
    {
        // 1) UI 전환
        if (startUI != null) startUI.SetActive(false);
        if (selectUI != null) selectUI.SetActive(true);

        
    }

    
}
