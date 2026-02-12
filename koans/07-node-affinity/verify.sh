#!/usr/bin/env bash
set -euo pipefail

ns="${KOAN_NAMESPACE:-cka-koans}"
name="affinity-demo"

fail() {
  echo "[07-node-affinity] $*" >&2
  exit 1
}

if ! kubectl get pod "$name" -n "$ns" >/dev/null 2>&1; then
  fail "Pod $name not found."
fi

key=$(kubectl get pod "$name" -n "$ns" -o jsonpath='{.spec.affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms[0].matchExpressions[0].key}')
val=$(kubectl get pod "$name" -n "$ns" -o jsonpath='{.spec.affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms[0].matchExpressions[0].values[0]}')
if [[ "$key" != "kubernetes.io/os" || "$val" != "linux" ]]; then
  fail "Expected node affinity kubernetes.io/os In [linux] (got $key=$val)."
fi

echo "Node affinity looks correct."
