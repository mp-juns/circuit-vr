using UnityEngine;
using UnityEditor;
using UnityEngine.Events;
using UnityEngine.XR.Interaction.Toolkit.Interactables;

namespace Achoo.Editor
{
    public class HoleGroupSetup : EditorWindow
    {
        private GameObject holeGroupObject;
        internal const int MaxDailySetupCount = 600;
        private const string PressMethodName = "Press";
        private static readonly string[] ActivateEventPropertyNames = { "m_ActivateEvent", "activateEvent", "m_Activated", "activated" };

        [MenuItem("Tools/Setup Hole XR Interactables")]
        public static void ShowWindow()
        {
            GetWindow<HoleGroupSetup>("Hole XR Setup");
        }

        void OnGUI()
        {
            GUILayout.Label("HoleGroup XR Interactable Setup", EditorStyles.boldLabel);
            GUILayout.Space(10);

            holeGroupObject = (GameObject)EditorGUILayout.ObjectField(
                "HoleGroup Object",
                holeGroupObject,
                typeof(GameObject),
                true
            );

            GUILayout.Space(10);

            if (GUILayout.Button("Setup All Holes", GUILayout.Height(30)))
            {
                SetupHoles();
            }

            GUILayout.Space(10);
            EditorGUILayout.HelpBox(
                "이 도구는 HoleGroup 내의 모든 BreadboardHole 컴포넌트를 찾아서:\n" +
                "1. XRSimpleInteractable 추가 (없으면)\n" +
                "2. Activate 이벤트에 BreadboardHole.Press 연결",
                MessageType.Info
            );
        }

        void SetupHoles()
        {
            if (holeGroupObject == null)
            {
                EditorUtility.DisplayDialog("Error", "HoleGroup 오브젝트를 선택해주세요!", "OK");
                return;
            }

            BreadboardHole[] holes = holeGroupObject.GetComponentsInChildren<BreadboardHole>(true);

            if (holes.Length == 0)
            {
                EditorUtility.DisplayDialog("Error", "BreadboardHole 컴포넌트를 찾을 수 없습니다!", "OK");
                return;
            }

            if (holes.Length > MaxDailySetupCount)
            {
                EditorUtility.DisplayDialog(
                    "Limit Exceeded",
                    $"한 번에 {MaxDailySetupCount}개를 초과하여 설정할 수 없습니다.\n여러 번에 나누어 진행해주세요.",
                    "OK"
                );
                return;
            }

            ConfigureHoles(holes, out int setupCount, out int skippedCount);

            UnityEditor.SceneManagement.EditorSceneManager.MarkSceneDirty(
                UnityEditor.SceneManagement.EditorSceneManager.GetActiveScene()
            );

            EditorUtility.DisplayDialog(
                "완료",
                $"총 {holes.Length}개:\n✅ {setupCount}개 설정\n⏭️ {skippedCount}개 건너뜀",
                "OK"
            );

            Debug.Log($"[HoleGroupSetup] Setup complete: {setupCount} configured, {skippedCount} skipped");
        }

        internal static void ConfigureHoles(BreadboardHole[] holes, out int setupCount, out int skippedCount)
        {
            setupCount = 0;
            skippedCount = 0;

            Undo.SetCurrentGroupName("Setup Hole XR Interactables");
            int undoGroup = Undo.GetCurrentGroup();

            foreach (var hole in holes)
            {
                if (hole == null || hole.gameObject == null)
                {
                    skippedCount++;
                    continue;
                }

                var interactable = hole.GetComponent<XRSimpleInteractable>();
                if (interactable == null)
                {
                    interactable = Undo.AddComponent<XRSimpleInteractable>(hole.gameObject);
                }
                else
                {
                    Undo.RecordObject(interactable, "Configure XR Interactable");
                }

                if (TryEnsurePressListener(interactable, hole))
                {
                    setupCount++;
                }
                else
                {
                    skippedCount++;
                }
            }

            Undo.CollapseUndoOperations(undoGroup);
        }

        private static bool TryEnsurePressListener(XRSimpleInteractable interactable, BreadboardHole hole)
        {
            var serializedInteractable = new SerializedObject(interactable);
            serializedInteractable.Update();
            var activateEvent = FindActivateEventProperty(serializedInteractable);

            if (activateEvent == null)
            {
                Debug.LogWarning($"[HoleGroupSetup] Cannot find Activate event on {interactable.gameObject.name}");
                return false;
            }

            var callsArray = activateEvent.FindPropertyRelative("m_PersistentCalls.m_Calls");
            if (callsArray == null)
            {
                Debug.LogWarning($"[HoleGroupSetup] Persistent call array missing on {interactable.gameObject.name}");
                return false;
            }

            for (int i = 0; i < callsArray.arraySize; i++)
            {
                var call = callsArray.GetArrayElementAtIndex(i);
                var target = call.FindPropertyRelative("m_Target").objectReferenceValue;
                var methodName = call.FindPropertyRelative("m_MethodName").stringValue;

                if (target == hole && methodName == PressMethodName)
                {
                    return false;
                }
            }

            callsArray.arraySize++;
            var newCall = callsArray.GetArrayElementAtIndex(callsArray.arraySize - 1);
            ResetPersistentCall(newCall);

            newCall.FindPropertyRelative("m_Target").objectReferenceValue = hole;
            newCall.FindPropertyRelative("m_MethodName").stringValue = PressMethodName;
            newCall.FindPropertyRelative("m_Mode").intValue = (int)PersistentListenerMode.Void;
            newCall.FindPropertyRelative("m_CallState").intValue = (int)UnityEventCallState.RuntimeOnly;

            serializedInteractable.ApplyModifiedProperties();
            EditorUtility.SetDirty(interactable);

            return true;
        }

        private static SerializedProperty FindActivateEventProperty(SerializedObject serializedObject)
        {
            foreach (var propertyName in ActivateEventPropertyNames)
            {
                var property = serializedObject.FindProperty(propertyName);
                if (property != null)
                {
                    return property;
                }
            }

            return null;
        }

        private static void ResetPersistentCall(SerializedProperty call)
        {
            call.FindPropertyRelative("m_Target").objectReferenceValue = null;
            call.FindPropertyRelative("m_MethodName").stringValue = string.Empty;
            call.FindPropertyRelative("m_Mode").intValue = (int)PersistentListenerMode.Void;
            call.FindPropertyRelative("m_CallState").intValue = (int)UnityEventCallState.RuntimeOnly;

            var arguments = call.FindPropertyRelative("m_Arguments");
            if (arguments != null)
            {
                arguments.FindPropertyRelative("m_ObjectArgument").objectReferenceValue = null;
                arguments.FindPropertyRelative("m_ObjectArgumentAssemblyTypeName").stringValue = string.Empty;
                arguments.FindPropertyRelative("m_IntArgument").intValue = 0;
                arguments.FindPropertyRelative("m_FloatArgument").floatValue = 0f;
                arguments.FindPropertyRelative("m_StringArgument").stringValue = string.Empty;
                arguments.FindPropertyRelative("m_BoolArgument").boolValue = false;
            }
        }
    }

    // 컨텍스트 메뉴
    public class HoleGroupContextMenu
    {
        [MenuItem("GameObject/Setup Hole XR Interactables", false, 0)]
        static void SetupFromContextMenu()
        {
            GameObject selected = Selection.activeGameObject;
            if (selected == null)
            {
                EditorUtility.DisplayDialog("Error", "HoleGroup 오브젝트를 먼저 선택해주세요!", "OK");
                return;
            }

            BreadboardHole[] holes = selected.GetComponentsInChildren<BreadboardHole>(true);
            if (holes.Length == 0)
            {
                EditorUtility.DisplayDialog("Error", "선택한 오브젝트에서 BreadboardHole을 찾을 수 없습니다!", "OK");
                return;
            }

            if (holes.Length > HoleGroupSetup.MaxDailySetupCount)
            {
                EditorUtility.DisplayDialog(
                    "Limit Exceeded",
                    $"한 번에 {HoleGroupSetup.MaxDailySetupCount}개를 초과하여 설정할 수 없습니다.\n여러 번에 나누어 진행해주세요.",
                    "OK"
                );
                return;
            }

            HoleGroupSetup.ConfigureHoles(holes, out int setupCount, out int skippedCount);

            UnityEditor.SceneManagement.EditorSceneManager.MarkSceneDirty(
                UnityEditor.SceneManagement.EditorSceneManager.GetActiveScene()
            );

            EditorUtility.DisplayDialog(
                "완료",
                $"총 {holes.Length}개:\n✅ {setupCount}개 설정\n⏭️ {skippedCount}개 건너뜀",
                "OK"
            );

            Debug.Log($"[HoleGroupSetup] {setupCount} configured, {skippedCount} skipped");
        }
    }
}
