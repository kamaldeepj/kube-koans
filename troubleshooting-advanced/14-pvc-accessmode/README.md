# Scenario 14 – PVC AccessMode Mismatch

## Goal
Pod `pvc-ro` should mount its PVC and run.

## Symptoms to observe
- PVC Pending or Bound but Pod stuck in Pending/ContainerCreating.

## What to check
- AccessModes and how the volume is used
- Cluster StorageClass capabilities

## Success criteria
- PVC is Bound
- Pod is Running

## Manifests
Apply `pvc.yaml` and `pod.yaml`, then fix the access mode problem.
