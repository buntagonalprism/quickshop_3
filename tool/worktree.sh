#!/usr/bin/env bash
# Sets up and removes git worktrees of this repo, so several Claude Code sessions can work at once
# without sharing a checkout. The create and remove subcommands are Claude Code's WorktreeCreate and
# WorktreeRemove hooks, configured in .claude/settings.json, and read the hook's JSON input on stdin.
#
#   tool/worktree.sh create   Create a worktree named by the input's `name`, in
#                             ../quickshop_3-worktrees/<name> on a new branch agents/<name>, from
#                             origin/main or QUICKSHOP_WORKTREE_BASE if set. Copies the settings,
#                             secrets and signing files git doesn't track, installs the pinned
#                             Flutter SDK and gets dependencies, then prints the worktree's path.
#                             Its first build_runner build is started in the background.
#   tool/worktree.sh remove   Remove the worktree at the input's `worktree_path`, and free its web
#                             port. Its branch is kept.
#   tool/worktree.sh port     Print the port this checkout serves the web app on, allocating one
#                             if it hasn't got one yet.
#
# The main checkout always uses port 8123. Worktrees are allocated ports from 8124 upwards, recorded
# in ~/.local/state/quickshop_3/web_ports so they survive `flutter clean`. A worktree keeps its port
# until it's removed, so its browser storage, which is per port, keeps the app's sign-in.
set -euo pipefail

main_port=8123

# The main checkout, which holds the files that aren't tracked, whichever checkout this runs in.
main_dir=$(dirname "$(git -C "$(dirname "$0")" rev-parse --path-format=absolute --git-common-dir)")
worktrees_dir="$main_dir-worktrees"

state_dir="${XDG_STATE_HOME:-$HOME/.local/state}/quickshop_3"
ports_file=$state_dir/web_ports

# Files git doesn't track that a worktree needs to run the app, if the main checkout has them.
local_files=(
  'settings/app_secrets*.json'
  settings/app_settings_local.json
  'android/app/src/*/google-services.json'
  'android/keystore/*'
  .claude/settings.local.json
)

# Runs the rest of the arguments while holding the lock on the ports file, after dropping the ports
# of worktrees that no longer exist.
with_ports_lock() {
  mkdir -p "$state_dir"
  touch "$ports_file"
  (
    flock 9
    local port path
    while read -r port path; do
      [[ -d $path ]] && echo "$port $path"
    done < "$ports_file" > "$ports_file.tmp"
    mv "$ports_file.tmp" "$ports_file"
    "$@"
  ) 9> "$ports_file.lock"
}

# Prints the port recorded for the worktree at $1, or allocates the lowest one that's free.
allocate_port() {
  local port path
  while read -r port path; do
    if [[ $path == "$1" ]]; then
      echo "$port"
      return
    fi
  done < "$ports_file"
  port=$((main_port + 1))
  while grep -q "^$port " "$ports_file" || ss -ltnH "sport = :$port" | grep -q .; do
    port=$((port + 1))
  done
  echo "$port $1" >> "$ports_file"
  echo "$port"
}

free_port() {
  local port path
  while read -r port path; do
    [[ $path != "$1" ]] && echo "$port $path"
  done < "$ports_file" > "$ports_file.tmp"
  mv "$ports_file.tmp" "$ports_file"
}

case "${1:-}" in
  create)
    name=$(jq -r '.name' < /dev/stdin)
    path=$worktrees_dir/$name
    base=${QUICKSHOP_WORKTREE_BASE:-origin/main}
    # Only the path goes to stdout, as Claude Code reads it from there.
    {
      if [[ $base == origin/* ]] && ! git -C "$main_dir" fetch origin "${base#origin/}"; then
        echo "Couldn't fetch $base, so using the last fetched version."
      fi
      git -C "$main_dir" worktree add -b "agents/$name" "$path" "$base"
      cd "$main_dir"
      git ls-files --others --ignored --exclude-standard -- "${local_files[@]}" |
        while IFS= read -r file; do
          mkdir -p "$path/$(dirname "$file")"
          cp -p "$file" "$path/$file"
        done
      cd "$path"
      fvm install
      fvm flutter pub get
      # A worktree's first build generates everything, which takes about a minute, so it's started
      # now. The Claude Code stop hook takes the same lock, so it waits for this to finish, then
      # only rebuilds what has changed since.
      mkdir -p .dart_tool/claude_hooks
      setsid flock .dart_tool/claude_hooks/build.lock fvm dart run build_runner build \
        < /dev/null > .dart_tool/claude_hooks/first_build.log 2>&1 &
    } >&2
    echo "$path"
    ;;
  remove)
    path=$(jq -r '.worktree_path' < /dev/stdin)
    # Fails, keeping the worktree and its port, if it has changes that aren't committed.
    git -C "$main_dir" worktree remove "$path"
    with_ports_lock free_port "$path"
    ;;
  port)
    checkout=$(git -C "$(dirname "$0")" rev-parse --show-toplevel)
    if [[ $checkout == "$main_dir" ]]; then
      echo "$main_port"
    else
      with_ports_lock allocate_port "$checkout"
    fi
    ;;
  *)
    awk 'NR > 1 && /^#/ { sub(/^# ?/, ""); print; next } NR > 1 { exit }' "$0"
    exit 1
    ;;
esac
