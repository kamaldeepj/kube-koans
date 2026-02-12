#!/usr/bin/env bash
set -euo pipefail

ns="${KOAN_NAMESPACE:-cka-koans}"

fail() {
  echo "[04-configmap-secret] $*" >&2
  exit 1
}

if ! kubectl get configmap app-config -n "$ns" >/dev/null 2>&1; then
  fail "ConfigMap app-config not found."
fi

cfg_val=$(kubectl get configmap app-config -n "$ns" -o jsonpath='{.data.APP_MODE}')
if [[ "$cfg_val" != "practice" ]]; then
  fail "ConfigMap APP_MODE is '$cfg_val' (expected practice)."
fi

if ! kubectl get secret app-secret -n "$ns" >/dev/null 2>&1; then
  fail "Secret app-secret not found."
fi

secret_val=$(kubectl get secret app-secret -n "$ns" -o jsonpath='{.data.PASSWORD}')
if [[ "$secret_val" != "Y2th" ]]; then
  fail "Secret PASSWORD is '$secret_val' (expected base64 of cka -> Y2th)."
fi

if ! kubectl get pod config-demo -n "$ns" >/dev/null 2>&1; then
  fail "Pod config-demo not found."
fi

env_cfg=$(kubectl get pod config-demo -n "$ns" -o jsonpath='{.spec.containers[0].env[?(@.name=="APP_MODE")].valueFrom.configMapKeyRef.name}')
if [[ "$env_cfg" != "app-config" ]]; then
  fail "Pod APP_MODE env is not sourced from app-config."
fi

env_secret=$(kubectl get pod config-demo -n "$ns" -o jsonpath='{.spec.containers[0].env[?(@.name=="PASSWORD")].valueFrom.secretKeyRef.name}')
if [[ "$env_secret" != "app-secret" ]]; then
  fail "Pod PASSWORD env is not sourced from app-secret."
fi

echo "ConfigMap/Secret wiring looks good."
