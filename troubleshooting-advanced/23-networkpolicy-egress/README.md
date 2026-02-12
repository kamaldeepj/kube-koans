# Scenario 23 – NetworkPolicy Egress Block

## Goal
Allow a pod to reach an external endpoint (or another namespace) by fixing egress policy.

## Symptoms to observe
- Pod cannot reach DNS or external IPs.

## What to check
- Egress NetworkPolicy rules
- DNS resolution requirements

## Success criteria
- `curl https://example.com` (or internal target) succeeds from the pod

## Task
Create a restrictive egress policy, observe the failure, then add required egress rules.

Lab manifests are under `lab/` for a simulated egress block.
