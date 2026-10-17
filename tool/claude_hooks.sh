#!/usr/bin/env bash
# Claude Code hooks that keep generated code up to date and check the code before Claude finishes.
# Configured in .claude/settings.json; each subcommand reads the hook's JSON input on stdin.
#
#   tool/claude_hooks.sh session-start   Put the FVM-pinned SDK first on PATH for Claude's Bash
#                                        commands, and start `build_runner watch` in the background,
#                                        unless one is already running for this checkout.
#   tool/claude_hooks.sh prompt-submit   Mark the start of a turn, so `stop` knows which files changed.
#   tool/claude_hooks.sh format-file     Format a Dart file after Claude edits or writes it.
#   tool/claude_hooks.sh stop            If Dart files changed this turn, format them, wait for the
#                                        watcher to finish building, then run the analyzer. Blocks
#                                        Claude from stopping (exit 2) if formatting changed a file, the
#                                        build failed or the analyzer found any issue.
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

# A build_runner watch started outside these hooks for this checkout, e.g. in an IDE terminal. The
# hooks' own watcher is recognised by its process group, which setsid makes its saved PID.
external_watcher() {
  local pid own_group=
  [[ -f $pid_file ]] && own_group=$(cat "$pid_file")
  for pid in $(pgrep -f '[b]uild_runner.*watch' || true); do
    if [[ $(readlink "/proc/$pid/cwd" 2>/dev/null) == "$PWD" ]] &&
      [[ $(ps -o pgid= -p "$pid" | tr -d ' ') != "$own_group" ]]; then
      return 0
    fi
  done
  return 1
}

start_watcher() {
  : > "$log"
  # setsid gives the watcher its own process group, so stopping it also stops the Dart processes it
  # starts, and it isn't killed when the hook exits.
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

# Dart files that aren't generated, under the given directories, with any extra find conditions.
source_files() {
  local dirs=()
  while [[ $# -gt 0 && $1 != -* ]]; do
    dirs+=("$1")
    shift
  done
  find "${dirs[@]}" -name '*.dart' ! -name '*.g.dart' ! -name '*.freezed.dart' ! -name '*.drift.dart' "$@"
}

is_generated() {
  [[ $1 == *.g.dart || $1 == *.freezed.dart || $1 == *.drift.dart ]]
}

# Newest modification time of the Dart sources build_runner reads.
newest_source_mtime() {
  source_files lib -printf '%T@\n' | sort -n | tail -1
}

# Waits until the watcher has finished a build that started after the last source change. Prints the
# last build's result line, or returns 1 on timeout.
wait_for_watcher() {
  local last_line log_mtime idle
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
    # Claude Code loads this file before each Bash command, so plain `flutter` and `dart` run the
    # pinned SDK, as they do in a VS Code terminal. .fvm/flutter_sdk is FVM's link to that SDK.
    if [[ -n ${CLAUDE_ENV_FILE:-} ]]; then
      echo "PATH=\"$PWD/.fvm/flutter_sdk/bin:\$PATH\"" >> "$CLAUDE_ENV_FILE"
    fi
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
  format-file)
    file=$(jq -r '.tool_input.file_path // ""' <<< "$input")
    # Only this checkout's Dart sources. A file that doesn't parse yet is left alone.
    if [[ $file == "$PWD"/*.dart ]] && ! is_generated "$file"; then
      fvm dart format "$file" > /dev/null 2>&1 || true
    fi
    ;;
  stop)
    # Skip turns that didn't change any Dart files, such as discussion
    if [[ -f $turn_marker ]]; then
      mapfile -t changed < <(source_files lib test -newer "$turn_marker")
    else
      changed=()
      while IFS= read -r file; do
        [[ -f $file ]] && ! is_generated "$file" && changed+=("$file")
      done < <(git ls-files --modified --others --exclude-standard -- '*.dart')
    fi
    if [[ ${#changed[@]} -eq 0 ]]; then
      exit 0
    fi
    problems=()

    # Format first, as reformatting a provider changes its generated code. Edits made with the Edit
    # and Write tools are already formatted, but not those made through Bash.
    formatted=$(fvm dart format "${changed[@]}" 2>/dev/null | sed -n 's/^Formatted \(.*\.dart\)$/\1/p' || true)
    if [[ -n $formatted ]]; then
      problems+=("dart format reformatted these files. Check they're included in any commit you've made:
$formatted")
    fi

    build_failed=false
    if ! external_watcher; then
      if ! watcher_running; then
        start_watcher
      fi
      if ! result=$(wait_for_watcher); then
        block "build_runner watch hasn't finished building after 4 minutes. Check $log."
      fi
      if [[ $result == *"Failed to build"* ]]; then
        build_failed=true
        problems+=("Code generation failed. Fix these errors, and build_runner watch will rebuild automatically:
$(last_build_errors)")
      fi
    fi

    # A failed build leaves generated code missing, so the analyzer would only repeat its errors.
    if ! $build_failed && ! analysis=$(fvm flutter analyze --fatal-infos 2>&1); then
      problems+=("flutter analyze --fatal-infos found issues. Fix them:
$(grep -E '^\s*(error|warning|info) •' <<< "$analysis")")
    fi

    if [[ ${#problems[@]} -gt 0 ]]; then
      # Command substitution drops trailing newlines, so the separator is added outside it
      block "$(printf '%s\n\n' "${problems[@]}")"$'\n\nThen stop again.'
    fi
    rm -f "$block_count_file"
    ;;
  session-end)
    if [[ -f $owner_file ]] && [[ $(cat "$owner_file") == "$session_id" ]]; then
      stop_watcher
    fi
    ;;
  *)
    awk 'NR > 1 && /^#/ { sub(/^# ?/, ""); print; next } NR > 1 { exit }' "$0"
    exit 1
    ;;
esac
