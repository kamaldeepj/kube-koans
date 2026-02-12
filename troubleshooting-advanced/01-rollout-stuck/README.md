# Scenario 01 – Rollout Stuck

## Goal
Successfully roll out Deployment `api` in namespace `troubleshoot-adv`.

## Symptoms to observe
- `kubectl rollout status` hangs or times out.
- Old ReplicaSet remains, new pods never become Ready.

## What to check
- Deployment strategy (maxUnavailable/maxSurge)
- PDB constraints
- Pod image / events

## Success criteria
- `kubectl rollout status deploy/api -n troubleshoot-adv` completes
- 3/3 pods ready

## Manifests
Apply `deployment.yaml` and `pdb.yaml`, then fix the rollout.
