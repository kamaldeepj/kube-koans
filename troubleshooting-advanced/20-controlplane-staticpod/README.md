# Scenario 20 – Control Plane Static Pod Misconfig (System Level)

## Goal
Identify misconfigured control-plane static pod manifests.

## Symptoms to observe
- `kube-apiserver` or other control-plane pods crash/restart.
- `kubectl` commands fail or become flaky.

## What to check
- Static pod manifests (typically in `/etc/kubernetes/manifests/`)
- kubelet logs
- Control-plane pod logs/events

## Success criteria
- Control-plane components running and `kubectl get nodes` works

## Task
Use this as a diagnostic drill. On managed clusters, you may not access manifests.
