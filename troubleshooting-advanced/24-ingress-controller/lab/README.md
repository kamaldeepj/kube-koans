# Ingress Controller Simulated Lab

This lab uses an incorrect IngressClass name to simulate a 404/503.

## Steps
1. Ensure an ingress controller is enabled (Docker Desktop or nginx-ingress).
2. Apply the manifests:
   `kubectl apply -f app.yaml`
   `kubectl apply -f ingress.yaml`
3. Test with host header (replace <ingress-ip>):
   `curl -H 'Host: koans.local' http://<ingress-ip>/`
4. Fix the IngressClass name and re-apply.

## Success criteria
- Host-based curl returns content.
