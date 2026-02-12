# Koan 02 – Deployment Rollout Control

Goal: Manage a Deployment named `web-koans` that maintains three replicas of `nginx:1.25` in namespace `cka-koans` and uses a zero-downtime rolling update strategy.

## Requirements
- Deployment metadata:
  - `metadata.name`: `web-koans`.
  - Label `app: web-koans`.
- Namespace: `cka-koans`.
- Spec:
  - `replicas: 3`.
  - Rolling update with `maxUnavailable: 0` and `maxSurge: 1`.
  - Pod template must carry `app: web-koans` and run container `nginx:1.25` exposing port 80.

## Suggested Steps
1. Open `deployment.yaml` and replace the placeholders.
2. Apply with `kubectl apply -f koans/02-deployment-rollout/deployment.yaml`.
3. Observe rollout: `kubectl rollout status deployment/web-koans -n cka-koans`.
4. Run `../../verify-koans.sh 02-deployment-rollout`.

When this koan passes you should feel comfortable tweaking replica counts and rollout strategies quickly.
