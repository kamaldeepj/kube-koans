# Koan 19 – NodePort Service

Goal: Expose a Deployment using a NodePort Service.

## Requirements
- Deployment `nodeport-demo` in namespace `cka-koans`:
  - Image `nginx:1.25`.
  - `replicas: 2`.
- Service `nodeport-demo` in namespace `cka-koans`:
  - `type: NodePort`.
  - `port: 80`, `targetPort: 80`, `nodePort: 30080`.
  - Selector `app=nodeport-demo`.

## Suggested Steps
1. Fix `deployment.yaml` and `service.yaml`.
2. Apply with `kubectl apply -f`.
3. Verify with `../../verify-koans.sh 19-service-nodeport`.
