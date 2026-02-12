# Scenario 02 – CrashLoopBackOff

## Goal
Run a Deployment named `crash-demo` in namespace `troubleshoot` using `busybox:1.36` that stays Running.

## Symptoms to observe
- Pods in `CrashLoopBackOff`.

## What to check
- `kubectl logs` for the container
- Container command and args

## Success criteria
- `kubectl get pods -n troubleshoot` shows the Pod Running
- Container stays up (no restarts incrementing)

## Manifests
Apply `deployment.yaml` and fix the issue.
