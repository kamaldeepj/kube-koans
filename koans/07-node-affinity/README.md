# Koan 07 – Node Affinity

Goal: Schedule a Pod onto Linux nodes using required node affinity.

## Requirements
- Pod named `affinity-demo` in namespace `cka-koans`.
- Uses `busybox:1.36` with `sleep 3600`.
- Has required node affinity matching `kubernetes.io/os In [linux]`.

## Suggested Steps
1. Update `pod.yaml` with the correct affinity.
2. Apply with `kubectl apply -f`.
3. Verify with `../../verify-koans.sh 07-node-affinity`.
