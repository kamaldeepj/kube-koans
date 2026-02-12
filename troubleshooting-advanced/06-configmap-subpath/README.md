# Scenario 06 – ConfigMap SubPath Mount Failure

## Goal
Get `nginx-config` pod in namespace `troubleshoot-adv` to start successfully using a custom nginx config.

## Symptoms to observe
- Pod stuck in `CreateContainerConfigError` or `CrashLoopBackOff`.
- Events indicate a volume mount error.

## What to check
- ConfigMap key name
- `subPath` in the volume mount

## Success criteria
- Pod is Running and Ready

## Manifests
Apply `configmap.yaml` and `pod.yaml`, then fix the mount.
