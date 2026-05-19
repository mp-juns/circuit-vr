using System;
using System.Collections.Generic;
using UnityEngine;

namespace Achoo
{
    [Serializable]
    public sealed class BreadboardNetlist
    {
        public List<NetNode> nets = new List<NetNode>();
        public List<NetEdge> edges = new List<NetEdge>();
        public List<WireShort> wireShorts = new List<WireShort>();
        public NetTerminals terminals = new NetTerminals();
        public bool directShort;

        public string ToJson(bool prettyPrint = true)
        {
            return JsonUtility.ToJson(this, prettyPrint);
        }
    }

    [Serializable]
    public sealed class NetNode
    {
        public int id;
        public string key;
        public List<string> baseKeys = new List<string>();
        public List<HoleRef> holes = new List<HoleRef>();
    }

    [Serializable]
    public sealed class HoleRef
    {
        public string name;
        public int instanceId;
        public int row;
        public int column;
        public HoleKind kind;
    }

    [Serializable]
    public sealed class NetEdge
    {
        public string componentId;
        public string componentName;
        public CircuitComponentType componentType;
        public int netA;
        public int netB;
        public bool isPolarized;
        public bool pinAIsPositive;
    }

    [Serializable]
    public sealed class WireShort
    {
        public string name;
        public int holeAInstanceId;
        public int holeBInstanceId;
        public int netId;
    }

    [Serializable]
    public sealed class NetTerminals
    {
        public int plusNetId = -1;
        public int minusNetId = -1;
    }

    public readonly struct WireConnection
    {
        public readonly BreadboardHole holeA;
        public readonly BreadboardHole holeB;
        public readonly Wire wire;

        public WireConnection(BreadboardHole holeA, BreadboardHole holeB, Wire wire)
        {
            this.holeA = holeA;
            this.holeB = holeB;
            this.wire = wire;
        }
    }
}
