# Koan 22 – PriorityClass

Goal: Create a PriorityClass and schedule a Pod that uses it.

## Requirements
- PriorityClass named `high-priority` with value `100000` and `globalDefault: false`.
- Pod `priority-demo` in namespace `cka-koans` using that PriorityClass.

## Suggested Steps
1. Fix `priorityclass.yaml` and `pod.yaml`.
2. Apply with `kubectl apply -f`.
3. Verify with `../../verify-koans.sh 22-priorityclass`.
