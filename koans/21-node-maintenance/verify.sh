#!/usr/bin/env bash
set -euo pipefail

label="koans.cka/maintenance=true"

fail() {
  echo "[21-node-maintenance] $*" >&2
  exit 1
}

node=$(kubectl get nodes -l "$label" -o jsonpath='{.items[0].metadata.name}' 2>/dev/null || true)
if [[ -z "$node" ]]; then
  fail "No node found with label $label. Label a node first."
fi

unschedulable=$(kubectl get node "$node" -o jsonpath='{.spec.unschedulable}')
if [[ "$unschedulable" != "true" ]]; then
  fail "Node $node is not cordoned (unschedulable=$unschedulable)."
fi

echo "Node $node is cordoned. Remember to uncordon after verification."
