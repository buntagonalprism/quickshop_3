#!/usr/bin/env bash
# Claude Code hooks that keep generated code up to date and check the code before Claude finishes.
# Configured in .claude/settings.json; each subcommand reads the hook's JSON input on stdin.
#
#   tool/claude_hooks.sh session-start   Start `build_runner watch` in the background, unless one is
#                                        already running for this checkout.
#   tool/claude_hooks.sh prompt-submit   Mark the start of a turn, so `stop` knows which files changed.
#   tool/claude_hooks.sh stop            If Dart files changed this turn, wait for the watcher to
#                                        finish building, then run the analyzer. Blocks Claude from
#                                        stopping (exit 2) on a failed build or any analyzer issue.
#   tool/claude_hooks.sh session-end     Stop the watcher if this session started it.
#
# The watcher's output is logged to .dart_tool/claude_hooks/watch.log.
set -euo pipefail

cd "$(dirname "$0")/.."
dir=.dart_tool/claude_hooks
log=$dir/watch.log
pid_file=$dir/watch.pid
owner_file=$dir/watch.owner
turn_marker=$dir/turn_start
block_count_file=$dir/stop_blocks
mkdir -p "$dir"

# Blocking the same stop more than this many times in a row lets Claude stop anyway, so a problem it
# can't fix doesn't trap it in a loop.
max_blocks=3

input=$(cat)
session_id=$(jq -r '.session_id // ""' <<< "$input")

watcher_running() {
  [[ -f $pid_file ]] && kill -0 "$(cat "$pid_file")" 2>/dev/null
}

# A build_runner watch started outside these hooks for this checkout, e.g. in an IDE terminal.
external_watcher() {
  local pid
  for pid in $(pgrep -f '[b]uild_runner watch' || true); do
    if [[ $(readlink "/proc/$pid/cwd" 2>/dev/null) == "$PWD" ]] && ! { [[ -f $pid_file ]] && [[ $pid == "$(cat "$pid_file")" ]]; }; then
      return 0
    fi
  done
  return 1
}

start_watcher() {
  : > "$log"
  # setsid gives the watcher its own process group, so stopping it also stops the Dart process that
  # fvm starts, and it isn't killed when the hook exits.
  setsid fvm dart run build_runner watch --delete-conflicting-outputs < /dev/null > "$log" 2>&1 &
  echo $! > "$pid_file"
  echo "$session_id" > "$owner_file"
}

stop_watcher() {
  if watcher_running; then
    kill -- "-$(cat "$pid_file")" 2>/dev/null || true
  fi
  rm -f "$pid_file" "$owner_file"
}

# Newest modification time of the Dart sources build_runner reads, excluding generated files.
newest_source_mtime() {
  find lib -name '*.dart' ! -name '*.g.dart' ! -name '*.freezed.dart' ! -name '*.drift.dart' -printf '%T@\n' |
    sort -n | tail -1
}

# Waits until the watcher has finished a build that started after the last source change. Prints the
# last build's result line, or returns 1 on timeout.
wait_for_watcher() {
  local status last_line log_mtime idle
  for _ in $(seq 480); do
    last_line=$(sed 's/\x1b\[[0-9;]*[A-Za-z]//g' "$log" | grep -E 'Starting build|Built with|Failed to build' | tail -1 || true)
    log_mtime=$(stat -c '%.9Y' "$log")
    idle=$(echo "$(date +%s.%N) - $log_mtime" | bc)
    # Quiet for 2 seconds after a finished build, so a change made during that build has had time to
    # start the next one.
    if [[ $last_line =~ (Built\ with|Failed\ to\ build) ]] &&
      (($(echo "$log_mtime > $(newest_source_mtime)" | bc))) &&
      (($(echo "$idle > 2" | bc))); then
      echo "$last_line"
      return 0
    fi
    sleep 0.5
  done
  return 1
}

# Prints the errors and warnings from the last build in the watcher's log.
last_build_errors() {
  sed 's/\x1b\[[0-9;]*[A-Za-z]//g' "$log" | awk '/Starting build/ { block = "" } { block = block $0 "\n" } END { printf "%s", block }' |
    grep -v -E ' (skipped|same|no-op|output)|inputs;|Starting build|^\s*$' || true
}

block() {
  local count
  count=$(($(cat "$block_count_file" 2>/dev/null || echo 0) + 1))
  echo "$count" > "$block_count_file"
  if ((count > max_blocks)); then
    rm -f "$block_count_file"
    jq -n --arg msg "The stop check still fails after $max_blocks attempts. See: $1" '{systemMessage: $msg}'
    exit 0
  fi
  echo "$1" >&2
  exit 2
}

case "${1:-}" in
  session-start)
    if watcher_running; then
      echo "build_runner watch is already running for this checkout, so generated code stays up to date. Its log is $log."
    elif external_watcher; then
      echo "build_runner watch is already running for this checkout outside Claude Code, so generated code stays up to date."
    else
      start_watcher
      echo "Started build_runner watch, so generated code stays up to date without running build_runner. Its log is $log."
    fi
    ;;
  prompt-submit)
    touch "$turn_marker"
    rm -f "$block_count_file"
    ;;
  stop)
    # Skip turns that didn't change any Dart files, such as discussion
    if [[ -f $turn_marker ]] && [[ -z $(find lib test -name '*.dart' -newer "$turn_marker" -print -quit) ]]; then
      exit 0
    fi
    if ! external_watcher; then
      if ! watcher_running; then
        start_watcher
      fi
      if ! result=$(wait_for_watcher); then
        block "build_runner watch hasn't finished building after 4 minutes. Check $log."
      fi
      if [[ $result == *"Failed to build"* ]]; then
        block "Code generation failed. Fix these errors, then stop again (build_runner watch rebuilds automatically):
$(last_build_errors)"
      fi
    fi
    if ! analysis=$(fvm flutter analyze --fatal-infos 2>&1); then
      block "flutter analyze --fatal-infos found issues. Fix them, then stop again:
$(grep -E '^\s*(error|warning|info) •' <<< "$analysis")"
    fi
    rm -f "$block_count_file"
    ;;
  session-end)
    if [[ -f $owner_file ]] && [[ $(cat "$owner_file") == "$session_id" ]]; then
      stop_watcher
    fi
    ;;
  *)
    sed -n '2,13p' "$0" | sed 's/^# \{0,1\}//'
    exit 1
    ;;
esac
