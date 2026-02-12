# Koan 24 – etcd Backup and Restore (System Level)

Goal: Practice etcd snapshot backup/restore workflow by capturing the commands and a snapshot artifact.

## Requirements
- Create an etcd snapshot file at `koans/24-etcd-backup-restore/etcd-snapshot.db`.
- Create a text file `koans/24-etcd-backup-restore/restore-notes.txt` that contains the command you would use to restore (must include `etcdctl snapshot restore`).

## Suggested Steps
1. On a control-plane node (or etcd container), run `etcdctl snapshot save` to a local path.
2. Copy the snapshot into this koan folder as `etcd-snapshot.db`.
3. Write the restore command you would use into `restore-notes.txt`.
4. Verify with `../../verify-koans.sh 24-etcd-backup-restore`.

Notes:
- The exact environment varies by cluster. For Docker Desktop you may need to exec into the etcd pod.
- If your cluster does not expose etcd, treat this as a documentation drill using realistic commands.
