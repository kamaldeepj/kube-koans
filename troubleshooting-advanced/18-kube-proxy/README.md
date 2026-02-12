# Scenario 18 – kube-proxy / Service Routing

## Goal
Ensure ClusterIP Services route traffic correctly.

## Symptoms to observe
- Service has endpoints but traffic fails from a pod.

## What to check
- kube-proxy pods
- iptables/ipvs mode (if accessible)
- Service/Endpoints integrity

## Success criteria
- `curl <service-name>:<port>` from a pod succeeds

## Setup
1. Deploy a simple web app and service (reuse earlier scenarios).
2. Use a client pod to curl the service.

## Task
If traffic fails, check kube-proxy health and investigate service routing.

Note: On Docker Desktop, kube-proxy runs as a daemonset in kube-system.

Lab manifests are under `lab/` for a simulated service routing failure.
