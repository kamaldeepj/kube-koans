# Koan 08 – Taints and Tolerations

Goal: Create a Pod that tolerates a NoSchedule taint.

## Requirements
- Pod named `toleration-demo` in namespace `cka-koans`.
- Uses `busybox:1.36` with `sleep 3600`.
- Includes a toleration for taint key `dedicated`, value `training`, effect `NoSchedule`.

Optional practice (not required for verification):
- Taint a node with `kubectl taint nodes <node> dedicated=training:NoSchedule`.
- Confirm the Pod can still schedule.

## Suggested Steps
1. Update `pod.yaml`.
2. Apply with `kubectl apply -f`.
3. Verify with `../../verify-koans.sh 08-taints-tolerations`.
