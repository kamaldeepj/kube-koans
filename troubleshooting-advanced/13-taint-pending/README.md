# Scenario 13 – Taint Blocks Scheduling

## Goal
Deployment `taint-demo` should schedule 1 pod.

## Setup
1. Pick your node name: `kubectl get nodes`.
2. Taint it: `kubectl taint nodes <node> dedicated=training:NoSchedule`.
3. Apply the manifest.

## Symptoms to observe
- Pod stuck in Pending.
- Events show taint/toleration mismatch.

## What to check
- Node taints
- Pod tolerations

## Success criteria
- Pod is Running
- You remove the taint when done: `kubectl taint nodes <node> dedicated=training:NoSchedule-`

## Manifests
Apply `deployment.yaml` and fix the scheduling.
