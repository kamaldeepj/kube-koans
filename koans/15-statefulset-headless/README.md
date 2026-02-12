# Koan 15 – StatefulSet with Headless Service

Goal: Create a headless Service and a StatefulSet using it.

## Requirements
- Headless Service `db` in namespace `cka-koans` with `clusterIP: None`.
- StatefulSet `db` in namespace `cka-koans`:
  - `serviceName: db`.
  - `replicas: 2`.
  - Container image `nginx:1.25`.

## Suggested Steps
1. Fix `service.yaml` and `statefulset.yaml`.
2. Apply with `kubectl apply -f`.
3. Verify with `../../verify-koans.sh 15-statefulset-headless`.
