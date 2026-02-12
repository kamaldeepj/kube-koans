# Koan 13 – Ingress Resource

Goal: Define an Ingress resource that routes host `koans.local` to the `web-koans` Service on port 80.

## Requirements
- Ingress named `web-ingress` in namespace `cka-koans`.
- Uses `networking.k8s.io/v1` and `ingressClassName: nginx`.
- Rule: host `koans.local`, path `/`, pathType `Prefix`, backend `service.name: web-koans`, `service.port.number: 80`.

Note: This koan validates the resource spec. You may need to enable an ingress controller (Docker Desktop or nginx-ingress) to test actual routing.

## Suggested Steps
1. Fix `ingress.yaml`.
2. Apply with `kubectl apply -f`.
3. Verify with `../../verify-koans.sh 13-ingress`.
