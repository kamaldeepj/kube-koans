# Koan 04 – ConfigMaps and Secrets

Goal: Provide configuration and a secret to a Pod using environment variables.

## Requirements
- Create a ConfigMap named `app-config` in namespace `cka-koans` with key `APP_MODE` set to `practice`.
- Create a Secret named `app-secret` in namespace `cka-koans` with key `PASSWORD` set to `cka`.
- Create a Pod named `config-demo` in namespace `cka-koans` that:
  - Uses image `busybox:1.36` and runs `sleep 3600`.
  - Exposes env var `APP_MODE` from the ConfigMap.
  - Exposes env var `PASSWORD` from the Secret.

## Suggested Steps
1. Fill in `configmap.yaml`, `secret.yaml`, and `pod.yaml`.
2. Apply them with `kubectl apply -f`.
3. Verify with `../../verify-koans.sh 04-configmap-secret`.
