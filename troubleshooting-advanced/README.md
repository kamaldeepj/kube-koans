# Advanced Troubleshooting Module

These scenarios are closer to exam-style troubleshooting. Each one involves multiple objects and subtle failure modes. There is no automated verification; use the success criteria in each README.

Prereq (once):
`kubectl create namespace troubleshoot-adv`

Suggested workflow:
1. Apply the manifests.
2. Use `kubectl get`, `describe`, `logs`, `events` and `kubectl rollout status`.
3. Fix the manifests and re-apply.
4. Validate against the success criteria.
5. Clean up after each scenario.

Scenarios:
- 01-rollout-stuck
- 02-scheduling-pending
- 03-pvc-pending
- 04-rbac-deny
- 05-networkpolicy-block
- 06-configmap-subpath
- 07-dns-readiness
- 08-liveness-kills
- 09-anti-affinity
- 10-missing-serviceaccount
- 11-service-port-mismatch
- 12-oomkill
- 13-taint-pending
- 14-pvc-accessmode
- 15-sa-token
- 16-bad-configmap-key
- 17-coredns
- 18-kube-proxy
- 19-node-pressure
- 20-controlplane-staticpod
- 21-kubeadm-upgrade
- 22-etcd-restore-live
- 23-networkpolicy-egress
- 24-ingress-controller
