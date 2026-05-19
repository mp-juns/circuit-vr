using UnityEngine;

public class AssignHoleData : MonoBehaviour
{
    public GameObject holeGroup;
    public int columnsPerRow = 10;   // 한 줄에 들어가는 홀 개수 (지금은 10)

    void Start()
    {
        if (holeGroup == null)
        {
            Debug.LogError("HoleGroup is not assigned.");
            return;
        }

        foreach (Transform child in holeGroup.transform)
        {
            HoleData holeData = child.GetComponent<HoleData>();
            if (holeData == null)
            {
                Debug.LogWarning($"'{child.name}' does not have a HoleData component.");
                continue;
            }

            // 이름에서 숫자 부분 추출: "Hole_00" -> "00" -> 0
            int index = GetIndexFromName(child.name);
            if (index < 0)
            {
                Debug.LogWarning($"'{child.name}' 이름에서 인덱스를 읽을 수 없습니다.");
                continue;
            }

            int row    = index / 10;
            int column = index % columnsPerRow;

            holeData.SetData(row, column);
        }
    }

    int GetIndexFromName(string name)
    {
        // "Hole_00", "Hole_7", "Hole_123" 모두 대응
        int underscore = name.LastIndexOf('_');
        if (underscore < 0 || underscore == name.Length - 1)
            return -1;

        string numberPart = name.Substring(underscore + 1); // "_" 뒤의 문자열
        if (int.TryParse(numberPart, out int index))
            return index;

        return -1;
    }
}
