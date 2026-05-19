using UnityEngine;

namespace Achoo
{
    [CreateAssetMenu(menuName = "Achoo/Circuit Topology Rules", fileName = "CircuitTopologyRules")]
    public sealed class CircuitTopologyRules : ScriptableObject
    {
        [Header("Circuit Patterns")]
        public CircuitPattern[] patterns;

        [Header("Failure Conditions")]
        public bool failOnDirectShort = true;
        public bool failOnComponentSameNet = true;

        [Header("Legacy (used when patterns are empty)")]
        public int requiredResistors = 1;
        public int requiredLeds = 1;
        [Tooltip("Require a series path from + to - that passes through one resistor and one LED.")]
        public bool requireSeriesResistorLed = true;
        [Tooltip("Allow + -> LED -> Resistor -> - as well as + -> Resistor -> LED -> -.")]
        public bool allowEitherOrder = true;
        [Tooltip("If enabled, LED anode must face the + side of the path.")]
        public bool enforceLedPolarity = false;
        public bool failOnLedSameNet = true;
    }

    public enum CircuitPatternType
    {
        SeriesTwoComponents = 0
    }

    [System.Serializable]
    public sealed class ComponentRequirement
    {
        public CircuitComponentType componentType = CircuitComponentType.Unknown;
        public int minCount = 1;
    }

    [System.Serializable]
    public sealed class CircuitPattern
    {
        public string name = "Series Pattern";
        public CircuitPatternType patternType = CircuitPatternType.SeriesTwoComponents;
        public CircuitComponentType seriesFirst = CircuitComponentType.Resistor;
        public CircuitComponentType seriesSecond = CircuitComponentType.Led;
        public bool allowEitherOrder = true;
        public bool enforcePolarity = false;
        public ComponentRequirement[] requiredComponents;
    }
}
