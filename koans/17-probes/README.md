# Koan 17 – Liveness and Readiness Probes

Goal: Configure liveness and readiness probes on a Deployment.

## Requirements
- Deployment `probe-demo` in namespace `cka-koans`.
- Image `nginx:1.25`.
- Liveness and readiness HTTP probes on path `/` port `80`.
- `replicas: 2`.

## Suggested Steps
1. Fix `deployment.yaml`.
2. Apply with `kubectl apply -f`.
3. Verify with `../../verify-koans.sh 17-probes`.
