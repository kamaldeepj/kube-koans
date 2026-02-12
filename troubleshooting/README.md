# Troubleshooting Module

This module contains deliberately broken manifests. Your job is to diagnose the issue using `kubectl describe`, `kubectl logs`, and `kubectl get events`, then fix the manifest until the workload behaves as expected.

Each scenario is independent and does not have automated verification. Use the checklist in each scenario’s README to know when you’re done.

Prereq (once):
`kubectl create namespace troubleshoot`

Suggested workflow:
1. Apply the manifest(s).
2. Observe symptoms (status, events, logs).
3. Identify the root cause.
4. Fix the YAML and re-apply.
5. Verify using the success criteria in the README.

You should always clean up afterwards:
`kubectl delete -f <manifest>`
