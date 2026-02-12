#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
KOANS_DIR="$SCRIPT_DIR/koans"
DEFAULT_NS="cka-koans"
NAMESPACE="${KOANS_NAMESPACE:-$DEFAULT_NS}"

usage() {
  cat <<USAGE
Usage: ${0##*/} [all|koan-name]

Examples:
  ${0##*/}
  ${0##*/} 02-deployment-rollout
  KOANS_NAMESPACE=custom-ns ${0##*/}
USAGE
}

if ! command -v kubectl >/dev/null 2>&1; then
  echo "kubectl is not installed or not on PATH" >&2
  exit 1
fi

if [[ ! -d "$KOANS_DIR" ]]; then
  echo "No koans directory found at $KOANS_DIR" >&2
  exit 1
fi

ALL_KOANS=()
while IFS= read -r line; do
  ALL_KOANS+=("$line")
done < <(find "$KOANS_DIR" -maxdepth 1 -mindepth 1 -type d | sort)

if [[ ${#ALL_KOANS[@]} -eq 0 ]]; then
  echo "No koans available yet." >&2
  exit 1
fi

TARGETS=()
case "${1:-all}" in
  -h|--help)
    usage
    exit 0
    ;;
  all)
    TARGETS=("${ALL_KOANS[@]}")
    ;;
  *)
    MATCHING=("$(cd "$KOANS_DIR" && find . -maxdepth 1 -type d -name "${1}" -print)")
    if [[ -z "${MATCHING[0]}" ]]; then
      echo "Unknown koan '${1}'. Available koans:" >&2
      for path in "${ALL_KOANS[@]}"; do
        echo "  $(basename "$path")" >&2
      done
      exit 1
    fi
    TARGETS=("$KOANS_DIR/${1}")
    ;;
esac

run_koan() {
  local koan_dir="$1"
  local koan_name
  koan_name="$(basename "$koan_dir")"
  local verify_script="$koan_dir/verify.sh"

  if [[ ! -x "$verify_script" ]]; then
    echo "Skipping $koan_name (missing verify.sh)" >&2
    return 0
  fi

  echo "==> ${koan_name}"
  if KOAN_NAMESPACE="$NAMESPACE" bash "$verify_script"; then
    echo "✅  ${koan_name} passed"
  else
    local status=$?
    echo "❌  ${koan_name} failed" >&2
    exit $status
  fi
}

for target in "${TARGETS[@]}"; do
  run_koan "$target"
  echo
done

echo "All requested koans completed."
