#!/usr/bin/env bash
set -euo pipefail

ns="${KOAN_NAMESPACE:-cka-koans}"
pod_name="hello-koans"

fail() {
  echo "[01-pod-basics] $*" >&2
  exit 1
}

if ! kubectl get namespace "$ns" >/dev/null 2>&1; then
  fail "Namespace '$ns' does not exist. Create it with 'kubectl create namespace $ns'."
fi

if ! kubectl get pod "$pod_name" -n "$ns" >/dev/null 2>&1; then
  fail "Pod '$pod_name' not found in namespace '$ns'. Apply pod.yaml."
fi

phase=$(kubectl get pod "$pod_name" -n "$ns" -o jsonpath='{.status.phase}')
if [[ "$phase" != "Running" ]]; then
  fail "Pod '$pod_name' is in phase '$phase' (expected Running)."
fi

image=$(kubectl get pod "$pod_name" -n "$ns" -o jsonpath='{.spec.containers[0].image}')
if [[ "$image" != "nginx:1.25" ]]; then
  fail "Container image is '$image' (expected nginx:1.25)."
fi

label=$(kubectl get pod "$pod_name" -n "$ns" -o jsonpath='{.metadata.labels.app}')
if [[ "$label" != "pod-basics" ]]; then
  fail "Label app='$label' (expected pod-basics)."
fi

port=$(kubectl get pod "$pod_name" -n "$ns" -o jsonpath='{.spec.containers[0].ports[0].containerPort}')
if [[ "$port" != "80" ]]; then
  fail "Container port is '$port' (expected 80)."
fi

echo "Pod looks good."
