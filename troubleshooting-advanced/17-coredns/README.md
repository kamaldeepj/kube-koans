# Scenario 17 – CoreDNS Failure Drill (System Level)

## Goal
Validate that DNS resolution works inside the cluster.

## Symptoms to observe
- `nslookup kubernetes.default` fails from a pod.

## What to check
- CoreDNS pods health
- CoreDNS ConfigMap
- `kube-system` events/logs

## Success criteria
- From a test pod: `nslookup kubernetes.default` succeeds

## Setup
1. Create a test pod:
   `kubectl run -n troubleshoot-adv dns-test --image=busybox:1.36 --restart=Never -- sleep 3600`
2. Exec into it and run `nslookup kubernetes.default`.

## Task
If DNS fails, identify and fix the root cause (CoreDNS health/config).

Note: This is environment-dependent. Use it as a diagnostic drill.

Lab manifests are under `lab/` for a simulated CoreDNS break/fix.
