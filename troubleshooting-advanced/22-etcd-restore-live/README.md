# Scenario 22 – Live etcd Restore (System Level)

## Goal
Restore etcd from a snapshot in a lab environment.

## What to check
- Snapshot file, endpoints, certificates
- etcd data-dir paths

## Suggested Steps (High Level)
1. Stop kube-apiserver (if required by lab)
2. `etcdctl snapshot restore <snapshot> --data-dir <dir>`
3. Update static pod manifest to use restored data-dir
4. Restart kubelet/control-plane

## Success criteria
- Cluster returns to healthy state
- Restored objects are present

Note: This requires a lab that exposes etcd and control plane access.
