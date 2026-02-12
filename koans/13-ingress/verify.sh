#!/usr/bin/env bash
set -euo pipefail

ns="${KOAN_NAMESPACE:-cka-koans}"
name="web-ingress"

fail() {
  echo "[13-ingress] $*" >&2
  exit 1
}

if ! kubectl get ingress "$name" -n "$ns" >/dev/null 2>&1; then
  fail "Ingress $name not found."
fi

class=$(kubectl get ingress "$name" -n "$ns" -o jsonpath='{.spec.ingressClassName}')
if [[ "$class" != "nginx" ]]; then
  fail "ingressClassName is '$class' (expected nginx)."
fi

host=$(kubectl get ingress "$name" -n "$ns" -o jsonpath='{.spec.rules[0].host}')
path=$(kubectl get ingress "$name" -n "$ns" -o jsonpath='{.spec.rules[0].http.paths[0].path}')
svc=$(kubectl get ingress "$name" -n "$ns" -o jsonpath='{.spec.rules[0].http.paths[0].backend.service.name}')
port=$(kubectl get ingress "$name" -n "$ns" -o jsonpath='{.spec.rules[0].http.paths[0].backend.service.port.number}')

if [[ "$host" != "koans.local" ]]; then
  fail "Ingress host is '$host' (expected koans.local)."
fi

if [[ "$path" != "/" ]]; then
  fail "Ingress path is '$path' (expected /)."
fi

if [[ "$svc" != "web-koans" || "$port" != "80" ]]; then
  fail "Ingress backend is $svc:$port (expected web-koans:80)."
fi

echo "Ingress spec looks correct."
