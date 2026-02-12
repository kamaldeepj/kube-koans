#!/usr/bin/env bash
set -euo pipefail

BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
FILE="$BASE_DIR/readyz.txt"

fail() {
  echo "[25-control-plane-health] $*" >&2
  exit 1
}

if [[ ! -f "$FILE" ]]; then
  fail "readyz.txt not found. Run kubectl get --raw='/readyz?verbose' > readyz.txt."
fi

if ! rg -q "\bok\b" "$FILE" 2>/dev/null; then
  if ! grep -Eq "\bok\b" "$FILE"; then
    fail "readyz.txt does not contain 'ok'."
  fi
fi

echo "Control plane readiness captured."
