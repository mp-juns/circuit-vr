using System;
using System.Collections.Generic;

namespace Achoo
{
    [Serializable]
    public sealed class CircuitValidationReport
    {
        public int result;
        public float confidence = 1f;
        public int plusNetId = -1;
        public int minusNetId = -1;
        public List<string> reasons = new List<string>();
        public List<string> pathComponents = new List<string>();
        public BreadboardNetlist netlist;
        public string netlistJson;
    }

    public static class CircuitTopologyValidator
    {
        public static CircuitValidationReport Validate(BreadboardNetlist netlist, CircuitTopologyRules rules)
        {
            var report = new CircuitValidationReport
            {
                netlist = netlist,
                netlistJson = netlist != null ? netlist.ToJson(true) : string.Empty
            };

            if (netlist == null)
            {
                report.reasons.Add("Netlist is null.");
                report.result = 0;
                return report;
            }

            if (rules == null)
            {
                report.reasons.Add("No CircuitTopologyRules asset assigned.");
                report.result = 0;
                return report;
            }

            int plus = netlist.terminals != null ? netlist.terminals.plusNetId : -1;
            int minus = netlist.terminals != null ? netlist.terminals.minusNetId : -1;
            report.plusNetId = plus;
            report.minusNetId = minus;

            if (plus < 0 || minus < 0)
            {
                report.reasons.Add($"Battery terminals missing. plusNetId={plus}, minusNetId={minus}.");
                report.result = 0;
                return report;
            }

            report.reasons.Add($"Plus net: {plus} ({GetNetKey(netlist, plus)}).");
            report.reasons.Add($"Minus net: {minus} ({GetNetKey(netlist, minus)}).");

            if (rules.failOnDirectShort && netlist.directShort)
            {
                report.reasons.Add("Direct short detected: plus and minus are in the same net.");
                report.result = 0;
                return report;
            }

            var edgesByType = BuildEdgesByType(netlist.edges);
            report.reasons.Add($"Detected components: {FormatCounts(edgesByType)}.");

            foreach (var edge in netlist.edges)
            {
                if (edge == null)
                {
                    continue;
                }

                report.reasons.Add($"{edge.componentType} '{edge.componentName}' nets: {edge.netA} <-> {edge.netB}.");
            }

            bool useLegacyRules = !HasPatterns(rules);
            bool failOnSameNet = rules.failOnComponentSameNet || (useLegacyRules && rules.failOnLedSameNet);
            if (failOnSameNet)
            {
                foreach (var edge in netlist.edges)
                {
                    if (edge == null)
                    {
                        continue;
                    }

                    if (edge.netA == edge.netB)
                    {
                        report.reasons.Add($"Component '{edge.componentName}' has both pins in net {edge.netA}.");
                        report.result = 0;
                        return report;
                    }
                }
            }

            if (useLegacyRules)
            {
                if (!CheckLegacyRequirements(rules, edgesByType, report))
                {
                    report.result = 0;
                    return report;
                }

                if (!rules.requireSeriesResistorLed)
                {
                    report.result = 1;
                    return report;
                }
            }

            var patterns = useLegacyRules ? BuildLegacyPatterns(rules) : BuildPatternList(rules.patterns);
            if (patterns.Count == 0)
            {
                report.reasons.Add("No circuit patterns configured.");
                report.result = 0;
                return report;
            }

            var patternFailureReasons = new List<string>();
            foreach (var pattern in patterns)
            {
                if (pattern == null)
                {
                    continue;
                }

                var localReasons = new List<string>();
                if (!CheckPatternRequirements(pattern, edgesByType, localReasons))
                {
                    AddPatternReasons(pattern, localReasons, patternFailureReasons);
                    continue;
                }

                if (pattern.patternType == CircuitPatternType.SeriesTwoComponents)
                {
                    if (TryMatchSeriesPattern(pattern, plus, minus, edgesByType, report, localReasons))
                    {
                        report.result = 1;
                        return report;
                    }
                }
                else
                {
                    localReasons.Add($"Unsupported pattern type: {pattern.patternType}.");
                }

                AddPatternReasons(pattern, localReasons, patternFailureReasons);
            }

            report.reasons.AddRange(patternFailureReasons);
            report.result = 0;
            return report;
        }

        static bool CheckLegacyRequirements(CircuitTopologyRules rules, Dictionary<CircuitComponentType, List<NetEdge>> edgesByType, CircuitValidationReport report)
        {
            int resistorCount = GetCount(edgesByType, CircuitComponentType.Resistor);
            int ledCount = GetCount(edgesByType, CircuitComponentType.Led);

            if (resistorCount < rules.requiredResistors)
            {
                report.reasons.Add($"Missing resistors. Required: {rules.requiredResistors}, found: {resistorCount}.");
            }

            if (ledCount < rules.requiredLeds)
            {
                report.reasons.Add($"Missing LEDs. Required: {rules.requiredLeds}, found: {ledCount}.");
            }

            return resistorCount >= rules.requiredResistors && ledCount >= rules.requiredLeds;
        }

        static List<CircuitPattern> BuildLegacyPatterns(CircuitTopologyRules rules)
        {
            var patterns = new List<CircuitPattern>();
            if (!rules.requireSeriesResistorLed)
            {
                return patterns;
            }

            var pattern = new CircuitPattern
            {
                name = "Legacy Resistor+LED Series",
                patternType = CircuitPatternType.SeriesTwoComponents,
                seriesFirst = CircuitComponentType.Resistor,
                seriesSecond = CircuitComponentType.Led,
                allowEitherOrder = rules.allowEitherOrder,
                enforcePolarity = rules.enforceLedPolarity,
                requiredComponents = new[]
                {
                    new ComponentRequirement { componentType = CircuitComponentType.Resistor, minCount = rules.requiredResistors },
                    new ComponentRequirement { componentType = CircuitComponentType.Led, minCount = rules.requiredLeds }
                }
            };

            patterns.Add(pattern);
            return patterns;
        }

        static List<CircuitPattern> BuildPatternList(CircuitPattern[] patterns)
        {
            var list = new List<CircuitPattern>();
            if (patterns == null)
            {
                return list;
            }

            foreach (var pattern in patterns)
            {
                if (pattern != null)
                {
                    list.Add(pattern);
                }
            }

            return list;
        }

        static bool TryMatchSeriesPattern(
            CircuitPattern pattern,
            int plus,
            int minus,
            Dictionary<CircuitComponentType, List<NetEdge>> edgesByType,
            CircuitValidationReport report,
            List<string> localReasons)
        {
            if (pattern.seriesFirst == CircuitComponentType.Resistor &&
                pattern.seriesSecond == CircuitComponentType.Capacitor &&
                !pattern.allowEitherOrder)
            {
                return TryMatchResistorCapacitorPattern(pattern, plus, minus, edgesByType, report, localReasons);
            }

            if (FindSeriesPathBetweenTerminals(
                    plus,
                    minus,
                    pattern.seriesFirst,
                    pattern.seriesSecond,
                    pattern.allowEitherOrder,
                    pattern.enforcePolarity,
                    edgesByType,
                    out var match,
                    out string reason))
            {
                RegisterSeriesMatch(pattern, match, plus, minus, report);
                return true;
            }

            if (!string.IsNullOrEmpty(reason))
            {
                localReasons.Add(reason);
            }

            return false;
        }

        static bool TryMatchResistorCapacitorPattern(
            CircuitPattern pattern,
            int plus,
            int minus,
            Dictionary<CircuitComponentType, List<NetEdge>> edgesByType,
            CircuitValidationReport report,
            List<string> localReasons)
        {
            var candidates = FindNodeAfterSeriesElement(plus, pattern.seriesFirst, edgesByType);
            if (candidates.Count == 0)
            {
                localReasons.Add($"No {pattern.seriesFirst} connected to plus net {plus}.");
                return false;
            }

            foreach (var candidate in candidates)
            {
                if (!CheckPolarity(candidate.edge, plus, candidate.nextNet, pattern.enforcePolarity, out string polarityReason))
                {
                    localReasons.Add(polarityReason);
                    continue;
                }

                if (ValidateCapacitorToMinusFromNode(candidate.nextNet, minus, pattern.seriesSecond, pattern.enforcePolarity, edgesByType, out var capEdge, out string reason))
                {
                    var match = new SeriesMatch(candidate.edge, capEdge, candidate.nextNet, false);
                    RegisterSeriesMatch(pattern, match, plus, minus, report);
                    return true;
                }

                if (!string.IsNullOrEmpty(reason))
                {
                    localReasons.Add(reason);
                }
            }

            return false;
        }

        static void RegisterSeriesMatch(CircuitPattern pattern, SeriesMatch match, int plus, int minus, CircuitValidationReport report)
        {
            report.pathComponents.Clear();
            if (match.swapped)
            {
                report.pathComponents.Add($"{match.second.componentType}:{match.second.componentName}");
                report.pathComponents.Add($"{match.first.componentType}:{match.first.componentName}");
            }
            else
            {
                report.pathComponents.Add($"{match.first.componentType}:{match.first.componentName}");
                report.pathComponents.Add($"{match.second.componentType}:{match.second.componentName}");
            }

            string firstName = match.swapped ? match.second.componentName : match.first.componentName;
            string secondName = match.swapped ? match.first.componentName : match.second.componentName;
            report.reasons.Add($"Pattern '{pattern.name}' matched: +({plus}) -> '{firstName}' -> Net {match.sharedNet} -> '{secondName}' -> -({minus}).");
        }

        static bool CheckPatternRequirements(CircuitPattern pattern, Dictionary<CircuitComponentType, List<NetEdge>> edgesByType, List<string> localReasons)
        {
            var requirements = BuildRequirements(pattern);
            bool allMet = true;

            foreach (var requirement in requirements)
            {
                if (requirement == null)
                {
                    continue;
                }

                if (requirement.componentType == CircuitComponentType.Unknown)
                {
                    continue;
                }

                int count = GetCount(edgesByType, requirement.componentType);
                if (count < requirement.minCount)
                {
                    localReasons.Add($"Missing {requirement.componentType}. Required: {requirement.minCount}, found: {count}.");
                    allMet = false;
                }
            }

            return allMet;
        }

        static List<ComponentRequirement> BuildRequirements(CircuitPattern pattern)
        {
            var requirements = new List<ComponentRequirement>();
            if (pattern.requiredComponents != null && pattern.requiredComponents.Length > 0)
            {
                foreach (var requirement in pattern.requiredComponents)
                {
                    if (requirement != null)
                    {
                        requirements.Add(requirement);
                    }
                }
                return requirements;
            }

            requirements.Add(new ComponentRequirement { componentType = pattern.seriesFirst, minCount = 1 });
            requirements.Add(new ComponentRequirement { componentType = pattern.seriesSecond, minCount = 1 });
            return requirements;
        }

        static void AddPatternReasons(CircuitPattern pattern, List<string> localReasons, List<string> output)
        {
            if (localReasons.Count == 0)
            {
                localReasons.Add("No matching path found.");
            }

            string prefix = string.IsNullOrEmpty(pattern.name) ? "Pattern" : $"Pattern '{pattern.name}'";
            foreach (var reason in localReasons)
            {
                output.Add($"{prefix}: {reason}");
            }
        }

        static bool FindSeriesPathBetweenTerminals(
            int plusNet,
            int minusNet,
            CircuitComponentType firstType,
            CircuitComponentType secondType,
            bool allowEitherOrder,
            bool enforcePolarity,
            Dictionary<CircuitComponentType, List<NetEdge>> edgesByType,
            out SeriesMatch match,
            out string reason)
        {
            match = default;
            reason = string.Empty;

            if (!edgesByType.TryGetValue(firstType, out var firstEdges) || firstEdges.Count == 0)
            {
                reason = $"Missing {firstType} edges for series path.";
                return false;
            }

            if (!edgesByType.TryGetValue(secondType, out var secondEdges) || secondEdges.Count == 0)
            {
                reason = $"Missing {secondType} edges for series path.";
                return false;
            }

            var polarityIssues = new List<string>();

            foreach (var first in firstEdges)
            {
                foreach (var second in secondEdges)
                {
                    if (ReferenceEquals(first, second))
                    {
                        continue;
                    }

                    if (!TryGetSharedNet(first, second, out int sharedNet))
                    {
                        continue;
                    }

                    int firstOuter = first.netA == sharedNet ? first.netB : first.netA;
                    int secondOuter = second.netA == sharedNet ? second.netB : second.netA;

                    if (firstOuter == plusNet && secondOuter == minusNet)
                    {
                        if (!CheckPolarity(first, plusNet, sharedNet, enforcePolarity, out string firstPolarity))
                        {
                            polarityIssues.Add(firstPolarity);
                            continue;
                        }

                        if (!CheckPolarity(second, sharedNet, minusNet, enforcePolarity, out string secondPolarity))
                        {
                            polarityIssues.Add(secondPolarity);
                            continue;
                        }

                        match = new SeriesMatch(first, second, sharedNet, false);
                        return true;
                    }

                    if (allowEitherOrder && firstOuter == minusNet && secondOuter == plusNet)
                    {
                        if (!CheckPolarity(second, plusNet, sharedNet, enforcePolarity, out string firstPolarity))
                        {
                            polarityIssues.Add(firstPolarity);
                            continue;
                        }

                        if (!CheckPolarity(first, sharedNet, minusNet, enforcePolarity, out string secondPolarity))
                        {
                            polarityIssues.Add(secondPolarity);
                            continue;
                        }

                        match = new SeriesMatch(first, second, sharedNet, true);
                        return true;
                    }
                }
            }

            if (polarityIssues.Count > 0)
            {
                reason = polarityIssues[0];
            }
            else
            {
                reason = $"No series path found between + and - using {firstType} and {secondType}.";
            }

            return false;
        }

        static bool FindSeriesPathBetweenTerminals(
            int plusNet,
            int minusNet,
            CircuitComponentType[] requiredTypes,
            bool allowEitherOrder,
            bool enforcePolarity,
            Dictionary<CircuitComponentType, List<NetEdge>> edgesByType,
            out SeriesMatch match,
            out string reason)
        {
            match = default;
            if (requiredTypes == null || requiredTypes.Length != 2)
            {
                reason = "Series path requires exactly two component types.";
                return false;
            }

            return FindSeriesPathBetweenTerminals(
                plusNet,
                minusNet,
                requiredTypes[0],
                requiredTypes[1],
                allowEitherOrder,
                enforcePolarity,
                edgesByType,
                out match,
                out reason);
        }

        static List<SeriesNodeCandidate> FindNodeAfterSeriesElement(
            int startNet,
            CircuitComponentType elementType,
            Dictionary<CircuitComponentType, List<NetEdge>> edgesByType)
        {
            var candidates = new List<SeriesNodeCandidate>();
            if (!edgesByType.TryGetValue(elementType, out var edges))
            {
                return candidates;
            }

            foreach (var edge in edges)
            {
                if (edge.netA == startNet && edge.netB != startNet)
                {
                    candidates.Add(new SeriesNodeCandidate(edge, edge.netB));
                }
                else if (edge.netB == startNet && edge.netA != startNet)
                {
                    candidates.Add(new SeriesNodeCandidate(edge, edge.netA));
                }
            }

            return candidates;
        }

        static bool ValidateCapacitorToMinusFromNode(
            int nodeNet,
            int minusNet,
            CircuitComponentType capacitorType,
            bool enforcePolarity,
            Dictionary<CircuitComponentType, List<NetEdge>> edgesByType,
            out NetEdge capacitorEdge,
            out string reason)
        {
            capacitorEdge = null;
            reason = string.Empty;

            if (!edgesByType.TryGetValue(capacitorType, out var edges) || edges.Count == 0)
            {
                reason = $"Missing {capacitorType} connected to node {nodeNet}.";
                return false;
            }

            foreach (var edge in edges)
            {
                int other = -1;
                if (edge.netA == nodeNet)
                {
                    other = edge.netB;
                }
                else if (edge.netB == nodeNet)
                {
                    other = edge.netA;
                }
                else
                {
                    continue;
                }

                if (other != minusNet)
                {
                    continue;
                }

                if (!CheckPolarity(edge, nodeNet, minusNet, enforcePolarity, out string polarityReason))
                {
                    reason = polarityReason;
                    continue;
                }

                capacitorEdge = edge;
                return true;
            }

            if (string.IsNullOrEmpty(reason))
            {
                reason = $"No {capacitorType} found between node {nodeNet} and minus net {minusNet}.";
            }

            return false;
        }

        static bool CheckPolarity(NetEdge edge, int plusSideNet, int minusSideNet, bool enforcePolarity, out string reason)
        {
            reason = string.Empty;
            if (!enforcePolarity || edge == null || !edge.isPolarized)
            {
                return true;
            }

            int positiveNet = edge.pinAIsPositive ? edge.netA : edge.netB;
            int negativeNet = edge.pinAIsPositive ? edge.netB : edge.netA;

            if (positiveNet == plusSideNet && negativeNet == minusSideNet)
            {
                return true;
            }

            string positiveLabel = edge.componentType == CircuitComponentType.Diode ? "anode" : "positive";
            string negativeLabel = edge.componentType == CircuitComponentType.Diode ? "cathode" : "negative";
            reason = $"{edge.componentType} '{edge.componentName}' polarity mismatch. Expected {positiveLabel} on net {plusSideNet}, {negativeLabel} on net {minusSideNet}.";
            return false;
        }

        static bool TryGetSharedNet(NetEdge edgeA, NetEdge edgeB, out int sharedNet)
        {
            if (edgeA.netA == edgeB.netA || edgeA.netA == edgeB.netB)
            {
                sharedNet = edgeA.netA;
                return true;
            }

            if (edgeA.netB == edgeB.netA || edgeA.netB == edgeB.netB)
            {
                sharedNet = edgeA.netB;
                return true;
            }

            sharedNet = -1;
            return false;
        }

        static string FormatCounts(Dictionary<CircuitComponentType, List<NetEdge>> edgesByType)
        {
            var parts = new List<string>();
            foreach (CircuitComponentType type in Enum.GetValues(typeof(CircuitComponentType)))
            {
                if (type == CircuitComponentType.Unknown)
                {
                    continue;
                }

                int count = GetCount(edgesByType, type);
                if (count > 0)
                {
                    parts.Add($"{type}={count}");
                }
            }

            return parts.Count == 0 ? "none" : string.Join(", ", parts);
        }

        static int GetCount(Dictionary<CircuitComponentType, List<NetEdge>> edgesByType, CircuitComponentType type)
        {
            return edgesByType.TryGetValue(type, out var list) ? list.Count : 0;
        }

        static Dictionary<CircuitComponentType, List<NetEdge>> BuildEdgesByType(List<NetEdge> edges)
        {
            var map = new Dictionary<CircuitComponentType, List<NetEdge>>();
            if (edges == null)
            {
                return map;
            }

            foreach (var edge in edges)
            {
                if (edge == null)
                {
                    continue;
                }

                if (!map.TryGetValue(edge.componentType, out var list))
                {
                    list = new List<NetEdge>();
                    map[edge.componentType] = list;
                }

                list.Add(edge);
            }

            return map;
        }

        static bool HasPatterns(CircuitTopologyRules rules)
        {
            return rules.patterns != null && rules.patterns.Length > 0;
        }

        readonly struct SeriesMatch
        {
            public readonly NetEdge first;
            public readonly NetEdge second;
            public readonly int sharedNet;
            public readonly bool swapped;

            public SeriesMatch(NetEdge first, NetEdge second, int sharedNet, bool swapped)
            {
                this.first = first;
                this.second = second;
                this.sharedNet = sharedNet;
                this.swapped = swapped;
            }
        }

        readonly struct SeriesNodeCandidate
        {
            public readonly NetEdge edge;
            public readonly int nextNet;

            public SeriesNodeCandidate(NetEdge edge, int nextNet)
            {
                this.edge = edge;
                this.nextNet = nextNet;
            }
        }

        static string GetNetKey(BreadboardNetlist netlist, int netId)
        {
            if (netlist == null || netId < 0 || netId >= netlist.nets.Count)
            {
                return "unknown";
            }

            var node = netlist.nets[netId];
            return string.IsNullOrEmpty(node.key) ? $"net:{netId}" : node.key;
        }
    }
}
