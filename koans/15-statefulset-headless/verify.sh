#!/usr/bin/env bash
set -euo pipefail

ns="${KOAN_NAMESPACE:-cka-koans}"
name="db"

fail() {
  echo "[15-statefulset-headless] $*" >&2
  exit 1
}

if ! kubectl get service "$name" -n "$ns" >/dev/null 2>&1; then
  fail "Service db not found."
fi

cluster_ip=$(kubectl get service "$name" -n "$ns" -o jsonpath='{.spec.clusterIP}')
if [[ "$cluster_ip" != "None" ]]; then
  fail "Service clusterIP is '$cluster_ip' (expected None)."
fi

if ! kubectl get statefulset "$name" -n "$ns" >/dev/null 2>&1; then
  fail "StatefulSet db not found."
fi

svc_name=$(kubectl get statefulset "$name" -n "$ns" -o jsonpath='{.spec.serviceName}')
replicas=$(kubectl get statefulset "$name" -n "$ns" -o jsonpath='{.spec.replicas}')
image=$(kubectl get statefulset "$name" -n "$ns" -o jsonpath='{.spec.template.spec.containers[0].image}')

if [[ "$svc_name" != "db" ]]; then
  fail "StatefulSet serviceName is '$svc_name' (expected db)."
fi

if [[ "$replicas" != "2" ]]; then
  fail "StatefulSet replicas is '$replicas' (expected 2)."
fi

if [[ "$image" != "nginx:1.25" ]]; then
  fail "StatefulSet image is '$image' (expected nginx:1.25)."
fi

echo "StatefulSet and headless Service look good."
