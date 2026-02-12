# kube-proxy / Service Routing Simulated Lab

This lab simulates service routing failure using a port mismatch. It does not alter kube-proxy itself.

## Steps
1. Apply the manifests:
   `kubectl apply -f server.yaml`
   `kubectl apply -f client.yaml`
2. Confirm endpoints exist:
   `kubectl get endpoints web -n troubleshoot-adv`
3. Observe failure:
   `kubectl exec -n troubleshoot-adv client -- curl -sS web:80`
4. Fix the Service targetPort and re-apply.

## Success criteria
- curl succeeds after fixing the Service.
