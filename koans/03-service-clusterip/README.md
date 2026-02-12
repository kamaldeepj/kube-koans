# Koan 03 – ClusterIP Service & Endpoints

Goal: Front the `web-koans` Deployment with a stable ClusterIP Service named `web-koans` in namespace `cka-koans` so that it exposes port 80 for every pod selected by `app=web-koans`.

## Requirements
- Service metadata:
  - `metadata.name`: `web-koans`.
  - Label `app: web-koans`.
- Namespace: `cka-koans`.
- Spec:
  - `type: ClusterIP`.
  - Single port mapping `port: 80` → `targetPort: 80` with protocol TCP.
  - Selector must match the Deployment pods (`app: web-koans`).
- Result: `kubectl get endpoints web-koans -n cka-koans` should show the same number of addresses as Deployment replicas (currently 3).

## Suggested Steps
1. Ensure Koan 02 Deployment is passing.
2. Fix `service.yaml` to satisfy the requirements.
3. Apply the manifest, then inspect: `kubectl get svc,ep web-koans -n cka-koans`.
4. Run `../../verify-koans.sh 03-service-clusterip`.

Once this koan passes you have a full workload + Service pipeline.
