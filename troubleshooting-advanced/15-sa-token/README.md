# Scenario 15 – ServiceAccount Token Not Mounted

## Goal
Job `sa-token` should successfully read the in-cluster API.

## Symptoms to observe
- Job fails with authentication errors.
- Pod spec has `automountServiceAccountToken: false`.

## What to check
- Pod spec for token automount
- ServiceAccount permissions

## Success criteria
- Job succeeds (`succeeded=1`)
- Logs show a successful API call

## Manifests
Apply `serviceaccount.yaml` and `job.yaml`, then fix the token mounting.
