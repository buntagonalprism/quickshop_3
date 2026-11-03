#!/usr/bin/env bash
# Claude Code hooks that keep generated code up to date and check the code before Claude finishes.
# Configured in .claude/settings.json; each subcommand reads the hook's JSON input on stdin.
#
#   tool/claude_hooks.sh session-start   Put the FVM-pinned SDK first on PATH for Claude's Bash
#                                        commands.
#   tool/claude_hooks.sh prompt-submit   Mark the start of a turn, so `stop` knows which files changed.
#   tool/claude_hooks.sh format-file     Format a Dart file after Claude edits or writes it.
#   tool/claude_hooks.sh stop            If Dart files changed this turn, format them, run
#                                        `build_runner build`, then run the analyzer. Blocks Claude
#                                        from stopping (exit 2) if formatting changed a file, the
#                                        build failed or the analyzer found any issue.
#
# The build's output is logged to .dart_tool/claude_hooks/build.log.
#
# Code is generated once when Claude stops, rather than by `build_runner watch`, because a watcher
# holds about 1.5 GB for as long as the session is open, and several sessions can be open at once
# in different worktrees.
set -euo pipefail

cd "$(dirname "$0")/.."

dir=.dart_tool/claude_hooks
log=$dir/build.log
turn_marker=$dir/turn_start
block_count_file=$dir/stop_blocks
mkdir -p "$dir"

# Blocking the same stop more than this many times in a row lets Claude stop anyway, so a problem it
# can't fix doesn't trap it in a loop.
max_blocks=3

input=$(cat)

# A build_runner watch for this checkout, e.g. in an IDE terminal. It keeps generated code up to
# date itself, and a build alongside it would fight over the same build state.
watcher_running() {
  local pid
  for pid in $(pgrep -f '[b]uild_runner.*watch' || true); do
    if [[ $(readlink "/proc/$pid/cwd" 2>/dev/null) == "$PWD" ]]; then
      return 0
    fi
  done
  return 1
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

# Prints the errors and warnings from the build's log.
build_errors() {
  sed 's/\x1b\[[0-9;]*[A-Za-z]//g' "$log" |
    grep -v -E ' (skipped|same|no-op|output)|inputs;|^\s*$' || true
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
    if ! watcher_running; then
      # The lock stops two sessions sharing this checkout from building at the same time.
      if ! flock "$dir/build.lock" fvm dart run build_runner build \
        < /dev/null > "$log" 2>&1; then
        build_failed=true
        problems+=("Code generation failed. Fix these errors, and it will run again when you stop:
$(build_errors)")
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
  *)
    awk 'NR > 1 && /^#/ { sub(/^# ?/, ""); print; next } NR > 1 { exit }' "$0"
    exit 1
    ;;
esac
