# Koan 05 – Jobs and CronJobs

Goal: Create a one-shot Job and a scheduled CronJob in namespace `cka-koans`.

## Requirements
- Job named `pi-job` that:
  - Uses `busybox:1.36`.
  - Runs `echo done` and completes successfully.
- CronJob named `hello-cron` that:
  - Schedules every 5 minutes (`*/5 * * * *`).
  - Runs `busybox:1.36` with command `echo hello`.
  - Uses `restartPolicy: OnFailure`.

## Suggested Steps
1. Fix `job.yaml` and `cronjob.yaml`.
2. Apply them with `kubectl apply -f`.
3. For the Job, wait for completion: `kubectl wait --for=condition=complete job/pi-job -n cka-koans`.
4. Run `../../verify-koans.sh 05-job-cronjob`.
