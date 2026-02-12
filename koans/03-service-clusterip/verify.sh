#!/usr/bin/env bash
set -euo pipefail

ns="${KOAN_NAMESPACE:-cka-koans}"
svc="web-koans"

deploy_ready=$(kubectl get deployment web-koans -n "$ns" -o jsonpath='{.status.readyReplicas}' 2>/dev/null || echo "0")

fail() {
  echo "[03-service-clusterip] $*" >&2
  exit 1
}

if ! kubectl get svc "$svc" -n "$ns" >/dev/null 2>&1; then
  fail "Service '$svc' not found in namespace '$ns'."
fi

type=$(kubectl get svc "$svc" -n "$ns" -o jsonpath='{.spec.type}')
if [[ "$type" != "ClusterIP" ]]; then
  fail "Service type is '$type' (expected ClusterIP)."
fi

selector=$(kubectl get svc "$svc" -n "$ns" -o jsonpath='{.spec.selector.app}')
if [[ "$selector" != "web-koans" ]]; then
  fail "Service selector app='$selector' (expected web-koans)."
fi

port=$(kubectl get svc "$svc" -n "$ns" -o jsonpath='{.spec.ports[0].port}')
target=$(kubectl get svc "$svc" -n "$ns" -o jsonpath='{.spec.ports[0].targetPort}')
if [[ "$port" != "80" || "$target" != "80" ]]; then
  fail "Service ports must be 80 -> 80 (current $port -> $target)."
fi

ips=$(kubectl get endpoints "$svc" -n "$ns" -o jsonpath='{range .subsets[*].addresses[*]}{.ip} {end}')
ips_trimmed="${ips## }"
ips_trimmed="${ips_trimmed%% }"
count=0
if [[ -n "$ips_trimmed" ]]; then
  read -r -a arr <<< "$ips_trimmed"
  count=${#arr[@]}
fi

if [[ "$count" -eq 0 ]]; then
  fail "Endpoint list is empty; Service is not targeting any Pods."
fi

if [[ "$deploy_ready" -eq 0 ]]; then
  fail "Deployment web-koans has no ready replicas; complete Koan 02 first."
fi

if [[ "$count" -ne "$deploy_ready" ]]; then
  fail "Expected $deploy_ready endpoints but found $count."
fi

echo "Service wiring looks correct."
