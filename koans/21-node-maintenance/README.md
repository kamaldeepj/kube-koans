# Koan 21 – Node Maintenance (cordon)

Goal: Practice node maintenance by cordoning a labeled node.

## Requirements
- Choose a node and label it `koans.cka/maintenance=true`.
- Cordon that node (unschedulable=true).
- The verifier checks that a node with that label is cordoned.

## Suggested Steps
1. Find your node name: `kubectl get nodes`.
2. Label it: `kubectl label node <node> koans.cka/maintenance=true`.
3. Cordon it: `kubectl cordon <node>`.
4. Verify with `../../verify-koans.sh 21-node-maintenance`.
5. After passing, uncordon it: `kubectl uncordon <node>`.
