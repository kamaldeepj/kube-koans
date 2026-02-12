#!/usr/bin/env bash
set -euo pipefail

fail() {
  echo "[23-kubeconfig-context] $*" >&2
  exit 1
}

ns=$(kubectl config view --minify -o jsonpath='{.contexts[0].context.namespace}')
if [[ "$ns" != "cka-koans" ]]; then
  fail "Current context namespace is '$ns' (expected cka-koans)."
fi

echo "Kubeconfig context namespace is set correctly."
