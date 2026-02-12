#!/usr/bin/env bash
set -euo pipefail

ns="${KOAN_NAMESPACE:-cka-koans}"

fail() {
  echo "[05-job-cronjob] $*" >&2
  exit 1
}

if ! kubectl get job pi-job -n "$ns" >/dev/null 2>&1; then
  fail "Job pi-job not found."
fi

completed=$(kubectl get job pi-job -n "$ns" -o jsonpath='{.status.succeeded}')
if [[ "$completed" != "1" ]]; then
  fail "Job pi-job has not completed (succeeded=$completed)."
fi

if ! kubectl get cronjob hello-cron -n "$ns" >/dev/null 2>&1; then
  fail "CronJob hello-cron not found."
fi

schedule=$(kubectl get cronjob hello-cron -n "$ns" -o jsonpath='{.spec.schedule}')
if [[ "$schedule" != "*/5 * * * *" ]]; then
  fail "CronJob schedule is '$schedule' (expected */5 * * * *)."
fi

restart=$(kubectl get cronjob hello-cron -n "$ns" -o jsonpath='{.spec.jobTemplate.spec.template.spec.restartPolicy}')
if [[ "$restart" != "OnFailure" ]]; then
  fail "CronJob restartPolicy is '$restart' (expected OnFailure)."
fi

echo "Job and CronJob look good."
