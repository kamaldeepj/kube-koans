#!/usr/bin/env bash
set -euo pipefail

BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SNAPSHOT="$BASE_DIR/etcd-snapshot.db"
NOTES="$BASE_DIR/restore-notes.txt"

fail() {
  echo "[24-etcd-backup-restore] $*" >&2
  exit 1
}

if [[ ! -f "$SNAPSHOT" ]]; then
  fail "Snapshot file not found at $SNAPSHOT."
fi

if [[ ! -s "$SNAPSHOT" ]]; then
  fail "Snapshot file is empty."
fi

if [[ ! -f "$NOTES" ]]; then
  fail "restore-notes.txt not found."
fi

if ! rg -q "etcdctl\s+snapshot\s+restore" "$NOTES" 2>/dev/null; then
  if ! grep -Eq "etcdctl[[:space:]]+snapshot[[:space:]]+restore" "$NOTES"; then
    fail "restore-notes.txt must include 'etcdctl snapshot restore'."
  fi
fi

echo "etcd backup/restore artifacts look good."
