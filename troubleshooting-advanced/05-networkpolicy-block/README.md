# Scenario 05 – NetworkPolicy Blocking Traffic

## Goal
Allow `client` pods to reach the `server` service on port 80 in namespace `troubleshoot-adv`.

## Symptoms to observe
- `client` pod cannot connect to the `server` service.
- `kubectl get endpoints server` shows healthy endpoints but traffic is blocked.

## What to check
- NetworkPolicy selectors and allowed sources
- Labels on client/server pods

## Success criteria
- A curl/wget from the client to the service succeeds

## Manifests
Apply all YAML files in this folder and fix the policy.

Note: This requires a CNI that enforces NetworkPolicy. If your cluster doesn't enforce it, treat as a spec-fix exercise.
