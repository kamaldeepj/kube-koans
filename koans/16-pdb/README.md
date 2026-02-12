# Koan 16 – PodDisruptionBudget

Goal: Protect the `web-koans` deployment with a PodDisruptionBudget.

## Requirements
- PodDisruptionBudget named `web-pdb` in namespace `cka-koans`.
- Selector `app=web-koans`.
- `minAvailable: 2`.

Note: This koan requires Koan 02 (web-koans deployment) to exist.

## Suggested Steps
1. Fix `pdb.yaml`.
2. Apply with `kubectl apply -f`.
3. Verify with `../../verify-koans.sh 16-pdb`.
