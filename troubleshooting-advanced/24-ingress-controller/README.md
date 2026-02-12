# Scenario 24 – Ingress Controller Troubleshooting

## Goal
Serve traffic through Ingress and debug when it fails.

## Symptoms to observe
- Ingress exists but host returns 404/503.

## What to check
- Ingress controller pods
- IngressClass name
- Service endpoints and port

## Success criteria
- `curl -H 'Host: koans.local' <ingress-ip>` returns content

Note: Requires an ingress controller. On Docker Desktop, enable it first.

Lab manifests are under `lab/` for a simulated IngressClass mismatch.
