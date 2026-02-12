#!/usr/bin/env bash
set -euo pipefail

ns="${KOAN_NAMESPACE:-cka-koans}"
name="toleration-demo"

fail() {
  echo "[08-taints-tolerations] $*" >&2
  exit 1
}

if ! kubectl get pod "$name" -n "$ns" >/dev/null 2>&1; then
  fail "Pod $name not found."
fi

key=$(kubectl get pod "$name" -n "$ns" -o jsonpath='{.spec.tolerations[0].key}')
val=$(kubectl get pod "$name" -n "$ns" -o jsonpath='{.spec.tolerations[0].value}')
effect=$(kubectl get pod "$name" -n "$ns" -o jsonpath='{.spec.tolerations[0].effect}')

if [[ "$key" != "dedicated" || "$val" != "training" || "$effect" != "NoSchedule" ]]; then
  fail "Expected toleration dedicated=training:NoSchedule (got $key=$val:$effect)."
fi

echo "Toleration looks correct."
