# Koan 11 – Storage with PVC

Goal: Create a PVC and mount it into a Pod.

## Requirements
- PVC named `data-pvc` in namespace `cka-koans`:
  - `accessModes: [ReadWriteOnce]`
  - `resources.requests.storage: 1Gi`
  - Use default StorageClass (leave `storageClassName` empty or omit).
- Pod named `pvc-demo` in namespace `cka-koans`:
  - Uses `busybox:1.36` with `sleep 3600`.
  - Mounts the PVC at `/data`.

## Suggested Steps
1. Fix `pvc.yaml` and `pod.yaml`.
2. Apply with `kubectl apply -f`.
3. Wait for the PVC to be Bound: `kubectl get pvc -n cka-koans`.
4. Verify with `../../verify-koans.sh 11-storage-pvc`.
