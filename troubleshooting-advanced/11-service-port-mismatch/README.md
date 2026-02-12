# Scenario 11 – Service Port Mismatch

## Goal
Client can reach the `web` service on port 80.

## Symptoms to observe
- Pods are Running.
- Service has endpoints.
- Client curl to service fails (connection refused).

## What to check
- Service port/targetPort
- Container port

## Success criteria
- `kubectl exec -n troubleshoot-adv client -- curl -sS web:80` returns HTML

## Manifests
Apply `server.yaml` and `client.yaml`, then fix the service definition.
