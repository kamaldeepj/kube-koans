# Scenario 21 – kubeadm Upgrade (System Level)

## Goal
Practice the kubeadm upgrade workflow.

## What to check
- `kubeadm version` and `kubelet`/`kubectl` versions
- Upgrade plan output

## Suggested Steps (High Level)
1. `kubeadm upgrade plan`
2. `kubeadm upgrade apply <version>` (control plane)
3. Upgrade kubelet and restart

## Success criteria
- Versions match expected target
- Control plane healthy

Note: This is a procedural drill; on Docker Desktop you may not run kubeadm.
