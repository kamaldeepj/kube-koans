#!/usr/bin/env bash
set -euo pipefail

ns="${KOAN_NAMESPACE:-cka-koans}"
name="secure-pod"

fail() {
  echo "[09-security-context] $*" >&2
  exit 1
}

if ! kubectl get pod "$name" -n "$ns" >/dev/null 2>&1; then
  fail "Pod $name not found."
fi

run_non_root=$(kubectl get pod "$name" -n "$ns" -o jsonpath='{.spec.securityContext.runAsNonRoot}')
run_user=$(kubectl get pod "$name" -n "$ns" -o jsonpath='{.spec.securityContext.runAsUser}')
ro_fs=$(kubectl get pod "$name" -n "$ns" -o jsonpath='{.spec.containers[0].securityContext.readOnlyRootFilesystem}')

if [[ "$run_non_root" != "true" ]]; then
  fail "runAsNonRoot is '$run_non_root' (expected true)."
fi

if [[ "$run_user" != "1000" ]]; then
  fail "runAsUser is '$run_user' (expected 1000)."
fi

if [[ "$ro_fs" != "true" ]]; then
  fail "readOnlyRootFilesystem is '$ro_fs' (expected true)."
fi

echo "Security context looks correct."
