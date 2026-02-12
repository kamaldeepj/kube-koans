#!/usr/bin/env bash
set -euo pipefail

ns="${KOAN_NAMESPACE:-cka-koans}"
name="web-pdb"

fail() {
  echo "[16-pdb] $*" >&2
  exit 1
}

if ! kubectl get pdb "$name" -n "$ns" >/dev/null 2>&1; then
  fail "PodDisruptionBudget $name not found."
fi

min_avail=$(kubectl get pdb "$name" -n "$ns" -o jsonpath='{.spec.minAvailable}')
selector=$(kubectl get pdb "$name" -n "$ns" -o jsonpath='{.spec.selector.matchLabels.app}')

if [[ "$min_avail" != "2" ]]; then
  fail "minAvailable is '$min_avail' (expected 2)."
fi

if [[ "$selector" != "web-koans" ]]; then
  fail "selector app is '$selector' (expected web-koans)."
fi

echo "PDB looks correct."
