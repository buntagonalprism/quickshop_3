#!/usr/bin/env bash
# Runs the app on web in headless Chrome for automated UI testing, and controls the running app.
#
#   tool/run_web.sh start [flutter run args...]  Start the app. Blocks until it exits, so run it in
#                                                the background. Extra arguments are passed to
#                                                `flutter run`, e.g. another --dart-define-from-file.
#   tool/run_web.sh wait                         Wait until the app is ready, then print the VM
#                                                service URI to connect Marionette to.
#   tool/run_web.sh restart                      Hot restart, and wait until it has finished.
#   tool/run_web.sh reload                       Hot reload, and wait until it has finished.
#   tool/run_web.sh quit                         Stop the app and close Chrome.
#
# `flutter run` reads its commands (R, r, q) from a named pipe, since it runs in the background
# without a terminal. Its output goes to the log file printed on start.
set -euo pipefail

dir="${TMPDIR:-/tmp}/quickshop_web"
pipe="$dir/stdin"
log="$dir/flutter_run.log"
pid_file="$dir/pid"

is_running() {
  [[ -f $pid_file ]] && kill -0 "$(cat "$pid_file")" 2>/dev/null
}

require_running() {
  if ! is_running; then
    echo "The app isn't running. Start it with: tool/run_web.sh start" >&2
    exit 1
  fi
}

# Sends a hot reload or restart command, then waits for flutter run to report the result. On
# failure, prints the output since the command was sent, which includes any compile errors.
reload_or_restart() {
  local command=$1 success=$2
  require_running
  local start_line
  start_line=$(($(wc -l < "$log") + 1))
  echo "$command" > "$pipe"
  for _ in $(seq 120); do
    local output
    output=$(tail -n "+$start_line" "$log")
    if grep -q "$success" <<< "$output"; then
      grep -m1 "$success" <<< "$output"
      exit 0
    fi
    if grep -qE 'Try again after fixing|Hot (reload|restart) (failed|rejected)' <<< "$output" || ! is_running; then
      echo "$output" >&2
      exit 1
    fi
    sleep 1
  done
  echo "Timed out waiting for the result. See $log" >&2
  exit 1
}

case "${1:-}" in
  start)
    shift
    if is_running; then
      echo "The app is already running. Stop it first with: tool/run_web.sh quit" >&2
      exit 1
    fi
    mkdir -p "$dir"
    rm -f "$pipe" "$log"
    mkfifo "$pipe"
    echo $$ > "$pid_file"
    echo "Logging to $log"
    # Opening the pipe for reading and writing keeps it open between commands, so `flutter run`
    # never sees the end of its input.
    exec 3<>"$pipe"
    cd "$(dirname "$0")/.."
    CHROME_EXECUTABLE="$PWD/tool/headless_chrome.sh" fvm flutter run -d chrome \
      --dart-define-from-file=settings/app_secrets_dev.json \
      --dart-define-from-file=settings/app_settings_dev.json \
      "$@" <&3 > "$log" 2>&1
    ;;
  wait)
    require_running
    for _ in $(seq 180); do
      uri=$(grep -ao 'Debug service listening on ws://[^ ]*' "$log" 2>/dev/null | head -1 | sed 's/.* //' || true)
      if [[ -n $uri ]]; then
        echo "$uri"
        exit 0
      fi
      if ! is_running; then
        echo "The app exited before starting. See $log" >&2
        exit 1
      fi
      sleep 1
    done
    echo "Timed out waiting for the app to start. See $log" >&2
    exit 1
    ;;
  restart) reload_or_restart R 'Restarted application' ;;
  reload) reload_or_restart r 'Reloaded' ;;
  quit)
    require_running
    echo q > "$pipe"
    ;;
  *)
    sed -n '2,12p' "$0" | sed 's/^# \{0,1\}//'
    exit 1
    ;;
esac
