#!/usr/bin/env bash
set -euo pipefail

ns="${KOAN_NAMESPACE:-cka-koans}"
name="resource-demo"

fail() {
  echo "[06-resources-limits] $*" >&2
  exit 1
}

if ! kubectl get deployment "$name" -n "$ns" >/dev/null 2>&1; then
  fail "Deployment $name not found."
fi

replicas=$(kubectl get deployment "$name" -n "$ns" -o jsonpath='{.spec.replicas}')
if [[ "$replicas" != "2" ]]; then
  fail "replicas is '$replicas' (expected 2)."
fi

req_cpu=$(kubectl get deployment "$name" -n "$ns" -o jsonpath='{.spec.template.spec.containers[0].resources.requests.cpu}')
req_mem=$(kubectl get deployment "$name" -n "$ns" -o jsonpath='{.spec.template.spec.containers[0].resources.requests.memory}')
lim_cpu=$(kubectl get deployment "$name" -n "$ns" -o jsonpath='{.spec.template.spec.containers[0].resources.limits.cpu}')
lim_mem=$(kubectl get deployment "$name" -n "$ns" -o jsonpath='{.spec.template.spec.containers[0].resources.limits.memory}')

if [[ "$req_cpu" != "100m" || "$req_mem" != "128Mi" ]]; then
  fail "Requests are cpu=$req_cpu mem=$req_mem (expected 100m/128Mi)."
fi

if [[ "$lim_cpu" != "250m" || "$lim_mem" != "256Mi" ]]; then
  fail "Limits are cpu=$lim_cpu mem=$lim_mem (expected 250m/256Mi)."
fi

echo "Resources look correct."
