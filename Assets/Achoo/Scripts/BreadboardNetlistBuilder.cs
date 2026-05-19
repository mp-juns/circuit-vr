using System;
using System.Collections.Generic;
using UnityEngine;

namespace Achoo
{
    public sealed class BreadboardNetlistBuilder
    {
        readonly BreadboardNetResolver resolver;

        public BreadboardNetlistBuilder(BreadboardNetResolver resolver = null)
        {
            this.resolver = resolver ?? new BreadboardNetResolver();
        }

        public BreadboardNetlist Build(CircuitRuntimeState state)
        {
            var netlist = new BreadboardNetlist();

            if (state == null || state.Holes == null)
            {
                return netlist;
            }

            var holes = state.Holes;
            int holeCount = holes.Count;
            var indexByHole = new Dictionary<BreadboardHole, int>(holeCount);
            var keyByIndex = new string[holeCount];
            var dsu = new DisjointSet(holeCount);
            var keyToIndex = new Dictionary<string, int>();

            for (int i = 0; i < holeCount; i++)
            {
                var hole = holes[i];
                if (hole == null)
                {
                    keyByIndex[i] = string.Empty;
                    continue;
                }

                indexByHole[hole] = i;
                string key = resolver.GetNetKey(hole);
                keyByIndex[i] = key;
                if (!string.IsNullOrEmpty(key))
                {
                    if (keyToIndex.TryGetValue(key, out int existing))
                    {
                        dsu.Union(i, existing);
                    }
                    else
                    {
                        keyToIndex[key] = i;
                    }
                }
            }

            var wires = state.Wires ?? Array.Empty<WireConnection>();
            foreach (var wire in wires)
            {
                if (wire.holeA == null || wire.holeB == null)
                {
                    continue;
                }

                if (!indexByHole.TryGetValue(wire.holeA, out int indexA))
                {
                    continue;
                }

                if (!indexByHole.TryGetValue(wire.holeB, out int indexB))
                {
                    continue;
                }

                dsu.Union(indexA, indexB);
            }

            var rootToNetId = new Dictionary<int, int>();
            var baseKeysByNetId = new Dictionary<int, HashSet<string>>();

            for (int i = 0; i < holeCount; i++)
            {
                var hole = holes[i];
                if (hole == null)
                {
                    continue;
                }

                int root = dsu.Find(i);
                if (!rootToNetId.TryGetValue(root, out int netId))
                {
                    netId = netlist.nets.Count;
                    rootToNetId[root] = netId;
                    netlist.nets.Add(new NetNode { id = netId });
                    baseKeysByNetId[netId] = new HashSet<string>();
                }

                var holeData = hole.GetComponent<HoleData>();
                var meta = hole.GetComponent<BreadboardHoleMetadata>();
                netlist.nets[netId].holes.Add(new HoleRef
                {
                    name = hole.name,
                    instanceId = hole.GetInstanceID(),
                    row = holeData != null ? holeData.row : -1,
                    column = holeData != null ? holeData.column : -1,
                    kind = meta != null ? meta.kind : HoleKind.Unknown
                });

                if (!string.IsNullOrEmpty(keyByIndex[i]))
                {
                    baseKeysByNetId[netId].Add(keyByIndex[i]);
                }
            }

            foreach (var node in netlist.nets)
            {
                if (!baseKeysByNetId.TryGetValue(node.id, out var keySet))
                {
                    node.key = $"net:{node.id}";
                    continue;
                }

                var keys = new List<string>(keySet);
                keys.Sort(StringComparer.Ordinal);
                node.baseKeys = keys;
                if (keys.Count == 0)
                {
                    node.key = $"net:{node.id}";
                }
                else if (keys.Count == 1)
                {
                    node.key = keys[0];
                }
                else
                {
                    node.key = string.Join("+", keys);
                }
            }

            if (state.Components != null)
            {
                foreach (var component in state.Components)
                {
                    if (component == null || !component.IsPlacedOnBoard)
                    {
                        continue;
                    }

                    if (!component.TryGetPlacedHoles(out var holeA, out var holeB))
                    {
                        continue;
                    }

                    if (!indexByHole.TryGetValue(holeA, out int indexA))
                    {
                        continue;
                    }

                    if (!indexByHole.TryGetValue(holeB, out int indexB))
                    {
                        continue;
                    }

                    int netA = rootToNetId[dsu.Find(indexA)];
                    int netB = rootToNetId[dsu.Find(indexB)];

                    var metadata = component.GetComponent<CircuitComponentMetadata>();
                    bool isPolarized = metadata != null && metadata.IsPolarized;
                    bool pinAIsPositive = metadata != null && metadata.pinAIsPositive;
                    netlist.edges.Add(new NetEdge
                    {
                        componentId = component.GetInstanceID().ToString(),
                        componentName = component.name,
                        componentType = metadata != null ? metadata.componentType : CircuitComponentType.Unknown,
                        netA = netA,
                        netB = netB,
                        isPolarized = isPolarized,
                        pinAIsPositive = pinAIsPositive
                    });
                }
            }

            foreach (var wire in wires)
            {
                if (wire.holeA == null || wire.holeB == null)
                {
                    continue;
                }

                if (!indexByHole.TryGetValue(wire.holeA, out int indexA))
                {
                    continue;
                }

                if (!indexByHole.TryGetValue(wire.holeB, out int indexB))
                {
                    continue;
                }

                int netId = rootToNetId[dsu.Find(indexA)];
                netlist.wireShorts.Add(new WireShort
                {
                    name = wire.wire != null ? wire.wire.name : "Wire",
                    holeAInstanceId = wire.holeA.GetInstanceID(),
                    holeBInstanceId = wire.holeB.GetInstanceID(),
                    netId = netId
                });
            }

            if (state.BatteryPlugs != null)
            {
                foreach (var plug in state.BatteryPlugs)
                {
                    if (plug == null || plug.ConnectedHole == null)
                    {
                        continue;
                    }

                    if (!indexByHole.TryGetValue(plug.ConnectedHole, out int index))
                    {
                        continue;
                    }

                    int netId = rootToNetId[dsu.Find(index)];
                    if (plug.polarity == BatteryPlugPolarity.Plus)
                    {
                        if (netlist.terminals.plusNetId < 0)
                        {
                            netlist.terminals.plusNetId = netId;
                        }
                        else if (netlist.terminals.plusNetId != netId)
                        {
                            Debug.LogWarning($"[NetlistBuilder] Multiple plus terminals detected. Using first: {netlist.terminals.plusNetId}, ignoring {netId}.");
                        }
                    }
                    else
                    {
                        if (netlist.terminals.minusNetId < 0)
                        {
                            netlist.terminals.minusNetId = netId;
                        }
                        else if (netlist.terminals.minusNetId != netId)
                        {
                            Debug.LogWarning($"[NetlistBuilder] Multiple minus terminals detected. Using first: {netlist.terminals.minusNetId}, ignoring {netId}.");
                        }
                    }
                }
            }

            netlist.directShort = netlist.terminals.plusNetId >= 0 &&
                                  netlist.terminals.plusNetId == netlist.terminals.minusNetId;

            return netlist;
        }

        sealed class DisjointSet
        {
            readonly int[] parent;
            readonly int[] rank;

            public DisjointSet(int size)
            {
                parent = new int[size];
                rank = new int[size];
                for (int i = 0; i < size; i++)
                {
                    parent[i] = i;
                    rank[i] = 0;
                }
            }

            public int Find(int x)
            {
                if (parent[x] != x)
                {
                    parent[x] = Find(parent[x]);
                }

                return parent[x];
            }

            public void Union(int x, int y)
            {
                int rootX = Find(x);
                int rootY = Find(y);
                if (rootX == rootY)
                {
                    return;
                }

                if (rank[rootX] < rank[rootY])
                {
                    parent[rootX] = rootY;
                }
                else if (rank[rootX] > rank[rootY])
                {
                    parent[rootY] = rootX;
                }
                else
                {
                    parent[rootY] = rootX;
                    rank[rootX]++;
                }
            }
        }
    }
}
