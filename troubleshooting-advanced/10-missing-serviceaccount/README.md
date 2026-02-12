# Scenario 10 – Missing ServiceAccount

## Goal
Job `sa-check` should complete successfully.

## Symptoms to observe
- Pod fails to start and events mention missing ServiceAccount.

## What to check
- `serviceAccountName` in the pod spec
- Whether the ServiceAccount exists

## Success criteria
- Job succeeds with `succeeded=1`

## Manifests
Apply `job.yaml` and fix the ServiceAccount issue.
