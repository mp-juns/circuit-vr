using UnityEngine;

[DisallowMultipleComponent]
public sealed class BreadboardConnectivitySettings : MonoBehaviour
{
    [Header("Main Strip Mapping")]
    [Tooltip("Total columns per breadboard row (A-J is typically 10).")]
    public int mainColumnsPerRow = 10;

    [Tooltip("Column count for the upper half (A-E is typically 5).")]
    public int mainUpperColumnCount = 5;

    [Tooltip("If no HoleKind is assigned, infer MainUpper/MainLower from the column index.")]
    public bool inferMainStripFromColumn = true;

    [Header("Power Rail Mapping")]
    [Tooltip("If true, split rails into segments using the row index.")]
    public bool splitPowerRails = false;

    [Tooltip("Row index where the rail split occurs (holes with row < split are segment 0).")]
    public int powerRailSplitRowIndex = -1;

    [Tooltip("If true, use BreadboardHoleMetadata.segmentIndex when available.")]
    public bool useHoleSegmentIndex = true;
}
