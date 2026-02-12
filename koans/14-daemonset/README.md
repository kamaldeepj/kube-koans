# Koan 14 – DaemonSet

Goal: Run a DaemonSet that schedules a Pod on every node.

## Requirements
- DaemonSet named `log-agent` in namespace `cka-koans`.
- Label `app: log-agent` on the DaemonSet selector and pod template.
- Container image `busybox:1.36` running `sleep 3600`.

## Suggested Steps
1. Fix `daemonset.yaml`.
2. Apply with `kubectl apply -f`.
3. Verify with `../../verify-koans.sh 14-daemonset`.
