#!/usr/bin/env bash
set -euo pipefail

ns="${KOAN_NAMESPACE:-cka-koans}"
name="probe-demo"

fail() {
  echo "[17-probes] $*" >&2
  exit 1
}

if ! kubectl get deployment "$name" -n "$ns" >/dev/null 2>&1; then
  fail "Deployment $name not found."
fi

replicas=$(kubectl get deployment "$name" -n "$ns" -o jsonpath='{.spec.replicas}')
if [[ "$replicas" != "2" ]]; then
  fail "replicas is '$replicas' (expected 2)."
fi

l_path=$(kubectl get deployment "$name" -n "$ns" -o jsonpath='{.spec.template.spec.containers[0].livenessProbe.httpGet.path}')
r_path=$(kubectl get deployment "$name" -n "$ns" -o jsonpath='{.spec.template.spec.containers[0].readinessProbe.httpGet.path}')

if [[ "$l_path" != "/" || "$r_path" != "/" ]]; then
  fail "Expected liveness/readiness path '/' (got liveness=$l_path readiness=$r_path)."
fi

echo "Probes look correct."
