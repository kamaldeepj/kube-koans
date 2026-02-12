# Koan 25 – Control Plane Health (System Level)

Goal: Capture evidence that the control plane is healthy.

## Requirements
- Create a file `koans/25-control-plane-health/readyz.txt` that contains the output of:
  `kubectl get --raw='/readyz?verbose'`
- The output should include at least one line with `ok`.

## Suggested Steps
1. Run the command and redirect output:
   `kubectl get --raw='/readyz?verbose' > koans/25-control-plane-health/readyz.txt`
2. Verify with `../../verify-koans.sh 25-control-plane-health`.
