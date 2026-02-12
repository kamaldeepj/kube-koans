# Scenario 08 – Liveness Probe Killing Pods

## Goal
Deployment `liveness-demo` should stay Running without restarts.

## Symptoms to observe
- Pods keep restarting (`RESTARTS` increments).
- Liveness probe failures in events.

## What to check
- Liveness probe path/port
- Container start behavior

## Success criteria
- Pods stay Running with 0 restarts

## Manifests
Apply `deployment.yaml` and fix the liveness probe.
