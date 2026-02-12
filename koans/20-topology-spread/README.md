# Koan 20 – Topology Spread Constraints

Goal: Configure topology spread constraints on a Deployment.

## Requirements
- Deployment `spread-demo` in namespace `cka-koans`.
- `replicas: 3`.
- Topology spread across `kubernetes.io/hostname`:
  - `maxSkew: 1`
  - `whenUnsatisfiable: DoNotSchedule`
  - `labelSelector` matching `app=spread-demo`

Note: On a single-node cluster, scheduling is still possible; this koan only checks the spec.

## Suggested Steps
1. Fix `deployment.yaml`.
2. Apply with `kubectl apply -f`.
3. Verify with `../../verify-koans.sh 20-topology-spread`.
