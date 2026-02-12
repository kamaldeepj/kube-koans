# Scenario 03 – PVC Pending

## Goal
Mount a PVC in Pod `pvc-app` in namespace `troubleshoot-adv`.

## Symptoms to observe
- PVC stuck in Pending.
- Pod stuck in Pending due to unbound claim.

## What to check
- StorageClass name
- Available StorageClasses on the cluster

## Success criteria
- PVC is Bound
- Pod is Running

## Manifests
Apply `pvc.yaml` and `pod.yaml`, then fix the storage issue.
