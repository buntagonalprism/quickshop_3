# QuickShop 3 — Agent Guide

This guide covers the tools and workflow for AI agents working on this project. The architecture, code patterns and conventions are documented for everyone in [`docs/architecture.md`](docs/architecture.md).

## Architecture

**Before changing anything under `lib/`, read [`docs/architecture.md`](docs/architecture.md).** It defines where state, subscriptions and logic belong, with the reasoning behind each rule.

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
