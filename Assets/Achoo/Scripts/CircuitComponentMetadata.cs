using UnityEngine;
using UnityEngine.Serialization;

namespace Achoo
{
    public enum CircuitComponentType
    {
        Unknown = 0,
        Resistor = 1,
        Led = 2,
        Diode = 3,
        Capacitor = 4
    }

    [DisallowMultipleComponent]
    public sealed class CircuitComponentMetadata : MonoBehaviour
    {
        [Tooltip("Classification used by the topology validator.")]
        public CircuitComponentType componentType = CircuitComponentType.Unknown;

        [Tooltip("True if this component has polarity that should be considered (diodes/LEDs are always polarized).")]
        public bool isPolarized = false;

        [Tooltip("True if Pin A is the positive/anode side (anode for diode, positive leg for polarized capacitor).")]
        [FormerlySerializedAs("legAIsPositive")]
        public bool pinAIsPositive = true;

        public bool IsPolarized
        {
            get
            {
                if (isPolarized)
                {
                    return true;
                }

                return componentType == CircuitComponentType.Led || componentType == CircuitComponentType.Diode;
            }
        }
    }
}
