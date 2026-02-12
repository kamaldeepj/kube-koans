# Kubernetes Koans Tutor

This repository gives you a Ruby Koans–style workflow for practicing Certified Kubernetes Administrator (CKA) scenarios. Each koan is a bite-sized YAML manifest that intentionally contains gaps. You edit the manifest, apply it to your cluster with `kubectl`, and then run an automated checker to confirm the state of the cluster.

## Prerequisites
- An accessible Kubernetes cluster (Docker Desktop, kind, minikube, etc.).
- `kubectl` configured to point at that cluster.
- Basic familiarity with editing YAML (any editor works).

All koans assume you are working in the namespace `cka-koans`. Create it once before starting:

```bash
kubectl create namespace cka-koans
```

If it already exists you can safely ignore the error.

## Workflow
1. Pick a koan directory under `koans/` and read its `README.md` for context.
2. Edit the provided manifest(s) to satisfy the acceptance criteria.
3. Apply your manifest(s) to the cluster with `kubectl apply -f <file>`.
4. Run `./verify-koans.sh <koan>` (or `all`) to check whether the cluster matches the expected state.
5. Iterate until all koans pass.

## Available Koans
| Koan | Focus |
| --- | --- |
| `01-pod-basics` | Pods, images, restart policy |
| `02-deployment-rollout` | Deployments, replica scaling, rollout strategy |
| `03-service-clusterip` | Services, selectors, endpoints |
| `04-configmap-secret` | ConfigMaps, Secrets, env wiring |
| `05-job-cronjob` | Jobs and CronJobs |
| `06-resources-limits` | Requests and limits |
| `17-probes` | Liveness and readiness probes |
| `18-init-containers` | Init containers + emptyDir |
| `14-daemonset` | DaemonSets |
| `15-statefulset-headless` | StatefulSets + headless Service |
| `16-pdb` | PodDisruptionBudgets |
| `07-node-affinity` | Scheduling with node affinity |
| `08-taints-tolerations` | Taints and tolerations |
| `20-topology-spread` | Topology spread constraints |
| `22-priorityclass` | PriorityClass scheduling |
| `11-storage-pvc` | PersistentVolumeClaims and mounts |
| `19-service-nodeport` | NodePort Services |
| `12-networkpolicy` | NetworkPolicy ingress rules |
| `13-ingress` | Ingress resource spec |
| `10-rbac` | ServiceAccounts, Roles, RoleBindings |
| `09-security-context` | Pod and container security context |
| `21-node-maintenance` | Node cordon practice |
| `23-kubeconfig-context` | Kubeconfig default namespace |
| `24-etcd-backup-restore` | etcd snapshot + restore notes |
| `25-control-plane-health` | Control plane readyz capture |

Add more koans by copying a directory, defining new acceptance criteria, and writing a `verify.sh` script.

## Verification Script
`verify-koans.sh` orchestrates the checks. It looks for a `verify.sh` script inside each koan directory and runs it. Each verifier returns zero on success and non-zero on failure.

```bash
./verify-koans.sh                   # run every koan in order
./verify-koans.sh 02-deployment-rollout
```

Each run prints ✅ on success or ❌ with a helpful error message if something is missing.

Happy hacking!

## Troubleshooting Modules
These are separate from koans and intentionally broken. There is no automated verification.

- `troubleshooting/` basic troubleshooting drills
- `troubleshooting-advanced/` multi-object, exam-style troubleshooting
