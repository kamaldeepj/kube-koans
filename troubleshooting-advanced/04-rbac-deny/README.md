# Scenario 04 – RBAC Forbidden

## Goal
Get Job `rbac-check` in namespace `troubleshoot-adv` to succeed.

## Symptoms to observe
- Job fails quickly.
- Logs show `forbidden` errors from the API.

## What to check
- ServiceAccount used by the job
- Role/RoleBinding permissions
- `kubectl auth can-i` with the ServiceAccount

## Success criteria
- Job completes successfully (`succeeded=1`)
- Logs no longer show RBAC errors

## Manifests
Apply all YAML files in this folder and fix the RBAC issue.
