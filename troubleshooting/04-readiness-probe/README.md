# Scenario 04 – Readiness Probe Misconfiguration

## Goal
Have a Deployment become Ready with 2 replicas.

## Symptoms to observe
- Pods are Running but not Ready.

## What to check
- `kubectl describe pod` readiness probe events
- Probe path/port

## Success criteria
- `kubectl get pods -n troubleshoot` shows READY 2/2 for both pods

## Manifests
Apply `deployment.yaml` and fix the issue.
