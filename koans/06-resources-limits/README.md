# Koan 06 – Resource Requests and Limits

Goal: Set CPU/memory requests and limits for a Deployment.

## Requirements
- Deployment named `resource-demo` in namespace `cka-koans`.
- `replicas: 2`.
- Container image `nginx:1.25` with:
  - Requests: cpu `100m`, memory `128Mi`.
  - Limits: cpu `250m`, memory `256Mi`.

## Suggested Steps
1. Fix `deployment.yaml`.
2. Apply with `kubectl apply -f`.
3. Verify with `../../verify-koans.sh 06-resources-limits`.
