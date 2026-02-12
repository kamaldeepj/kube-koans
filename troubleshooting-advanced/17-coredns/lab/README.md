# CoreDNS Simulated Lab

This lab intentionally breaks DNS by editing CoreDNS ConfigMap. Use only in a disposable cluster.

## Steps
1. Backup CoreDNS ConfigMap:
   `kubectl -n kube-system get configmap coredns -o yaml > coredns.backup.yaml`
2. Apply the broken ConfigMap:
   `kubectl apply -f coredns-broken.yaml`
3. Verify DNS failure from a test pod:
   `kubectl run -n troubleshoot-adv dns-test --image=busybox:1.36 --restart=Never -- sleep 3600`
   `kubectl exec -n troubleshoot-adv dns-test -- nslookup kubernetes.default`
4. Fix CoreDNS by restoring:
   `kubectl apply -f coredns.backup.yaml`

## Success criteria
- DNS works after restore.
