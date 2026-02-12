# Scenario 12 – OOMKilled

## Goal
Deployment `memhog` should stay Running without OOMKills.

## Symptoms to observe
- Pods restart repeatedly.
- `kubectl describe pod` shows `OOMKilled`.

## What to check
- Container memory limits vs actual usage
- Logs / events

## Success criteria
- Pod is Running with 0 restarts

## Manifests
Apply `deployment.yaml` and fix the resource limits or workload.
