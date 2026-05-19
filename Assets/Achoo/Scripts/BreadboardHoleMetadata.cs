using UnityEngine;

public enum HoleKind
{
    Unknown = 0,
    MainUpper = 1,
    MainLower = 2,
    RailPlusTop = 3,
    RailMinusTop = 4,
    RailPlusBottom = 5,
    RailMinusBottom = 6
}

[DisallowMultipleComponent]
public sealed class BreadboardHoleMetadata : MonoBehaviour
{
    [Tooltip("Which electrical section this hole belongs to.")]
    public HoleKind kind = HoleKind.Unknown;

    [Tooltip("Optional segment index for split rails (0 = left/top, 1 = right/bottom, etc.).")]
    public int segmentIndex = 0;
}
