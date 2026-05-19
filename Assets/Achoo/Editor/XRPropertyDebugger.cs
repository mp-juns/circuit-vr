using UnityEngine;
using UnityEditor;

namespace Achoo.Editor
{
    public class XRPropertyDebugger : EditorWindow
    {
        private GameObject testObject;

        [MenuItem("Tools/Debug XR Properties")]
        public static void ShowWindow()
        {
            GetWindow<XRPropertyDebugger>("XR Property Debugger");
        }

        void OnGUI()
        {
            GUILayout.Label("XR Interactable Property Debugger", EditorStyles.boldLabel);
            GUILayout.Space(10);

            testObject = (GameObject)EditorGUILayout.ObjectField(
                "Test Object with XRSimpleInteractable",
                testObject,
                typeof(GameObject),
                true
            );

            GUILayout.Space(10);

            if (GUILayout.Button("Debug Properties", GUILayout.Height(30)))
            {
                DebugProperties();
            }
        }

        void DebugProperties()
        {
            if (testObject == null)
            {
                EditorUtility.DisplayDialog("Error", "오브젝트를 선택해주세요!", "OK");
                return;
            }

            var interactable = testObject.GetComponent<UnityEngine.XR.Interaction.Toolkit.Interactables.XRSimpleInteractable>();
            if (interactable == null)
            {
                EditorUtility.DisplayDialog("Error", "XRSimpleInteractable이 없습니다!", "OK");
                return;
            }

            SerializedObject so = new SerializedObject(interactable);
            SerializedProperty iterator = so.GetIterator();

            Debug.Log("=== XRSimpleInteractable Properties ===");

            bool enterChildren = true;
            while (iterator.NextVisible(enterChildren))
            {
                enterChildren = false;
                Debug.Log($"Property: {iterator.propertyPath} (Type: {iterator.propertyType})");

                // Activate 관련 프로퍼티 찾기
                if (iterator.propertyPath.ToLower().Contains("activate"))
                {
                    Debug.Log($">>> FOUND ACTIVATE: {iterator.propertyPath}");
                }
            }

            Debug.Log("=== End of Properties ===");
            so.Dispose();

            EditorUtility.DisplayDialog("완료", "Console 창을 확인하세요!", "OK");
        }
    }
}
