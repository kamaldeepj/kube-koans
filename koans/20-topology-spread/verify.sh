#!/usr/bin/env bash
set -euo pipefail

ns="${KOAN_NAMESPACE:-cka-koans}"
name="spread-demo"

fail() {
  echo "[20-topology-spread] $*" >&2
  exit 1
}

if ! kubectl get deployment "$name" -n "$ns" >/dev/null 2>&1; then
  fail "Deployment $name not found."
fi

replicas=$(kubectl get deployment "$name" -n "$ns" -o jsonpath='{.spec.replicas}')
max_skew=$(kubectl get deployment "$name" -n "$ns" -o jsonpath='{.spec.template.spec.topologySpreadConstraints[0].maxSkew}')
key=$(kubectl get deployment "$name" -n "$ns" -o jsonpath='{.spec.template.spec.topologySpreadConstraints[0].topologyKey}')
when=$(kubectl get deployment "$name" -n "$ns" -o jsonpath='{.spec.template.spec.topologySpreadConstraints[0].whenUnsatisfiable}')
label=$(kubectl get deployment "$name" -n "$ns" -o jsonpath='{.spec.template.spec.topologySpreadConstraints[0].labelSelector.matchLabels.app}')

if [[ "$replicas" != "3" ]]; then
  fail "replicas is '$replicas' (expected 3)."
fi

if [[ "$max_skew" != "1" ]]; then
  fail "maxSkew is '$max_skew' (expected 1)."
fi

if [[ "$key" != "kubernetes.io/hostname" ]]; then
  fail "topologyKey is '$key' (expected kubernetes.io/hostname)."
fi

if [[ "$when" != "DoNotSchedule" ]]; then
  fail "whenUnsatisfiable is '$when' (expected DoNotSchedule)."
fi

if [[ "$label" != "spread-demo" ]]; then
  fail "labelSelector app is '$label' (expected spread-demo)."
fi

echo "Topology spread constraints look correct."
