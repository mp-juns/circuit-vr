using UnityEngine;
using UnityEditor;
using UnityEditor.Events;
using System.Reflection;

namespace Achoo.Editor
{
    public class SimpleHoleSetup : EditorWindow
    {
        [MenuItem("Tools/Simple Hole Setup")]
        public static void ShowWindow()
        {
            GetWindow<SimpleHoleSetup>("Simple Hole Setup");
        }

        private GameObject selectedHole;

        void OnGUI()
        {
            GUILayout.Label("단일 Hole 테스트 도구", EditorStyles.boldLabel);
            GUILayout.Space(10);

            selectedHole = (GameObject)EditorGUILayout.ObjectField(
                "Test Hole",
                selectedHole,
                typeof(GameObject),
                true
            );

            GUILayout.Space(10);

            if (GUILayout.Button("1. 이벤트 필드 찾기", GUILayout.Height(30)))
            {
                FindEventFields();
            }

            if (GUILayout.Button("2. Activate 설정", GUILayout.Height(30)))
            {
                SetupSingleHole();
            }

            GUILayout.Space(10);
            EditorGUILayout.HelpBox(
                "사용법:\n" +
                "1. Hole 하나를 선택\n" +
                "2. '이벤트 필드 찾기' 클릭하여 Console 확인\n" +
                "3. 'Activate 설정' 클릭",
                MessageType.Info
            );
        }

        void FindEventFields()
        {
            if (selectedHole == null)
            {
                EditorUtility.DisplayDialog("Error", "Hole을 선택해주세요!", "OK");
                return;
            }

            var hole = selectedHole.GetComponent<BreadboardHole>();
            if (hole == null)
            {
                EditorUtility.DisplayDialog("Error", "BreadboardHole 컴포넌트가 없습니다!", "OK");
                return;
            }

            var interactable = selectedHole.GetComponent<UnityEngine.XR.Interaction.Toolkit.Interactables.XRSimpleInteractable>();
            if (interactable == null)
            {
                Debug.Log("[SimpleHoleSetup] XRSimpleInteractable이 없습니다. 추가합니다...");
                interactable = selectedHole.AddComponent<UnityEngine.XR.Interaction.Toolkit.Interactables.XRSimpleInteractable>();
                EditorUtility.SetDirty(selectedHole);
            }

            Debug.Log("=== XRSimpleInteractable 모든 필드 ===");
            var type = interactable.GetType();

            // 모든 필드 출력
            var fields = type.GetFields(BindingFlags.Instance | BindingFlags.Public | BindingFlags.NonPublic);
            foreach (var field in fields)
            {
                Debug.Log($"Field: {field.Name} (Type: {field.FieldType})");

                if (field.Name.ToLower().Contains("activ"))
                {
                    Debug.Log($">>> ACTIVATE 관련 필드 발견: {field.Name}");
                    var value = field.GetValue(interactable);
                    if (value != null)
                    {
                        Debug.Log($"    타입: {value.GetType()}");
                        Debug.Log($"    값: {value}");
                    }
                }
            }

            // 모든 프로퍼티 출력
            var props = type.GetProperties(BindingFlags.Instance | BindingFlags.Public | BindingFlags.NonPublic);
            Debug.Log("\n=== XRSimpleInteractable 모든 프로퍼티 ===");
            foreach (var prop in props)
            {
                Debug.Log($"Property: {prop.Name} (Type: {prop.PropertyType})");

                if (prop.Name.ToLower().Contains("activ"))
                {
                    Debug.Log($">>> ACTIVATE 관련 프로퍼티 발견: {prop.Name}");
                }
            }

            // SerializedObject로 확인
            Debug.Log("\n=== SerializedObject 프로퍼티 ===");
            SerializedObject so = new SerializedObject(interactable);
            SerializedProperty iterator = so.GetIterator();
            bool enterChildren = true;
            while (iterator.NextVisible(enterChildren))
            {
                enterChildren = false;
                if (iterator.propertyPath.ToLower().Contains("activ"))
                {
                    Debug.Log($">>> SerializedProperty 발견: {iterator.propertyPath}");
                }
            }
            so.Dispose();

            Debug.Log("=== 탐색 완료 ===");
            EditorUtility.DisplayDialog("완료", "Console 창에서 결과를 확인하세요!", "OK");
        }

        void SetupSingleHole()
        {
            if (selectedHole == null)
            {
                EditorUtility.DisplayDialog("Error", "Hole을 선택해주세요!", "OK");
                return;
            }

            var hole = selectedHole.GetComponent<BreadboardHole>();
            if (hole == null)
            {
                EditorUtility.DisplayDialog("Error", "BreadboardHole 컴포넌트가 없습니다!", "OK");
                return;
            }

            var interactable = selectedHole.GetComponent<UnityEngine.XR.Interaction.Toolkit.Interactables.XRSimpleInteractable>();
            if (interactable == null)
            {
                interactable = selectedHole.AddComponent<UnityEngine.XR.Interaction.Toolkit.Interactables.XRSimpleInteractable>();
                EditorUtility.SetDirty(selectedHole);
            }

            // 여러 가능한 이벤트 이름 시도
            string[] eventNames = {
                "activated",
                "m_Activated",
                "m_activated",
                "activateEvent",
                "m_ActivateEvent",
                "selectEntered",
                "m_SelectEntered"
            };

            bool success = false;
            foreach (var eventName in eventNames)
            {
                if (TrySetupEvent(interactable, hole, eventName))
                {
                    Debug.Log($"[SimpleHoleSetup] 성공! 이벤트 이름: {eventName}");
                    success = true;
                    break;
                }
            }

            if (success)
            {
                EditorUtility.SetDirty(interactable);
                UnityEditor.SceneManagement.EditorSceneManager.MarkSceneDirty(
                    UnityEditor.SceneManagement.EditorSceneManager.GetActiveScene()
                );
                EditorUtility.DisplayDialog("완료", "이벤트 설정 완료!", "OK");
            }
            else
            {
                EditorUtility.DisplayDialog("실패", "이벤트를 찾을 수 없습니다.\n'이벤트 필드 찾기'를 먼저 실행하세요.", "OK");
            }
        }

        bool TrySetupEvent(Component interactable, BreadboardHole hole, string eventName)
        {
            var type = interactable.GetType();

            // 필드로 찾기
            var field = type.GetField(eventName, BindingFlags.Instance | BindingFlags.Public | BindingFlags.NonPublic);

            // 프로퍼티로 찾기 (백킹 필드)
            if (field == null)
            {
                var prop = type.GetProperty(eventName, BindingFlags.Instance | BindingFlags.Public | BindingFlags.NonPublic);
                if (prop != null)
                {
                    field = type.GetField($"<{eventName}>k__BackingField", BindingFlags.Instance | BindingFlags.NonPublic);
                }
            }

            if (field != null)
            {
                var eventValue = field.GetValue(interactable);
                if (eventValue is UnityEngine.Events.UnityEventBase unityEvent)
                {
                    Debug.Log($"[TrySetupEvent] 이벤트 타입: {unityEvent.GetType()}");

                    // 이미 Press가 있는지 확인
                    int count = unityEvent.GetPersistentEventCount();
                    for (int i = 0; i < count; i++)
                    {
                        if (unityEvent.GetPersistentMethodName(i) == "Press")
                        {
                            Debug.Log($"[TrySetupEvent] Press 메서드가 이미 등록되어 있습니다.");
                            return true;
                        }
                    }

                    // Press 메서드 추가
                    UnityEventTools.AddVoidPersistentListener(unityEvent, hole.Press);
                    Debug.Log($"[TrySetupEvent] Press 메서드를 추가했습니다.");
                    return true;
                }
            }

            return false;
        }
    }

    // 선택된 오브젝트에서 바로 실행하는 별도 클래스
    public static class QuickHoleSetup
    {
        [MenuItem("GameObject/Setup This Hole XR", false, 0)]
        public static void SetupSelectedHole()
        {
            GameObject selected = Selection.activeGameObject;
            if (selected == null)
            {
                EditorUtility.DisplayDialog("Error", "Hole을 선택해주세요!", "OK");
                return;
            }

            var hole = selected.GetComponent<BreadboardHole>();
            if (hole == null)
            {
                EditorUtility.DisplayDialog("Error", "BreadboardHole이 없습니다!", "OK");
                return;
            }

            var interactable = selected.GetComponent<UnityEngine.XR.Interaction.Toolkit.Interactables.XRSimpleInteractable>();
            if (interactable == null)
            {
                interactable = selected.AddComponent<UnityEngine.XR.Interaction.Toolkit.Interactables.XRSimpleInteractable>();
            }

            string[] eventNames = {
                "activated", "m_Activated", "m_activated",
                "activateEvent", "m_ActivateEvent",
                "selectEntered", "m_SelectEntered"
            };

            foreach (var eventName in eventNames)
            {
                var type = interactable.GetType();
                var field = type.GetField(eventName, BindingFlags.Instance | BindingFlags.Public | BindingFlags.NonPublic);

                if (field == null)
                {
                    var prop = type.GetProperty(eventName, BindingFlags.Instance | BindingFlags.Public | BindingFlags.NonPublic);
                    if (prop != null)
                    {
                        field = type.GetField($"<{eventName}>k__BackingField", BindingFlags.Instance | BindingFlags.NonPublic);
                    }
                }

                if (field != null)
                {
                    var eventValue = field.GetValue(interactable);
                    if (eventValue is UnityEngine.Events.UnityEventBase unityEvent)
                    {
                        UnityEventTools.AddVoidPersistentListener(unityEvent, hole.Press);
                        EditorUtility.SetDirty(interactable);
                        UnityEditor.SceneManagement.EditorSceneManager.MarkSceneDirty(
                            UnityEditor.SceneManagement.EditorSceneManager.GetActiveScene()
                        );
                        EditorUtility.DisplayDialog("완료", $"이벤트 설정 완료!\n이벤트: {eventName}", "OK");
                        return;
                    }
                }
            }

            EditorUtility.DisplayDialog("실패", "이벤트를 찾을 수 없습니다.", "OK");
        }
    }
}
