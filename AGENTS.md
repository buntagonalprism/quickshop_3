# QuickShop 3 — Agent Guide

This guide covers the tools and workflow for AI agents working on this project. The architecture, code patterns and conventions are documented for everyone in [`docs/architecture.md`](docs/architecture.md).

## Architecture

**Before changing anything under `lib/`, read [`docs/architecture.md`](docs/architecture.md).** It defines where state, subscriptions and logic belong, with the reasoning behind each rule, and lists existing code that doesn't follow the rules and shouldn't be copied.

The rules most often broken, summarised from that document (which is authoritative if they ever disagree):

- Service, repository and use case providers are `keepAlive` and watch nothing, so each is a stable singleton.
- Repositories look up user-dependent values such as `appDatabaseProvider` when a method runs, and capture them at the start of async operations.
- Singletons may hold state that lives as long as the app, but not user data. User data lives in the per-user database or `UserPrefsService`, or in memory only when keyed by user ID.
- Repositories return streams and never subscribe to user data. Notifiers own those subscriptions and rebuild when the user changes.
- Repositories are passive. Background work that reacts to changes belongs in a use case.

---

## Flutter Version Management

**Always use FVM for all Flutter and Dart CLI commands.** The project pins a specific Flutter version via `.fvmrc`.

```bash
# Correct
fvm flutter pub get
fvm dart run build_runner build

# Wrong — uses the system Flutter, which may be a different version
flutter pub get
dart run build_runner build
```

---

## App Settings and Secrets

Environment-specific app settings and sensitive configuration values are stored in JSON files in the `settings` folder. 

The secrets files follow the structure of `settings/app_secrets_example.json` and are **not** committed to this repo. They are stored in the private `quickshop_3_secrets` repo.

When adding new `String.fromEnvironment(...)` keys in Dart code, either:
- Add the corresponding key for sensitive values to the `app_secrets_example.json` file and document it in the secrets repo
- Or add non-sensitive values directly to `app_settings_dev.json` and `app_settings_prod.json`

Access dart-define values in Dart via:
```dart
static const myKey = String.fromEnvironment('MY_KEY');
```

-- 

## Running the App

The app requires at least three command-line specifications to run:
- Build flavor: either `dev` or `prod`
- App secrets file
- App settings file

To target the dev environment:
```bash
fvm flutter run --flavor dev --dart-define-from-file=settings/app_secrets_dev.json --dart-define-from-file=settings/app_settings_dev.json
```

To target a local Firebase emulator environment, run `tool/setup_local_settings.dart` to generate settings for local connection in `settings/app_settings_local.json`:

```bash
fvm dart run tool/setup_local_settings.dart
fvm flutter run --flavor dev --dart-define-from-file=settings/app_secrets_dev.json --dart-define-from-file=settings/app_settings_dev.json --dart-define-from-file=settings/app_settings_local.json
```

### Running on web for UI testing

Web is not a production target for this app. It exists so that agents can verify UI changes in a headless Chrome session, driven by Marionette, instead of booting an Android emulator.

It needs Chrome for Testing installed, as described under "Headless web testing" in `README.md`. If `start` fails to launch Chrome, check that setup.

Use `tool/run_web.sh` to run and control the app:

```bash
tool/run_web.sh start      # Run in the background: blocks until the app exits
tool/run_web.sh wait       # Waits until the app is ready, then prints the URI to connect Marionette to
tool/run_web.sh reload     # Hot reload (keeps state, updates code)
tool/run_web.sh restart    # Hot restart (resets state, reruns main)
tool/run_web.sh quit       # Stop the app and close Chrome
```

`start` runs the dev environment on port 8123, and passes any extra arguments to `flutter run`, such as `--dart-define-from-file=settings/app_settings_local.json`. Output goes to the log file printed on start, `/tmp/quickshop_web/flutter_run.log` unless `TMPDIR` is set. `reload` and `restart` wait until they have finished, and print any compile errors if they fail. Don't use the Dart MCP `hot_restart` tool: it doesn't work for web apps, because it restarts without `flutter run` recompiling first.

Sign in with the email and password test account rather than Google, whose sign-in popup cannot be automated. Google Maps is not yet configured for web.

Sign-in and the app's local database persist between runs when a fixed port is used and a clean exit is performed, so always stop the app with `quit`. To start from a clean browser, delete `.dart_tool/chrome-device` or pass a different `--web-port`.

---

## Formatting

After editing any Dart file, format it with:

```bash
fvm dart format path/to/file.dart
```

To format all changed files at once:

```bash
fvm dart format lib/
```

---

## Code Generation

After modifying any file with `@freezed`, `@riverpod`, `@Riverpod`, `@JsonSerializable`, or Drift table definitions, run:

```bash
fvm dart run build_runner build
```

Commit the generated `*.freezed.dart`, `*.g.dart`, and `*.drift.dart` files alongside the source changes.

---

## Testing

```bash
fvm flutter test
```

See [Testing](docs/architecture.md#testing) in the architecture document for testing conventions.

---

## MCP Tools Available

When running with an MCP-compatible agent:
- **Marionette** (`mcp__marionette__*`): interact with the running Flutter app (tap, enter text, screenshot, logs). Connect via VM service URI from the Flutter debug output.
- **Dart MCP** (`mcp__dart__*`): analyze files, run tests, pub commands, hot reload. Connect to the Dart Tooling Daemon via DTD URI from VSCode command palette.
- Use `mcp__dart__pub` with `roots: [{root: "file://c:\\src\\quickshop\\quickshop_3"}]` for pub commands.
- Use `mcp__dart__analyze_files` to check for errors after code changes.
