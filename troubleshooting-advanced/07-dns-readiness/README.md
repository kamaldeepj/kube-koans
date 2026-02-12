# Scenario 07 – DNS/Service Name Mismatch

## Goal
Deployment `frontend` should become Ready (2/2) by successfully reaching the `api` Service.

## Symptoms to observe
- Pods are Running but not Ready.
- Readiness probe failures reference DNS/service lookup.

## What to check
- Service name and port
- Environment variables used by readiness probe
- `kubectl describe pod` events

## Success criteria
- `kubectl get pods -n troubleshoot-adv` shows READY 2/2 for frontend
- Readiness probe stops failing

## Manifests
Apply `api.yaml` and `frontend.yaml`, then fix the mismatch.
