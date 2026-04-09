# QuickShop 3 — Agent Guide

This guide captures the architectural decisions, code patterns, and conventions used throughout this project. It is intended to allow AI agents to contribute code that fits seamlessly with existing work.

---

## Flutter Version Management

**Always use FVM for all Flutter and Dart CLI commands.** The project pins a specific Flutter version via `.fvmrc`.

```bash
# Correct
fvm flutter pub get
fvm dart run build_runner build --delete-conflicting-outputs

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

## Project Folder Structure

Follows the structure defined in `README.md`:

```
lib/
  analytics/        # Analytics events, crash reporting, logging/tracing
  data/             # Data layer: models, repositories, application logic
    <feature>/
      models/       # Freezed data models for this feature
      repositories/ # Lightweight data access wrappers (Firestore, HTTP)
      application/  # Notifiers (global state), providers, use cases
      database/     # Drift table schemas and DAOs (if feature uses local DB)
  pages/            # UI pages (full-screen or tab-fill widgets)
    <feature>/
      <page_name>/  # Complex pages with multiple sub-views get their own subfolder
        <page_name>_page.dart
        <sub_view_name>_view.dart  # One file per distinct sub-view/tab
        <page_name>_view_model.dart  # View model co-located with its page
  services/         # Stateless wrappers around external systems
  utilities/        # Shared helper methods 
  widgets/          # Shared widgets reused across multiple pages
```

### When to create a page subfolder

Create a `lib/pages/<feature>/<page_name>/` subfolder when a page contains **multiple distinct sub-views or tabs** (e.g. an initial landing view, a search view, and a detail view). Keep each sub-view in its own `_view.dart` file within that subfolder. Simple single-screen pages may remain as a single file directly in `lib/pages/<feature>/`.

---

## Code Patterns

### Models — always use Freezed

All data models use the `@freezed` annotation for immutability, equality, and `copyWith()` generation. Generated files (`*.freezed.dart`) are committed to the repo.

```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_model.freezed.dart';
// Add this only if the model needs JSON serialization:
// part 'my_model.g.dart';

@freezed
abstract class MyModel with _$MyModel {
  const MyModel._(); // Required when adding custom methods

  const factory MyModel({
    required String id,
    required String name,
    String? optionalField,
  }) = _MyModel;

  // Add JSON support only when needed (e.g. SharedPreferences, local DB)
  // factory MyModel.fromJson(Map<String, dynamic> json) => _$MyModelFromJson(json);
}
```

Run code generation after adding/modifying models:
```bash
fvm dart run build_runner build --delete-conflicting-outputs
```

### Services — stateless, keepAlive

Services are stateless classes that wrap a single external system (Geolocator, Firebase, HTTP). They are exposed via `keepAlive: true` Riverpod providers since they have negligible memory cost and may be used from any widget.

```dart
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'my_service.g.dart';

@Riverpod(keepAlive: true)
MyService myService(Ref ref) => MyService();

class MyService {
  Future<SomeResult> doThing() async { ... }
}
```

Existing services in `lib/services/`:
- `AuthService` — Firebase auth state and user operations
- `LocationService` — Geolocator permission checks and location retrieval
- `FunctionsHttpClient` — authenticated HTTP calls to Firebase Cloud Functions

### Repositories — data access wrappers

Repositories are lightweight wrappers around Firestore (or other data services). They handle serialization/deserialization and expose clean method signatures for the application layer to call. They do not maintain in-memory state.

- Accept `FirestoreTransaction` for batch operations (never commit transactions themselves)
- Use `Stream<List<T>>` for real-time Firestore reads
- Use private `_Fields` class for Firestore field name constants
- Keep serialization helpers (`_fromFirestore`, `_toFirestore`) private

```dart
@riverpod
MyRepo myRepo(Ref ref, String entityId) {
  return MyRepo(entityId: entityId, ref: ref);
}

class MyRepo {
  MyRepo({required this.entityId, required this.ref});
  final String entityId;
  final Ref ref;

  Stream<List<MyModel>> get dataStream { ... }
  void create(FirestoreTransaction tx, MyModel model) { ... }
  void update(FirestoreTransaction tx, MyModel model) { ... }
  void delete(FirestoreTransaction tx, String id) { ... }
}

class _Fields {
  static const name = 'name';
}
```

### Notifiers — global state management

For data types used across multiple pages, create a `Notifier` in `data/<feature>/application/`. Notifiers own the in-memory cache and all write operations route through them (not directly through repositories) so optimistic updates can be applied.

```dart
@riverpod
class MyNotifier extends _$MyNotifier {
  @override
  Stream<List<MyModel>> build(String entityId) {
    ref.delayDispose(const Duration(minutes: 15)); // optional: keep data in memory in case it is needed again soon
    return ref.watch(myRepoProvider(entityId)).dataStream;
  }

  Future<void> addItem(MyModel item) async {
    // 1. Optimistic update (optional, depends on use case)
    // 2. Create transaction, call repo, commit
    final tx = ref.read(firestoreTransactionProvider)();
    ref.read(myRepoProvider(entityId)).create(tx, item);
    await tx.commit();
  }
}
```

### Providers — read-only views of data

Simple `@riverpod` function providers (no class needed) for derived/read-only data:

```dart
@riverpod
Future<List<MyResult>> myQuery(Ref ref, String param) async {
  // Fetches, transforms, or filters data
  // Auto-disposes when no longer watched
}
```

### View models — co-located with pages

View models live alongside their page in the same folder. They should only be used by that single page or views within the page.

```dart
// my_feature/my_page/my_page_view_model.dart
@riverpod
class MyPageViewModel extends _$MyPageViewModel {
  @override
  MyPageState build() { ... }

  void setSomething(String value) {
    state = state.copyWith(something: value);
  }
}
```

### Shared widgets

Widgets in `lib/widgets/` are reused across multiple pages.

**Dialog pattern** — dialogs use a static `show()` factory method, keeping the call site clean:

```dart
class MyDialog extends StatelessWidget {
  const MyDialog._();

  /// Returns the user's choice, or null if dismissed.
  static Future<bool> show(BuildContext context) async {
     inal result = await showDialog<bool>(
      context: context,
      builder: (context) => const MyDialog._(),
    );
    return result ?? false;
  }

  @override
  Widget build(BuildContext context) { ... }
}

// Usage at call site:
final confirmed = await MyDialog.show(context);
```

Existing dialogs following this pattern: `ConfirmationDialog`, `LocationRationaleDialog`, `LocationPermissionDeniedDialog`.


---

## Navigation

Uses GoRouter via `ref.read(routerProvider)`. Route paths and helpers are defined in `lib/router.dart`.

```dart
// Navigate to a route
ref.read(routerProvider).go(Routes.myRoute(param).path);

// Go back
ref.read(routerProvider).pop();
```

For pages with internal tab navigation (multiple sub-views), use `PopScope` with `canPop: false` when not on the first sub-view, and handle the back gesture manually to navigate between sub-views rather than leaving the page:

```dart
PopScope(
  canPop: _currentView == _MyPageView.initial,
  onPopInvokedWithResult: (didPop, _) {
    if (!didPop) _goBack(); // return to previous sub-view
  },
  child: ...,
)
```

---

## Analytics and Logging

- Log analytics events via `ref.read(analyticsProvider).logEvent(AnalyticsEvent.myEvent())`
- Log messages via `ref.read(loggerProvider('MyClass')).log('message')`
- Report errors via `ref.read(crashReporterProvider).report(error, stackTrace)`

Add new `AnalyticsEvent` factory constructors in `lib/analytics/analytics.dart` for new trackable user actions.

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
fvm dart run build_runner build --delete-conflicting-outputs
```

Commit the generated `*.freezed.dart`, `*.g.dart`, and `*.drift.dart` files alongside the source changes.

---

## Testing

```bash
fvm flutter test
```

- Unit tests use `mocktail` for mocks
- Database tests use a real in-memory Drift database (never mock the database)
- Use `fake_async` for testing time-dependent logic

---

## MCP Tools Available

When running with an MCP-compatible agent:
- **Marionette** (`mcp__marionette__*`): interact with the running Flutter app (tap, enter text, screenshot, logs). Connect via VM service URI from the Flutter debug output.
- **Dart MCP** (`mcp__dart__*`): analyze files, run tests, pub commands, hot reload. Connect to the Dart Tooling Daemon via DTD URI from VSCode command palette.
- Use `mcp__dart__pub` with `roots: [{root: "file://c:\\src\\quickshop\\quickshop_3"}]` for pub commands.
- Use `mcp__dart__analyze_files` to check for errors after code changes.
