# QuickShop 3 Architecture

This document describes how the QuickShop 3 codebase is structured, and why, for both human developers and AI agents. [`README.md`](../README.md) covers the tech stack and project setup, and [`AGENTS.md`](../AGENTS.md) covers the tooling workflow for agents.

The rules here explain their reasoning so that they can be applied to situations they don't explicitly cover. When the reasoning and a rule seem to disagree for a new case, follow the reasoning and update this document.

---

## Folder structure

```
lib/
  analytics/        # Analytics events, crash reporting, logging and tracing
  data/             # Data layer: models, repositories, application logic
    <feature>/
      models/       # Freezed data models for this feature
      repositories/ # Data access wrappers around Firestore, HTTP, and the local database
      application/  # Notifiers, read-only providers, and use cases
      database/     # Drift table schemas and DAOs, if the feature uses the local database
  pages/            # UI pages: full-screen widgets, or widgets filling a tab
    <feature>/
      <page_name>/                   # Pages with multiple sub-views get their own subfolder
        <page_name>_page.dart
        <sub_view_name>_view.dart    # One file per distinct sub-view or tab
        <page_name>_view_model.dart  # View model co-located with its page
  services/         # Wrappers around external systems
  utilities/        # Shared helper functions
  widgets/          # Shared widgets reused across multiple pages
```

Create a `lib/pages/<feature>/<page_name>/` subfolder when a page contains multiple distinct sub-views or tabs, such as a landing view, a search view and a detail view, with each sub-view in its own `_view.dart` file. Simple single-screen pages may be a single file directly in `lib/pages/<feature>/<page_name>_page.dart`.

---

## Riverpod's two roles

Riverpod is used for two different things in this app, and they follow different rules.

- **Dependency injection.** Services, repositories, and use cases are classes that other code calls. Riverpod only locates them. Their providers are `keepAlive` and watch nothing, so each is a stable singleton: any consumer can read it at any time and always get the same instance.
- **State management.** Notifiers, read-only providers, and view models hold data. Their providers can watch other inputs and automatically rebuild when those inputs change, which is how Riverpod keeps state up to date. 

Mixing the two causes bugs. A class that other code calls should never be replaced underneath its callers because of a change to some input value, and a state that depends on an input, such as the signed-in user, must be rebuilt when that input changes, which a singleton won't do on its own.

### The signed-in user

Most of the app's data belongs to the signed-in user, and the user can change while the app is running, by signing out and signing in as someone else. Each user has their own Drift database, provided by `appDatabaseProvider`

This is a common source of data-caching bugs, especially when switching accounts during testing. A singleton service or repository lives for the whole app, but user data only lives as long as a user is signed in. Anything that holds user data, or a subscription to it, must either belong to something that is rebuilt when the user changes, or look up the user data afresh for each access.

---

## Services

Services wrap a single external system, such as Firebase Auth, Geolocator or HTTP calls to Cloud Functions. They are `keepAlive` singletons which watch nothing.

```dart
@Riverpod(keepAlive: true)
MyService myService(Ref ref) => MyService();

class MyService {
  Future<SomeResult> doThing() async { ... }
}
```

Examples of existing services in `lib/services/`:

- `AuthService`: Firebase auth state and user operations
- `LocationService`: Geolocator permission checks and location retrieval
- `FunctionsHttpClient`: authenticated HTTP calls to Firebase Cloud Functions
- `UserPrefsService` and `UnauthPrefsService`: local key-value preferences

### Preferences

Local preferences are stored with SharedPreferences, through one of two services. Choose by asking whose value it is:

- **`UserPrefsService`** for values that belong to the signed in user, such as values describing the contents of their local database. Keys are prefixed with the user ID, looked up on every call, so each user has their own values. While nobody is signed in, values belong to an `unauthenticated` user, matching `appDatabaseProvider`.
- **`UnauthPrefsService`** for values that belong to the device, whoever is signed in, such as the theme or whether the location permission rationale has been shown.

`SharedPreferencesWithCache` needs async initialisation, so `main.dart` creates it, constructs both services around it, and overrides their providers. Nothing else can reach the underlying instance, so every value has to go through one of the services. Choosing a service at each use makes the owner of every value explicit, and a value stored for the wrong owner either leaks between users or is lost when they switch.

---

## Repositories

Repositories are lightweight wrappers around data sources: Firestore, HTTP calls, and the local database. They handle serialisation and expose clean methods for the application layer to call. There is generally one repository per data model type. Repositories do not call each other; coordinating between them is the job of notifiers and use cases.

A clean repository interface also makes the application layer easy to unit test, as repositories with named and statically typed methods are much simpler to mock than a Firestore client, API calls, or Drift database operations.

### Rules

1. **Repository providers are `keepAlive` and watch nothing.** Read dependencies through `ref.read` when a method needs them, not with `ref.watch` in the provider. Watching something that changes, such as the user ID, rebuilds the provider and replaces the repository underneath anything holding a reference to it.

   Family repositories keyed by an entity ID, such as `checklistEntryRepoProvider(listId)`, follow the same rule for each key: one stable instance per entity.

2. **Look up user-dependent values when a method runs, and capture them at the start of async operations.** Use a getter such as `AppDatabase get _db => _ref.read(appDatabaseProvider)` rather than storing the database in a field. Within a single async operation, read the value once at the start and keep using it after each `await`. If the user changes part way through, the operation then finishes against the original user's database, which is still correct for that user, rather than writing one user's data into another user's database.

3. **Repositories may hold state that lives as long as the app, but not user data.** A cache of global data is fine. User-specific data belongs in the per-user database or `UserPrefsService`, read when needed. An in-memory copy of it outlives a sign-out and leaks into the next user's session. If user-specific data really must be cached in memory, key it by user ID, as `appDatabaseProvider` does with its databases.

4. **Repositories return streams; they never subscribe to user data themselves.** A Firestore snapshot subscription needs an owner that cancels it, and the owner's lifetime decides when that happens. A subscription to user data must end when the user signs out, otherwise it leaks and fails with permission-denied errors once auth changes. Repositories should return a new stream per call and leave the act of subscribing to that stream to notifiers/providers, as Riverpod is able to automatically cancel stream subscriptions when the listening notifier/provider rebuilds or is disposed.

5. **Repositories are passive.** They don't start work in their constructors or listen to other providers. Background work that reacts to changes, such as syncing data into the local database, belongs in a use case.

### Conventions

- Accept a `FirestoreTransaction` when a write operation needs to span multiple data types. Respositories do not commit transactions: the caller that created the transaction commits it.
- Use a private `_Fields` class for Firestore field name constants to support querying/setting fields consistently by name.
- Keep serialisation helpers such as `_fromFirestore` and `_toFirestore` private.

```dart
@Riverpod(keepAlive: true)
MyRepo myRepo(Ref ref, String entityId) {
  return MyRepo(ref, entityId);
}

class MyRepo {
  MyRepo(this._ref, this.entityId);

  final Ref _ref;
  final String entityId;

  FirebaseFirestore get _fs => _ref.read(firestoreProvider);

  Stream<List<MyModel>> get dataStream { ... }
  void create(FirestoreTransaction tx, MyModel model) { ... }
  void update(FirestoreTransaction tx, MyModel model) { ... }
  void delete(FirestoreTransaction tx, String id) { ... }
}

class _Fields {
  static const name = 'name';
}
```

---

## Application layer

The `application` folder in each feature coordinates between repositories and holds application-wide state.

### Notifiers

For data types used across multiple pages, or small enough to cache entirely in memory, a single Riverpod `Notifier` is the in-memory source of truth. All writes go through the notifier rather than straight to the repository, so the notifier can apply optimistic, synchronous updates to its state before persisting them through the repository.

Notifiers own subscriptions to user data: `build()` returns the repository's stream, Riverpod subscribes to it, and Riverpod cancels the subscription when the notifier is rebuilt or disposed. A notifier of user data that outlives the pages using it must rebuild when the user changes:

- A `keepAlive` notifier should watch `userAuthProvider` or `userIdProvider` in `build()`, as `ListsNotifier` and `userProfileProvider` do.
- A notifier that should stay in memory briefly after its last listener leaves (so the data is already in memory if the user comes back) uses `ref.delayDispose(...)`, which watches the user ID for you. 

```dart
@riverpod
class MyNotifier extends _$MyNotifier {
  @override
  Stream<List<MyModel>> build(String entityId) {
    ref.delayDispose(const Duration(minutes: 15)); // Optional: keep the data in memory in case it's needed again soon
    return ref.watch(myRepoProvider(entityId)).dataStream;
  }

  Future<void> addItem(MyModel item) async {
    // 1. Optionally apply an optimistic update to state
    state = AsyncValue.data([...state.value, item]);
    // 2. Optionally create a transaction before calling the repository
    final tx = ref.read(firestoreTransactionProvider)();
    // 3. Invoke the update operation on the repository
    ref.read(myRepoProvider(entityId)).create(tx, item);
    // 4. Optionally invoke other notifiers that need to participate in the transaction
    ref.read(myStatsNotifierProvider.notifier).updateStats(tx, item);
    // 5. Optionally commit the transaction
    await tx.commit();
  }
}
```

Write operations that span multiple data types are orchestrated by the notifier that initiates them, by calling methods on the other notifiers to inform them of the update. If a transaction is needed, the initiating notifier creates it, and passes it to the other notifiers for them to pass down to their repositories. The initiating notifier is responsible for committing the transaction.

### Read-only providers

Read-only providers are defined as a single top-level function using Riverpod code generation. They return live-updating, read-only views of data, e.g.: direct queries against repositories, filtered subsets of notifier data, or transformations of it. Unless several pages need the same view, this behaviour often belongs in a view model instead.

```dart
@riverpod
Future<List<MyResult>> myQuery(Ref ref, String param) async {
  // Fetches, transforms or filters data. Auto-disposes when no longer watched.
  final rawData = await ref.read(myRepositoryProvider).queryData(param);
  final transformed = rawData.map(transformer);
  return transformed;
}
```

### Use cases

Use cases coordinate between repositories without caching the results in memory, for example aggregating queries over datasets that are too large to cache, or observing one dataset to trigger loading of another. Like repositories, they are `keepAlive` singletons whose providers watch nothing.

Unlike repositories, a use case may react to changes, using `ref.listen` to watch providers such as the user profile or locale and driving repository methods in response. `UserHistoryLoaderUseCase` is an example: it listens to the user profile and tells the history repositories to fetch new history. Use cases follow the same lifetime rules as repositories: state that lives as long as the app is fine, user data is not. A use case may hold a subscription to global Firestore data for the life of the app, but should get user data by listening to a notifier or provider.

---

## Pages and view models

A page is either a full-screen widget, or a widget which fills the contents of a tabbed view.

View models are co-located with their page, and aggregate and transform data from application state and repositories for that page. A view model is used only by its own page and the views or child widgets within it. Depending on the page, it may be a read-only provider or a mutable notifier.

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

---

## Models

All data models use Freezed for immutability, equality and `copyWith()`. Generated files are committed to the repo.

```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_model.freezed.dart';
// Add this only if the model needs JSON serialisation:
// part 'my_model.g.dart';

@freezed
abstract class MyModel with _$MyModel {
  const MyModel._(); // Required when adding custom methods

  const factory MyModel({
    required String id,
    required String name,
    String? optionalField,
  }) = _MyModel;

  // Add JSON support only when needed, e.g. for SharedPreferences or the local database
  // factory MyModel.fromJson(Map<String, dynamic> json) => _$MyModelFromJson(json);
}
```

---

## Shared widgets

Widgets in `lib/widgets/` are reused across multiple pages.

Dialogs use a static `show()` method, keeping the call site clean:

```dart
class MyDialog extends StatelessWidget {
  const MyDialog._();

  /// Returns the user's choice, or false if dismissed.
  static Future<bool> show(BuildContext context) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => const MyDialog._(),
    );
    return result ?? false;
  }

  @override
  Widget build(BuildContext context) { ... }
}

// At the call site:
final confirmed = await MyDialog.show(context);
```

Existing dialogs following this pattern include `ConfirmationDialog`, `LocationRationaleDialog` and `LocationPermissionDeniedDialog`.

---

## Navigation

Navigation uses GoRouter through `routerProvider`. Route paths and helpers are defined in `lib/router.dart`.

```dart
ref.read(routerProvider).go(Routes.myRoute(param).path);
ref.read(routerProvider).pop();
```

For pages with multiple sub-views, use `PopScope` with `canPop: false` when not on the first sub-view, and handle the back gesture to return to the previous sub-view rather than leaving the page:

```dart
PopScope(
  canPop: _currentView == _MyPageView.initial,
  onPopInvokedWithResult: (didPop, _) {
    if (!didPop) _goBack();
  },
  child: ...,
)
```

---

## Analytics and logging

- Log analytics events with `ref.read(analyticsProvider).logEvent(AnalyticsEvent.myEvent())`. Add a new `AnalyticsEvent` factory constructor in `lib/analytics/analytics.dart` for each new trackable user action.
- Log messages with `ref.read(loggerProvider('MyClass')).log('message')`.
- Report errors with `ref.read(crashReporterProvider).report(error, stackTrace)`.

---

## Testing

- Unit tests use `mocktail` for mocks.
- To test providers and notifiers, mock repositories or our own wrapper services, never mock an external system. Tests of our own domain logic shouldn't depend on the behaviour of an external library.
- To test local database queries and DAO methods, use a real in-memory drift database - see `app_database_test.dart`. 
- Most repositories should be thin wrappers with minimal logic such that any unit tests would be redundant restatements of the code itself. Any logic should be extracted to pure functions which can be tested seperately, or extracted into the application layer as a use-case/notifier. 
- Only when testing on of our wrapper services should an external system be mocked/faked. For example the preferences service tests fake `SharedPreferencesWithCache` from `package:shared_preferences`
- Use `fake_async` for time-dependent logic.

---

## Known deviations

Some existing code predates these rules. Don't copy it as an example, and remove each entry here once it's fixed.

- **Suggestion repositories** (`ShoppingItemSuggestionRepo`, `ShoppingCategorySuggestionRepo`) sync suggestions themselves, starting at app launch, which breaks rule 5. Suggestions are missing after a first sign-in until the next launch.
- **History repositories** (`ShoppingItemHistoryRepo`, `ShoppingCategoryHistoryRepo`) cache the user's download progress in memory, which breaks rule 3. After switching accounts, the second user's older history is never downloaded.
- **`UserProfileRepo`** caches the user profile as a side effect of mapping the profile stream, which breaks rule 3. Code that needs the profile should read `userProfileProvider` instead.
- **Auto-dispose providers for repositories and use cases** (`ListInviteRepo`, `ShoppingListItemsRepo`, `TooltipsRepo`, the suggestion repositories, `ShoppingItemAutocompleteUseCase` and `ShoppingCategoryAutocompleteUseCase`) break rule 1, as a consumer holding one after it is disposed gets errors from its disposed `Ref`.
