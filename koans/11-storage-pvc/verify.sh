#!/usr/bin/env bash
set -euo pipefail

ns="${KOAN_NAMESPACE:-cka-koans}"

fail() {
  echo "[11-storage-pvc] $*" >&2
  exit 1
}

if ! kubectl get pvc data-pvc -n "$ns" >/dev/null 2>&1; then
  fail "PVC data-pvc not found."
fi

status=$(kubectl get pvc data-pvc -n "$ns" -o jsonpath='{.status.phase}')
if [[ "$status" != "Bound" ]]; then
  fail "PVC data-pvc is '$status' (expected Bound)."
fi

if ! kubectl get pod pvc-demo -n "$ns" >/dev/null 2>&1; then
  fail "Pod pvc-demo not found."
fi

claim=$(kubectl get pod pvc-demo -n "$ns" -o jsonpath='{.spec.volumes[0].persistentVolumeClaim.claimName}')
if [[ "$claim" != "data-pvc" ]]; then
  fail "Pod pvc-demo should mount claim data-pvc (got $claim)."
fi

mount=$(kubectl get pod pvc-demo -n "$ns" -o jsonpath='{.spec.containers[0].volumeMounts[0].mountPath}')
if [[ "$mount" != "/data" ]]; then
  fail "Pod pvc-demo mountPath is $mount (expected /data)."
fi

echo "PVC and Pod mount look good."
