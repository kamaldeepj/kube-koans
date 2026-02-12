#!/usr/bin/env bash
set -euo pipefail

ns="${KOAN_NAMESPACE:-cka-koans}"
name="allow-client"

fail() {
  echo "[12-networkpolicy] $*" >&2
  exit 1
}

if ! kubectl get networkpolicy "$name" -n "$ns" >/dev/null 2>&1; then
  fail "NetworkPolicy $name not found."
fi

pod_sel=$(kubectl get networkpolicy "$name" -n "$ns" -o jsonpath='{.spec.podSelector.matchLabels.app}')
from_sel=$(kubectl get networkpolicy "$name" -n "$ns" -o jsonpath='{.spec.ingress[0].from[0].podSelector.matchLabels.app}')
port=$(kubectl get networkpolicy "$name" -n "$ns" -o jsonpath='{.spec.ingress[0].ports[0].port}')

if [[ "$pod_sel" != "server" ]]; then
  fail "podSelector app is '$pod_sel' (expected server)."
fi

if [[ "$from_sel" != "client" ]]; then
  fail "from podSelector app is '$from_sel' (expected client)."
fi

if [[ "$port" != "80" ]]; then
  fail "Ingress port is '$port' (expected 80)."
fi

echo "NetworkPolicy spec looks correct."
