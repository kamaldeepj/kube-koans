# Koan 10 – RBAC Basics

Goal: Create a ServiceAccount and grant it read-only access to Pods in `cka-koans`.

## Requirements
- ServiceAccount `reader-sa` in namespace `cka-koans`.
- Role `pod-reader` in namespace `cka-koans` allowing `get`, `list`, `watch` on pods.
- RoleBinding `pod-reader-binding` binding the Role to the ServiceAccount.

## Suggested Steps
1. Update `serviceaccount.yaml`, `role.yaml`, `rolebinding.yaml`.
2. Apply with `kubectl apply -f`.
3. Verify with `../../verify-koans.sh 10-rbac`.
