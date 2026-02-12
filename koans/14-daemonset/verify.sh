#!/usr/bin/env bash
set -euo pipefail

ns="${KOAN_NAMESPACE:-cka-koans}"
name="log-agent"

fail() {
  echo "[14-daemonset] $*" >&2
  exit 1
}

if ! kubectl get daemonset "$name" -n "$ns" >/dev/null 2>&1; then
  fail "DaemonSet $name not found."
fi

label=$(kubectl get daemonset "$name" -n "$ns" -o jsonpath='{.spec.selector.matchLabels.app}')
if [[ "$label" != "log-agent" ]]; then
  fail "DaemonSet selector app='$label' (expected log-agent)."
fi

img=$(kubectl get daemonset "$name" -n "$ns" -o jsonpath='{.spec.template.spec.containers[0].image}')
if [[ "$img" != "busybox:1.36" ]]; then
  fail "DaemonSet image is '$img' (expected busybox:1.36)."
fi

scheduled=$(kubectl get daemonset "$name" -n "$ns" -o jsonpath='{.status.desiredNumberScheduled}')
if [[ -z "$scheduled" || "$scheduled" -lt 1 ]]; then
  fail "DaemonSet has no scheduled pods."
fi

echo "DaemonSet looks good."
