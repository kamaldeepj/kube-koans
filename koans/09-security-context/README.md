# Koan 09 – Pod Security Context

Goal: Run a Pod as a non-root user with a read-only root filesystem.

## Requirements
- Pod named `secure-pod` in namespace `cka-koans`.
- Uses `busybox:1.36` with `sleep 3600`.
- Pod or container security context should include:
  - `runAsNonRoot: true`
  - `runAsUser: 1000`
  - `readOnlyRootFilesystem: true` (container-level)

## Suggested Steps
1. Update `pod.yaml`.
2. Apply with `kubectl apply -f`.
3. Verify with `../../verify-koans.sh 09-security-context`.
