using System.Collections.Generic;
using System.IO;
using UnityEngine;

namespace Achoo
{
    public sealed class BreadboardNetDebugOverlay : MonoBehaviour
    {
        [Header("Netlist Settings")]
        [SerializeField] private BreadboardConnectivitySettings defaultConnectivity;

        [Header("Overlay Settings")]
        [SerializeField] private bool overlayEnabled = true;
        [SerializeField] private bool showLabels = true;
        [SerializeField] private float labelOffset = 0.01f;
        [SerializeField] private float labelSize = 0.02f;
        [SerializeField] private Color labelColor = Color.yellow;

        [Header("Selection")]
        [SerializeField] private bool enableClickSelection = true;
        [SerializeField] private Camera selectionCamera;

        [Header("Export")]
        [SerializeField] private string exportFileName = "BreadboardNetlist.json";

        BreadboardNetlist netlist;
        readonly Dictionary<BreadboardHole, int> holeToNetId = new Dictionary<BreadboardHole, int>();
        readonly List<BreadboardHole> highlightedHoles = new List<BreadboardHole>();
        readonly Dictionary<BreadboardHole, TextMesh> labels = new Dictionary<BreadboardHole, TextMesh>();

        void OnEnable()
        {
            if (overlayEnabled)
            {
                Rebuild();
            }
        }

        void OnDisable()
        {
            ClearHighlights();
            ClearLabels();
        }

        void Update()
        {
            if (!overlayEnabled || !enableClickSelection)
            {
                return;
            }

            if (Input.GetMouseButtonDown(0))
            {
                var cam = selectionCamera != null ? selectionCamera : Camera.main;
                if (cam == null)
                {
                    return;
                }

                Ray ray = cam.ScreenPointToRay(Input.mousePosition);
                TrySelectFromRay(ray);
            }
        }

        public void SetOverlayEnabled(bool enabled)
        {
            overlayEnabled = enabled;
            if (overlayEnabled)
            {
                Rebuild();
            }
            else
            {
                ClearHighlights();
                ClearLabels();
            }
        }

        public void ToggleOverlay()
        {
            SetOverlayEnabled(!overlayEnabled);
        }

        [ContextMenu("Rebuild Overlay")]
        public void Rebuild()
        {
            if (!overlayEnabled)
            {
                return;
            }

            var resolver = new BreadboardNetResolver(defaultConnectivity);
            var builder = new BreadboardNetlistBuilder(resolver);
            var state = CircuitRuntimeState.CaptureScene();
            netlist = builder.Build(state);

            BuildHoleIndex(state);
            RefreshLabels();
        }

        public void SelectHole(BreadboardHole hole)
        {
            if (!overlayEnabled)
            {
                return;
            }

            if (hole == null)
            {
                return;
            }

            if (netlist == null || holeToNetId.Count == 0)
            {
                Rebuild();
            }

            if (!holeToNetId.TryGetValue(hole, out int netId))
            {
                return;
            }

            ClearHighlights();

            foreach (var pair in holeToNetId)
            {
                if (pair.Value != netId)
                {
                    continue;
                }

                var targetHole = pair.Key;
                if (targetHole != null)
                {
                    targetHole.board?.SetHighlight(targetHole, true);
                    highlightedHoles.Add(targetHole);
                }
            }
        }

        public void TrySelectFromRay(Ray ray, float maxDistance = 100f)
        {
            if (!overlayEnabled)
            {
                return;
            }

            if (Physics.Raycast(ray, out var hit, maxDistance))
            {
                var hole = hit.collider.GetComponent<BreadboardHole>() ?? hit.collider.GetComponentInParent<BreadboardHole>();
                if (hole != null)
                {
                    SelectHole(hole);
                }
            }
        }

        [ContextMenu("Export Netlist JSON")]
        public void ExportNetlistJson()
        {
            if (netlist == null)
            {
                Rebuild();
            }

            if (netlist == null)
            {
                Debug.LogWarning("[BreadboardNetDebugOverlay] Netlist is not available.");
                return;
            }

            string path = Path.Combine(Application.persistentDataPath, exportFileName);
            File.WriteAllText(path, netlist.ToJson(true));
            Debug.Log($"[BreadboardNetDebugOverlay] Netlist exported to: {path}");
        }

        void BuildHoleIndex(CircuitRuntimeState state)
        {
            holeToNetId.Clear();
            if (state == null || state.Holes == null || netlist == null)
            {
                return;
            }

            var holeById = new Dictionary<int, BreadboardHole>();
            foreach (var hole in state.Holes)
            {
                if (hole == null)
                {
                    continue;
                }

                holeById[hole.GetInstanceID()] = hole;
            }

            foreach (var net in netlist.nets)
            {
                foreach (var holeRef in net.holes)
                {
                    if (holeById.TryGetValue(holeRef.instanceId, out var hole))
                    {
                        holeToNetId[hole] = net.id;
                    }
                }
            }
        }

        void RefreshLabels()
        {
            ClearLabels();
            if (!showLabels)
            {
                return;
            }

            foreach (var pair in holeToNetId)
            {
                var hole = pair.Key;
                if (hole == null)
                {
                    continue;
                }

                var labelObject = new GameObject("NetLabel");
                labelObject.transform.SetParent(hole.transform, false);
                labelObject.transform.localPosition = Vector3.up * labelOffset;
                var textMesh = labelObject.AddComponent<TextMesh>();
                textMesh.text = pair.Value.ToString();
                textMesh.color = labelColor;
                textMesh.characterSize = labelSize;
                textMesh.anchor = TextAnchor.MiddleCenter;
                labels[hole] = textMesh;
            }
        }

        void ClearHighlights()
        {
            foreach (var hole in highlightedHoles)
            {
                if (hole != null)
                {
                    hole.board?.SetHighlight(hole, false);
                }
            }

            highlightedHoles.Clear();
        }

        void ClearLabels()
        {
            foreach (var pair in labels)
            {
                if (pair.Value != null)
                {
                    if (Application.isPlaying)
                    {
                        Destroy(pair.Value.gameObject);
                    }
                    else
                    {
                        DestroyImmediate(pair.Value.gameObject);
                    }
                }
            }

            labels.Clear();
        }
    }
}
