# Koan 01 – Pod Basics

Goal: Run a single Pod named `hello-koans` in namespace `cka-koans` using the `nginx:1.25` image so that it reaches the `Running` phase.

## Requirements
- Pod metadata:
  - `metadata.name` must be `hello-koans`.
  - Include a label `app: pod-basics`.
- Namespace: `cka-koans` (create it once if necessary).
- Container:
  - Name it `nginx`.
  - Image `nginx:1.25`.
  - Expose container port `80`.
- Restart policy should stay `Always` (the default for Pods managed by `kubectl`).

## Suggested Steps
1. Inspect `pod.yaml` in this directory—they deliberately contain placeholders.
2. Replace the placeholders so the manifest matches the requirements.
3. Apply the manifest: `kubectl apply -f koans/01-pod-basics/pod.yaml`.
4. Confirm: `kubectl get pods -n cka-koans`.
5. Run `../../verify-koans.sh 01-pod-basics` to validate.

Move on when the verification succeeds.
