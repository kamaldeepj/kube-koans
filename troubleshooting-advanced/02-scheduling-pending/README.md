# Scenario 02 – Scheduling Pending

## Goal
Get Deployment `batch` in namespace `troubleshoot-adv` to schedule and run 2 pods.

## Symptoms to observe
- Pods stuck in Pending.

## What to check
- Node labels
- Node selector/affinity
- Events for scheduling errors

## Success criteria
- `kubectl get pods -n troubleshoot-adv` shows 2/2 Running

## Manifests
Apply `deployment.yaml` and fix the scheduling issue.
