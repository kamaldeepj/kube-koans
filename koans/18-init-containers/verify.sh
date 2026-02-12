#!/usr/bin/env bash
set -euo pipefail

ns="${KOAN_NAMESPACE:-cka-koans}"
name="init-demo"

fail() {
  echo "[18-init-containers] $*" >&2
  exit 1
}

if ! kubectl get pod "$name" -n "$ns" >/dev/null 2>&1; then
  fail "Pod $name not found."
fi

init_cmd=$(kubectl get pod "$name" -n "$ns" -o jsonpath='{.spec.initContainers[0].command[2]}')
if [[ "$init_cmd" != "echo ready > /work/status.txt" ]]; then
  fail "Init container command is '$init_cmd' (expected 'echo ready > /work/status.txt')."
fi

vol_mount=$(kubectl get pod "$name" -n "$ns" -o jsonpath='{.spec.initContainers[0].volumeMounts[0].mountPath}')
if [[ "$vol_mount" != "/work" ]]; then
  fail "Init container mountPath is '$vol_mount' (expected /work)."
fi

echo "Init container spec looks correct."
