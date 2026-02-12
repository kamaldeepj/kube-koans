# Koan 23 – Kubeconfig Context Hygiene

Goal: Ensure your current kubectl context uses namespace `cka-koans` by default.

## Requirements
- Current context's default namespace is `cka-koans`.

## Suggested Steps
1. Check your context: `kubectl config view --minify`.
2. Set the namespace on the current context:
   `kubectl config set-context --current --namespace=cka-koans`
3. Verify with `../../verify-koans.sh 23-kubeconfig-context`.
