#!/usr/bin/env bash
# Launches Chrome headlessly with a phone-sized window. Set CHROME_EXECUTABLE to
# this script to run the app on web for automated UI testing.
#
# The window size is set here because `flutter run` splits --web-browser-flag
# values on commas, which breaks Chrome's --window-size=<width>,<height> flag.
#
# The app URL is opened with --app, because normal browser windows have a
# minimum width of 500px regardless of --window-size.
args=()
for arg in "$@"; do
  if [[ $arg == http://* ]]; then
    args+=("--app=$arg")
  else
    args+=("$arg")
  fi
done
exec "${CHROME_BINARY:-$HOME/lib/chrome-for-testing/chrome-linux64/chrome}" \
  --headless=new \
  --window-size=412,915 \
  "${args[@]}"
