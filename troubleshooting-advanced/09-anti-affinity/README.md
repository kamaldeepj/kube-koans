# Scenario 09 – Pod Anti-Affinity Unschedulable

## Goal
Deployment `spread-hard` should schedule 2 pods.

## Symptoms to observe
- One pod Running, second Pending.
- Events show unschedulable due to anti-affinity.

## What to check
- Required vs preferred anti-affinity
- Cluster size (single-node constraints)

## Success criteria
- 2/2 pods Running

## Manifests
Apply `deployment.yaml` and fix the scheduling rule.
