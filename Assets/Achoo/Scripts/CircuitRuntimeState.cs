using System.Collections.Generic;
using UnityEngine;

namespace Achoo
{
    public sealed class CircuitRuntimeState
    {
        public IReadOnlyList<BreadboardHole> Holes { get; }
        public IReadOnlyList<WireConnection> Wires { get; }
        public IReadOnlyList<ElementConfig> Components { get; }
        public IReadOnlyList<BatteryPlug> BatteryPlugs { get; }

        public CircuitRuntimeState(
            IReadOnlyList<BreadboardHole> holes,
            IReadOnlyList<WireConnection> wires,
            IReadOnlyList<ElementConfig> components,
            IReadOnlyList<BatteryPlug> batteryPlugs)
        {
            Holes = holes ?? new List<BreadboardHole>();
            Wires = wires ?? new List<WireConnection>();
            Components = components ?? new List<ElementConfig>();
            BatteryPlugs = batteryPlugs ?? new List<BatteryPlug>();
        }

        public static CircuitRuntimeState CaptureScene()
        {
            var holes = BreadboardHole.RegisteredHoles;
            var wires = new List<WireConnection>();

            foreach (var board in FindAll<Breadboard>())
            {
                if (board == null)
                {
                    continue;
                }

                foreach (var (a, b, wire) in board.GetAllWires())
                {
                    wires.Add(new WireConnection(a, b, wire));
                }
            }

            var components = FindAll<ElementConfig>();
            var batteryPlugs = FindAll<BatteryPlug>();

            return new CircuitRuntimeState(holes, wires, components, batteryPlugs);
        }

        static T[] FindAll<T>() where T : Object
        {
#if UNITY_2023_1_OR_NEWER
            return Object.FindObjectsByType<T>(FindObjectsSortMode.None);
#else
            return Object.FindObjectsOfType<T>();
#endif
        }
    }
}
