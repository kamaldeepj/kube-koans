# Scenario 01 – ImagePullBackOff

## Goal
Run a Deployment named `img-bad` in namespace `troubleshoot` with 2 replicas of nginx.

## Symptoms to observe
- Pods stuck in `ImagePullBackOff`.

## What to check
- `kubectl describe pod <pod>`
- Image name in the manifest

## Success criteria
- `kubectl get pods -n troubleshoot` shows 2/2 Running
- Image is valid and pulled successfully

## Manifests
Apply `deployment.yaml` and fix the issue.
