#!/usr/bin/env bash
set -euo pipefail

ns="${KOAN_NAMESPACE:-cka-koans}"
deploy="web-koans"

fail() {
  echo "[02-deployment-rollout] $*" >&2
  exit 1
}

jsonpath() {
  local path="$1"
  kubectl get deployment "$deploy" -n "$ns" -o "jsonpath=${path}"
}

if ! kubectl get deployment "$deploy" -n "$ns" >/dev/null 2>&1; then
  fail "Deployment '$deploy' not found in namespace '$ns'."
fi

replicas=$(jsonpath '{.status.readyReplicas}')
if [[ -z "$replicas" || "$replicas" -lt 3 ]]; then
  fail "Expected 3 ready replicas; have '${replicas:-0}'."
fi

spec_replicas=$(jsonpath '{.spec.replicas}')
if [[ "$spec_replicas" != "3" ]]; then
  fail "spec.replicas is '$spec_replicas' (expected 3)."
fi

image=$(jsonpath '{.spec.template.spec.containers[0].image}')
if [[ "$image" != "nginx:1.25" ]]; then
  fail "Container image is '$image' (expected nginx:1.25)."
fi

max_unavailable=$(jsonpath '{.spec.strategy.rollingUpdate.maxUnavailable}')
max_surge=$(jsonpath '{.spec.strategy.rollingUpdate.maxSurge}')
if [[ "$max_unavailable" != "0" || "$max_surge" != "1" ]]; then
  fail "Expected rollingUpdate maxUnavailable=0 and maxSurge=1 (got $max_unavailable/$max_surge)."
fi

selector=$(jsonpath '{.spec.selector.matchLabels.app}')
template_label=$(jsonpath '{.spec.template.metadata.labels.app}')
if [[ "$selector" != "web-koans" || "$template_label" != "web-koans" ]]; then
  fail "Labels must be app=web-koans (selector=$selector template=$template_label)."
fi

echo "Deployment looks healthy."
