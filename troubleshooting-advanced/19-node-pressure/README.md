# Scenario 19 – Node Pressure / Evictions (System Level)

## Goal
Recognize and resolve pod evictions caused by node pressure.

## Symptoms to observe
- Pods evicted with reason `Evicted`.
- Node shows `MemoryPressure` or `DiskPressure`.

## What to check
- `kubectl describe node` conditions
- `kubectl get events --sort-by=.lastTimestamp`
- Pod QoS and resource requests

## Success criteria
- Node pressure cleared or workloads rescheduled
- Pods run without eviction

## Task
Use this as a diagnostic drill when you see evictions.
