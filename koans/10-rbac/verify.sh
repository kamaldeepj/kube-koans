#!/usr/bin/env bash
set -euo pipefail

ns="${KOAN_NAMESPACE:-cka-koans}"
sa="reader-sa"
role="pod-reader"
rb="pod-reader-binding"

fail() {
  echo "[10-rbac] $*" >&2
  exit 1
}

if ! kubectl get serviceaccount "$sa" -n "$ns" >/dev/null 2>&1; then
  fail "ServiceAccount $sa not found."
fi

if ! kubectl get role "$role" -n "$ns" >/dev/null 2>&1; then
  fail "Role $role not found."
fi

if ! kubectl get rolebinding "$rb" -n "$ns" >/dev/null 2>&1; then
  fail "RoleBinding $rb not found."
fi

can_get=$(kubectl auth can-i get pods -n "$ns" --as "system:serviceaccount:${ns}:${sa}")
if [[ "$can_get" != "yes" ]]; then
  fail "ServiceAccount $sa cannot get pods (expected yes)."
fi

can_delete=$(kubectl auth can-i delete pods -n "$ns" --as "system:serviceaccount:${ns}:${sa}")
if [[ "$can_delete" != "no" ]]; then
  fail "ServiceAccount $sa should not be able to delete pods."
fi

echo "RBAC looks correct."
