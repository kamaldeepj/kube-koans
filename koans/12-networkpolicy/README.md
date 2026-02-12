# Koan 12 – NetworkPolicy

Goal: Define a NetworkPolicy that only allows ingress to `app=server` from `app=client` on port 80.

## Requirements
- NetworkPolicy named `allow-client` in namespace `cka-koans`.
- Applies to Pods with label `app=server`.
- Allows ingress from Pods with label `app=client` on TCP port 80.

Note: Enforcement depends on the cluster CNI. This koan only checks the policy spec.

## Suggested Steps
1. Fix `networkpolicy.yaml`.
2. Apply with `kubectl apply -f`.
3. Verify with `../../verify-koans.sh 12-networkpolicy`.
