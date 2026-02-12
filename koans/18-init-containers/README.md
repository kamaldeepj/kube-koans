# Koan 18 – Init Containers

Goal: Use an init container to prepare data for the main container.

## Requirements
- Pod `init-demo` in namespace `cka-koans`.
- Init container `init-setup` using `busybox:1.36` that writes `ready` to `/work/status.txt`.
- Main container `main` using `busybox:1.36` with `sleep 3600`.
- Shared `emptyDir` volume mounted at `/work` in both containers.

## Suggested Steps
1. Fix `pod.yaml`.
2. Apply with `kubectl apply -f`.
3. Verify with `../../verify-koans.sh 18-init-containers`.
