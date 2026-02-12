#!/usr/bin/env bash
set -euo pipefail

ns="${KOAN_NAMESPACE:-cka-koans}"
pc="high-priority"

fail() {
  echo "[22-priorityclass] $*" >&2
  exit 1
}

if ! kubectl get priorityclass "$pc" >/dev/null 2>&1; then
  fail "PriorityClass $pc not found."
fi

value=$(kubectl get priorityclass "$pc" -o jsonpath='{.value}')
if [[ "$value" != "100000" ]]; then
  fail "PriorityClass value is '$value' (expected 100000)."
fi

global=$(kubectl get priorityclass "$pc" -o jsonpath='{.globalDefault}')
if [[ "$global" != "false" ]]; then
  fail "PriorityClass globalDefault is '$global' (expected false)."
fi

if ! kubectl get pod priority-demo -n "$ns" >/dev/null 2>&1; then
  fail "Pod priority-demo not found."
fi

pc_name=$(kubectl get pod priority-demo -n "$ns" -o jsonpath='{.spec.priorityClassName}')
if [[ "$pc_name" != "$pc" ]]; then
  fail "Pod priorityClassName is '$pc_name' (expected $pc)."
fi

echo "PriorityClass looks correct."
