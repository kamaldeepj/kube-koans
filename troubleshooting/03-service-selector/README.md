# Scenario 03 – Service Has No Endpoints

## Goal
Expose a Deployment with a ClusterIP Service so it has active endpoints.

## Symptoms to observe
- Service exists but `kubectl get endpoints` shows none.

## What to check
- Labels on Pods
- Service selector

## Success criteria
- `kubectl get endpoints web-svc -n troubleshoot` shows at least one IP
- `kubectl get pods -n troubleshoot` shows the Pods Running

## Manifests
Apply `deployment.yaml` and `service.yaml`, then fix the issue.
