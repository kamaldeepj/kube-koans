# Scenario 16 – Bad ConfigMap Key

## Goal
Pod `app-config` should start with config mounted.

## Symptoms to observe
- Pod stuck in `CreateContainerConfigError`.
- Events mention missing key.

## What to check
- ConfigMap keys
- `items` mapping and key names

## Success criteria
- Pod Running

## Manifests
Apply `configmap.yaml` and `pod.yaml`, then fix the key mismatch.
