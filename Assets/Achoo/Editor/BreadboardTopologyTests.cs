using System.Collections.Generic;
using System.Reflection;
using Achoo;
using NUnit.Framework;
using UnityEngine;
using UnityEngine.XR.Interaction.Toolkit.Interactables;

namespace Achoo.Tests
{
    public class BreadboardTopologyTests
    {
        GameObject root;
        Breadboard board;
        BreadboardConnectivitySettings connectivity;

        [SetUp]
        public void SetUp()
        {
            root = new GameObject("TestRoot");
            board = root.AddComponent<Breadboard>();
            connectivity = root.AddComponent<BreadboardConnectivitySettings>();
        }

        [TearDown]
        public void TearDown()
        {
            if (root != null)
            {
                Object.DestroyImmediate(root);
            }
        }

        [Test]
        public void ValidCircuit_ResistorLedSeries_ReturnsValid()
        {
            var plus = CreateHole("PlusRail", 0, 0, HoleKind.RailPlusTop);
            var minus = CreateHole("MinusRail", 0, 0, HoleKind.RailMinusTop);
            var midA = CreateHole("MidA", 1, 0, HoleKind.MainUpper);
            var midB = CreateHole("MidB", 1, 1, HoleKind.MainUpper);

            var resistor = CreateComponent("Resistor", plus, midA, CircuitComponentType.Resistor, true);
            var led = CreateComponent("LED", midB, minus, CircuitComponentType.Led, true);
            var plusPlug = CreateBatteryPlug("BatteryPlus", plus, BatteryPlugPolarity.Plus);
            var minusPlug = CreateBatteryPlug("BatteryMinus", minus, BatteryPlugPolarity.Minus);

            var state = new CircuitRuntimeState(
                new List<BreadboardHole> { plus, minus, midA, midB },
                new List<WireConnection>(),
                new List<ElementConfig> { resistor, led },
                new List<BatteryPlug> { plusPlug, minusPlug });

            var netlist = new BreadboardNetlistBuilder(new BreadboardNetResolver(connectivity)).Build(state);
            var rules = ScriptableObject.CreateInstance<CircuitTopologyRules>();
            rules.enforceLedPolarity = true;

            var report = CircuitTopologyValidator.Validate(netlist, rules);
            Object.DestroyImmediate(rules);

            Assert.AreEqual(1, report.result);
        }

        [Test]
        public void OpenCircuit_MissingSeriesPath_ReturnsInvalid()
        {
            var plus = CreateHole("PlusRail", 0, 0, HoleKind.RailPlusTop);
            var minus = CreateHole("MinusRail", 0, 0, HoleKind.RailMinusTop);
            var midRes = CreateHole("ResMid", 1, 0, HoleKind.MainUpper);
            var midLed = CreateHole("LedMid", 2, 0, HoleKind.MainUpper);

            var resistor = CreateComponent("Resistor", plus, midRes, CircuitComponentType.Resistor, true);
            var led = CreateComponent("LED", midLed, minus, CircuitComponentType.Led, true);
            var plusPlug = CreateBatteryPlug("BatteryPlus", plus, BatteryPlugPolarity.Plus);
            var minusPlug = CreateBatteryPlug("BatteryMinus", minus, BatteryPlugPolarity.Minus);

            var state = new CircuitRuntimeState(
                new List<BreadboardHole> { plus, minus, midRes, midLed },
                new List<WireConnection>(),
                new List<ElementConfig> { resistor, led },
                new List<BatteryPlug> { plusPlug, minusPlug });

            var netlist = new BreadboardNetlistBuilder(new BreadboardNetResolver(connectivity)).Build(state);
            var rules = ScriptableObject.CreateInstance<CircuitTopologyRules>();

            var report = CircuitTopologyValidator.Validate(netlist, rules);
            Object.DestroyImmediate(rules);

            Assert.AreEqual(0, report.result);
        }

        [Test]
        public void DirectShort_PlusToMinus_ReturnsInvalid()
        {
            var plus = CreateHole("PlusRail", 0, 0, HoleKind.RailPlusTop);
            var minus = CreateHole("MinusRail", 0, 0, HoleKind.RailMinusTop);
            var midA = CreateHole("MidA", 1, 0, HoleKind.MainUpper);
            var midB = CreateHole("MidB", 1, 1, HoleKind.MainUpper);

            var resistor = CreateComponent("Resistor", plus, midA, CircuitComponentType.Resistor, true);
            var led = CreateComponent("LED", midB, minus, CircuitComponentType.Led, true);
            var plusPlug = CreateBatteryPlug("BatteryPlus", plus, BatteryPlugPolarity.Plus);
            var minusPlug = CreateBatteryPlug("BatteryMinus", minus, BatteryPlugPolarity.Minus);

            var wires = new List<WireConnection> { new WireConnection(plus, minus, null) };
            var state = new CircuitRuntimeState(
                new List<BreadboardHole> { plus, minus, midA, midB },
                wires,
                new List<ElementConfig> { resistor, led },
                new List<BatteryPlug> { plusPlug, minusPlug });

            var netlist = new BreadboardNetlistBuilder(new BreadboardNetResolver(connectivity)).Build(state);
            var rules = ScriptableObject.CreateInstance<CircuitTopologyRules>();

            var report = CircuitTopologyValidator.Validate(netlist, rules);
            Object.DestroyImmediate(rules);

            Assert.AreEqual(0, report.result);
        }

        [Test]
        public void LedPinsSameNet_ReturnsInvalid()
        {
            var plus = CreateHole("PlusRail", 0, 0, HoleKind.RailPlusTop);
            var minus = CreateHole("MinusRail", 0, 0, HoleKind.RailMinusTop);
            var mid = CreateHole("Mid", 1, 0, HoleKind.MainUpper);
            var mid2 = CreateHole("Mid2", 1, 1, HoleKind.MainUpper);

            var resistor = CreateComponent("Resistor", plus, mid, CircuitComponentType.Resistor, true);
            var led = CreateComponent("LED", mid, mid2, CircuitComponentType.Led, true);
            var plusPlug = CreateBatteryPlug("BatteryPlus", plus, BatteryPlugPolarity.Plus);
            var minusPlug = CreateBatteryPlug("BatteryMinus", minus, BatteryPlugPolarity.Minus);

            var state = new CircuitRuntimeState(
                new List<BreadboardHole> { plus, minus, mid, mid2 },
                new List<WireConnection>(),
                new List<ElementConfig> { resistor, led },
                new List<BatteryPlug> { plusPlug, minusPlug });

            var netlist = new BreadboardNetlistBuilder(new BreadboardNetResolver(connectivity)).Build(state);
            var rules = ScriptableObject.CreateInstance<CircuitTopologyRules>();
            rules.failOnLedSameNet = true;

            var report = CircuitTopologyValidator.Validate(netlist, rules);
            Object.DestroyImmediate(rules);

            Assert.AreEqual(0, report.result);
        }

        [Test]
        public void RailSplit_LeftRightIsolation_RequiresBridge()
        {
            connectivity.splitPowerRails = true;
            connectivity.powerRailSplitRowIndex = 5;

            var left = CreateHole("PlusLeft", 2, 0, HoleKind.RailPlusTop);
            var right = CreateHole("PlusRight", 7, 0, HoleKind.RailPlusTop);

            var state = new CircuitRuntimeState(
                new List<BreadboardHole> { left, right },
                new List<WireConnection>(),
                new List<ElementConfig>(),
                new List<BatteryPlug>());

            var builder = new BreadboardNetlistBuilder(new BreadboardNetResolver(connectivity));
            var netlist = builder.Build(state);

            int leftNet = GetNetId(netlist, left);
            int rightNet = GetNetId(netlist, right);
            Assert.AreNotEqual(leftNet, rightNet);

            var bridgedState = new CircuitRuntimeState(
                new List<BreadboardHole> { left, right },
                new List<WireConnection> { new WireConnection(left, right, null) },
                new List<ElementConfig>(),
                new List<BatteryPlug>());

            var bridgedNetlist = builder.Build(bridgedState);
            int bridgedLeftNet = GetNetId(bridgedNetlist, left);
            int bridgedRightNet = GetNetId(bridgedNetlist, right);
            Assert.AreEqual(bridgedLeftNet, bridgedRightNet);
        }

        BreadboardHole CreateHole(string name, int row, int column, HoleKind kind)
        {
            var go = new GameObject(name);
            go.transform.SetParent(root.transform);
            var hole = go.AddComponent<BreadboardHole>();
            hole.board = board;
            var data = go.AddComponent<HoleData>();
            data.SetData(row, column);
            var meta = go.AddComponent<BreadboardHoleMetadata>();
            meta.kind = kind;
            return hole;
        }

        ElementConfig CreateComponent(string name, BreadboardHole a, BreadboardHole b, CircuitComponentType type, bool pinAIsPositive)
        {
            var go = new GameObject(name);
            go.transform.SetParent(root.transform);
            go.AddComponent<AudioSource>();
            go.AddComponent<XRGrabInteractable>();
            var element = go.AddComponent<ElementConfig>();
            var metadata = go.AddComponent<CircuitComponentMetadata>();
            metadata.componentType = type;
            metadata.pinAIsPositive = pinAIsPositive;

            SetPlaced(element, a, b);
            return element;
        }

        BatteryPlug CreateBatteryPlug(string name, BreadboardHole hole, BatteryPlugPolarity polarity)
        {
            var go = new GameObject(name);
            go.transform.SetParent(root.transform);
            go.AddComponent<AudioSource>();
            go.AddComponent<XRGrabInteractable>();
            var plug = go.AddComponent<BatteryPlug>();
            plug.polarity = polarity;
            SetConnectedHole(plug, hole);
            return plug;
        }

        void SetPlaced(ElementConfig element, BreadboardHole a, BreadboardHole b)
        {
            var placedA = typeof(ElementConfig).GetProperty("PlacedHoleA", BindingFlags.Instance | BindingFlags.Public | BindingFlags.NonPublic);
            var placedB = typeof(ElementConfig).GetProperty("PlacedHoleB", BindingFlags.Instance | BindingFlags.Public | BindingFlags.NonPublic);
            placedA?.GetSetMethod(true)?.Invoke(element, new object[] { a });
            placedB?.GetSetMethod(true)?.Invoke(element, new object[] { b });

            var isPlacedField = typeof(ElementConfig).GetField("isPlaced", BindingFlags.Instance | BindingFlags.NonPublic);
            isPlacedField?.SetValue(element, true);
        }

        void SetConnectedHole(BatteryPlug plug, BreadboardHole hole)
        {
            var prop = typeof(BatteryPlug).GetProperty("ConnectedHole", BindingFlags.Instance | BindingFlags.Public | BindingFlags.NonPublic);
            prop?.GetSetMethod(true)?.Invoke(plug, new object[] { hole });
        }

        int GetNetId(BreadboardNetlist netlist, BreadboardHole hole)
        {
            if (netlist == null || hole == null)
            {
                return -1;
            }

            int instanceId = hole.GetInstanceID();
            foreach (var net in netlist.nets)
            {
                foreach (var holeRef in net.holes)
                {
                    if (holeRef.instanceId == instanceId)
                    {
                        return net.id;
                    }
                }
            }

            return -1;
        }
    }
}
