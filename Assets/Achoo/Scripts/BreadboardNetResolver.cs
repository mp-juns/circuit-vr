using UnityEngine;

namespace Achoo
{
    public sealed class BreadboardNetResolver
    {
        readonly BreadboardConnectivitySettings defaultSettings;

        public BreadboardNetResolver(BreadboardConnectivitySettings settings = null)
        {
            defaultSettings = settings;
        }

        public string GetNetKey(BreadboardHole hole)
        {
            if (hole == null)
            {
                return string.Empty;
            }

            var settings = defaultSettings;
            if (hole.board != null && hole.board.TryGetComponent(out BreadboardConnectivitySettings boardSettings))
            {
                settings = boardSettings;
            }

            return GetNetKey(hole, settings);
        }

        public static string GetNetKey(BreadboardHole hole, BreadboardConnectivitySettings settings)
        {
            if (hole == null)
            {
                return string.Empty;
            }

            var holeData = hole.GetComponent<HoleData>();
            var meta = hole.GetComponent<BreadboardHoleMetadata>();
            var kind = meta != null ? meta.kind : HoleKind.Unknown;
            int columnsPerRow = settings != null && settings.mainColumnsPerRow > 0 ? settings.mainColumnsPerRow : 10;
            int upperColumns = settings != null && settings.mainUpperColumnCount > 0 ? settings.mainUpperColumnCount : 5;

            bool canInferMain = settings == null || settings.inferMainStripFromColumn;
            if (kind == HoleKind.Unknown && canInferMain && holeData != null)
            {
                if (holeData.column >= 0 && holeData.column < columnsPerRow)
                {
                    kind = holeData.column < upperColumns ? HoleKind.MainUpper : HoleKind.MainLower;
                }
            }

            string boardId = hole.board != null ? hole.board.GetInstanceID().ToString() : "no-board";

            switch (kind)
            {
                case HoleKind.MainUpper:
                    return BuildMainStripKey(boardId, "main-upper", holeData, hole);
                case HoleKind.MainLower:
                    return BuildMainStripKey(boardId, "main-lower", holeData, hole);
                case HoleKind.RailPlusTop:
                    return BuildRailKey(boardId, "plus", "top", holeData, meta, settings, hole);
                case HoleKind.RailMinusTop:
                    return BuildRailKey(boardId, "minus", "top", holeData, meta, settings, hole);
                case HoleKind.RailPlusBottom:
                    return BuildRailKey(boardId, "plus", "bottom", holeData, meta, settings, hole);
                case HoleKind.RailMinusBottom:
                    return BuildRailKey(boardId, "minus", "bottom", holeData, meta, settings, hole);
                default:
                    return $"board:{boardId}:unknown:{hole.GetInstanceID()}";
            }
        }

        static string BuildMainStripKey(string boardId, string band, HoleData holeData, BreadboardHole hole)
        {
            if (holeData == null)
            {
                return $"board:{boardId}:{band}:unknown:{hole.GetInstanceID()}";
            }

            return $"board:{boardId}:{band}:row:{holeData.row}";
        }

        static string BuildRailKey(string boardId, string polarity, string position, HoleData holeData, BreadboardHoleMetadata meta, BreadboardConnectivitySettings settings, BreadboardHole hole)
        {
            int segment = 0;

            bool useSegmentIndex = settings == null || settings.useHoleSegmentIndex;
            if (useSegmentIndex && meta != null)
            {
                segment = meta.segmentIndex;
            }
            else if (settings != null && settings.splitPowerRails && holeData != null && settings.powerRailSplitRowIndex >= 0)
            {
                segment = holeData.row < settings.powerRailSplitRowIndex ? 0 : 1;
            }

            return $"board:{boardId}:rail:{polarity}:{position}:seg:{segment}";
        }
    }
}
