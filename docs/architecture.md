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

Mixing the two causes bugs. A class that other code calls should never be replaced underneath its callers because of a change to some input value, and state that depends on an input, such as the signed-in user, must be rebuilt when that input changes, which a singleton won't do on its own.

### The signed-in user

Most of the app's data belongs to the signed-in user, and the user can change while the app is running, by signing out and signing in as someone else. Each user has their own Drift database, provided by `appDatabaseProvider`.

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

- **`UserPrefsService`** for values that belong to the signed in user, such as values describing the contents of their local database or personal preferences.
- **`UnauthPrefsService`** for values that belong to the device, regardless of who is signed in, such as the system theme or whether the location permission rationale has been shown.

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

- Accept a `FirestoreTransaction` when a write operation needs to span multiple data types. Repositories do not commit transactions: the caller that created the transaction commits it.
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
  Future<void> update(MyModel model) { ... }
  Future<void> delete(String id) { ... }

  // Creating a model also updates other data types, so it takes a transaction
  void create(FirestoreTransaction tx, MyModel model) { ... }
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

  Future<void> updateItem(MyModel item) {
    // 1. Optionally apply an optimistic update to state
    state = AsyncValue.data([
      for (final existing in state.value ?? <MyModel>[]) existing.id == item.id ? item : existing,
    ]);
    // 2. Persist the update through the repository
    return ref.read(myRepoProvider(entityId)).update(item);
  }

  // A write spanning multiple data types uses a transaction
  Future<void> addItem(MyModel item) {
    // 1. Optionally apply an optimistic update to state
    state = AsyncValue.data([...?state.value, item]);
    // 2. Create a transaction
    final tx = ref.read(firestoreTransactionProvider)();
    // 3. Add this notifier's writes through its repository
    ref.read(myRepoProvider(entityId)).create(tx, item);
    // 4. Tell other notifiers about the update, so they can add their writes to the transaction
    ref.read(myStatsProvider.notifier).onItemAdded(tx, item);
    // 5. Commit the transaction
    return tx.commit();
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

Unlike repositories, a use case may react to changes, using `ref.listen` to watch providers such as the user profile or locale and driving repository methods in response. `UserHistoryLoaderUseCase` is an example: it listens to the user profile and tells the history repositories to fetch new history. Use cases follow the same lifetime rules as repositories: state that lives as long as the app is fine, user data is not. A use case may hold a subscription to global Firestore data for the life of the app. A use case should not get user-specific data by subscribing to a repository stream or Firestore directly, as the singleton use case would continue to hold the original subscription when the user switches to a different account. Instead, use cases should listen to the currently signed in user if they need to react to user-specific data.

```dart
@Riverpod(keepAlive: true)
MyLoaderUseCase myLoaderUseCase(Ref ref) => MyLoaderUseCase(ref);

class MyLoaderUseCase {
  MyLoaderUseCase(this._ref) {
    // Listen to the signed in user's profile, rather than subscribing to Firestore directly
    _ref.listen(userProfileProvider, (_, profileAsync) {
      final lastUpdated = profileAsync.value?.lastUpdated;
      if (lastUpdated != null) {
        _myRepo.fetchUpdatesSince(lastUpdated);
      }
    }, fireImmediately: true);
  }

  final Ref _ref;
  MyRepo get _myRepo => _ref.read(myRepoProvider);
  OtherRepo get _otherRepo => _ref.read(otherRepoProvider);

  // Coordinate between repositories, without caching the results
  Future<List<MyResult>> search(String query) async {
    final (mine, others) = await (_myRepo.search(query), _otherRepo.search(query)).wait;
    return [...mine, ...others.map(MyResult.fromOther)];
  }
}
```

If a use case reacts to more than one input, combine the inputs in a provider and listen to that one provider, rather than listening to each input and keeping the latest values in fields. The provider rebuilds whenever any input changes, and returns a single value describing what the use case should do. Give the value equality, for example with Freezed, so that a rebuild which produces the same value doesn't notify the use case again. Putting the decision in a provider also keeps it out of the use case, so that it can be read in one place, and the provider can watch an input only when it's needed.

```dart
@riverpod
MySyncRequest? mySyncRequest(Ref ref) {
  final userId = ref.watch(userIdProvider);
  if (userId == null) {
    return null;
  }
  final langCode = ref.watch(localeServiceProvider.select((locale) => locale.languageCode));
  return MySyncRequest(userId: userId, langCode: langCode);
}

class MySyncUseCase {
  MySyncUseCase(this._ref) {
    _ref.listen(mySyncRequestProvider, (_, request) {
      if (request != null) {
        _myRepo.sync(request.langCode);
      }
    }, fireImmediately: true);
  }
  ...
}
```

Examples of existing use cases in `lib/data/`:

- `UserHistoryLoaderUseCase`: downloads the user's shopping history when their profile shows it has changed
- `SuggestionsSyncUseCase`: downloads suggestions into the signed in user's database when the suggestions in Firestore, the user or the locale change. `suggestionsSyncRequestProvider` combines those inputs.
- `HiddenSuggestionsUseCase`: hides suggestions, and applies suggestions hidden on other devices
- `ShoppingItemAutocompleteUseCase` and `ShoppingCategoryAutocompleteUseCase`: combine list items, history and suggestions into autocomplete results

---

## Pages and view models

A page is either a full-screen widget, or a widget which fills the contents of a tabbed view.

A page's view model is a file, `<page_name>_view_model.dart`, co-located with the page. It holds a collection of notifiers and providers that the page and its views need. It isn't necessarily a single class. Everything in it is used only by that page and the views and child widgets within it.

A view model contains two kinds of provider, which must stay separate:

- **Screen state notifiers** hold state the screen owns, such as search text, the selected tab or form fields. Their `build()` returns an initial value and watches nothing, and they are auto-dispose, so the state resets when the screen closes. Split screen state by concern rather than keeping it in one notifier, so a change to one value doesn't rebuild widgets that only depend on another value.
- **Derived providers** compute or query data the screen needs to display, e.g. by watching and reacting to screen state notifiers, watching and transforming application layer notifiers, or directly fetching data from repositories or use cases. They hold nothing, so they can be recomputed whenever their inputs change.

Actions that change application data should call application layer notifiers directly. Actions that change screen state should call methods on the screen state notifiers. Widgets watch the narrowest provider they need, using `select` when they only depend on part of a value.

Name providers and the types they hold for what they hold, without any prefix of the screen name: `searchFilterProvider`, `filteredItemsProvider`, `inviteStatusProvider`. Because those names are generic, different pages will reuse them. Import a view model library file with the `vm` prefix in its page and views, so it's clear which providers belong to the screen and which come from the application layer. When a page uses mutiple view models, import each with a short distinguishing prefix, like `categoryVm`.

Derived providers that work with asynchronous data should return an `AsyncValue`. If the data is a single item might not exist, such as a list that has been deleted, return `AsyncValue<T?>` with null meaning not found. `checklistProvider` in `checklist_view_model.dart` is an example.


```dart
// my_feature/my_page/my_page_view_model.dart

// Screen state: owned by the page, reset when it closes
@riverpod
class SearchFilter extends _$SearchFilter {
  @override
  String build() => '';

  void set(String filter) => state = filter;
}

// Derived data: recomputed when the application data or the filter changes
@riverpod
AsyncValue<List<MyModel>> filteredItems(Ref ref, String entityId) {
  final filter = ref.watch(searchFilterProvider).trim().toLowerCase();
  return ref
      .watch(myProvider(entityId))
      .whenData((items) => items.where((item) => item.name.toLowerCase().contains(filter)).toList());
}
```

```dart
// my_feature/my_page/my_page.dart
import 'my_page_view_model.dart' as vm;

class MyPage extends ConsumerWidget {
  const MyPage({super.key, required this.entityId});

  final String entityId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(vm.filteredItemsProvider(entityId));
    ...
    TextField(onChanged: ref.read(vm.searchFilterProvider.notifier).set);
    ...
  }
}
```

`category_selector_view_model.dart` follows this pattern: a `CategoryFilter` notifier holds the typed filter, and a separate provider watches it to produce the matching categories.

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
- To test local database queries and DAO methods, use a real in-memory Drift database. See `app_database_test.dart`.
- Most repositories should be thin wrappers with minimal logic such that any unit tests would be redundant restatements of the code itself. Any logic should be extracted to pure functions which can be tested separately, or extracted into the application layer as a use case or notifier.
- Only when testing one of our wrapper services should an external system be mocked or faked. For example, the preferences service tests fake `SharedPreferencesWithCache` from `package:shared_preferences`.
- Use `fake_async` for time-dependent logic.

---

## Known deviations

Some existing code predates these rules. Don't copy it as an example, and remove each entry here once it's fixed.

- **`ChecklistEntryRepo`** holds the checklist's ordering logic (sort-key placement, duplicate keys, which entries "remove checked" deletes), breaking the Testing guidance that repositories stay thin. As a result, `checklist_entry_notifier_test.dart` tests the repository by mocking Firestore rather than mocking the repository. Tracked in [#16](https://github.com/buntagonalprism/quickshop_3/issues/16).
