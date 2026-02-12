#!/usr/bin/env bash
set -euo pipefail

ns="${KOAN_NAMESPACE:-cka-koans}"
name="nodeport-demo"

fail() {
  echo "[19-service-nodeport] $*" >&2
  exit 1
}

if ! kubectl get deployment "$name" -n "$ns" >/dev/null 2>&1; then
  fail "Deployment $name not found."
fi

replicas=$(kubectl get deployment "$name" -n "$ns" -o jsonpath='{.spec.replicas}')
if [[ "$replicas" != "2" ]]; then
  fail "replicas is '$replicas' (expected 2)."
fi

if ! kubectl get service "$name" -n "$ns" >/dev/null 2>&1; then
  fail "Service $name not found."
fi

type=$(kubectl get service "$name" -n "$ns" -o jsonpath='{.spec.type}')
port=$(kubectl get service "$name" -n "$ns" -o jsonpath='{.spec.ports[0].port}')
target=$(kubectl get service "$name" -n "$ns" -o jsonpath='{.spec.ports[0].targetPort}')
nodeport=$(kubectl get service "$name" -n "$ns" -o jsonpath='{.spec.ports[0].nodePort}')

if [[ "$type" != "NodePort" ]]; then
  fail "Service type is '$type' (expected NodePort)."
fi

if [[ "$port" != "80" || "$target" != "80" || "$nodeport" != "30080" ]]; then
  fail "Service ports are $port->$target nodePort=$nodeport (expected 80->80 nodePort 30080)."
fi

echo "NodePort Service looks correct."
