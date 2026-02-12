# NetworkPolicy Egress Simulated Lab

This lab blocks all egress and DNS, then you fix it.

## Steps
1. Apply the manifests:
   `kubectl apply -f pod.yaml`
   `kubectl apply -f networkpolicy.yaml`
2. Observe failure:
   `kubectl exec -n troubleshoot-adv egress-client -- nslookup kubernetes.default`
   `kubectl exec -n troubleshoot-adv egress-client -- curl -sS https://example.com`
3. Fix the NetworkPolicy to allow DNS (UDP/TCP 53) and HTTPS (TCP 443).

## Success criteria
- Both DNS and HTTPS succeed from the pod.

Note: Requires CNI enforcement of NetworkPolicy.
