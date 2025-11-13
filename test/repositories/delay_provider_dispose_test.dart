import 'dart:async';

import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quickshop/application/user_notifier.dart';
import 'package:quickshop/repositories/delay_provider_dispose.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../fakes/fake_firebase_auth.dart';
import '../utilities/create_provider_container.dart';

part 'delay_provider_dispose_test.g.dart';

/// A very short duration used as an approximation for processing a single event loop using
/// [FakeAsync.elapse]. This workaround is necessary because [FakeAsync] does not provide a more
/// accurate way to simulate a single event loop. [FakeAsync.flushMicrotasks] has no impact on
/// timers, which are used internally for scheduling provider disposal in Riverpod, while
/// [FakeAsync.flushTimers] processes all pending timers regardless of their duration, making it
/// impossible to test the delay duration accurately.
Duration _oneEventLoop = const Duration(milliseconds: 1);

final _upstreamController = StreamController<int>.broadcast();

/// A simplistic representation of an upstream data source. keepAlive is set to true because:
/// - When upstream data changes, all keepalive links are removed from the downstream provider
/// - If the downstream does not have any current listeners it will not be rebuilt
/// - If the downstream is not rebuilt, the upstream will have no listeners
/// - Without keepAlive, if the upstream has no listeners, it will be disposed of and the state lost
///
/// When new listeners attach to a *proper* upstream data source, the data source would be able
/// to fetch the state again from scratch or load it from a database cache like Firestore's internal
/// cache. To avoid implementing such behaviour in these tests we use keepAlive to prevent the state
/// being lost when there are no listeners. In our application code, keeping alive too many data
/// sources could lead to memory leaks, so it is important to use this feature judiciously.
///
/// Note that when using a Provider of a Stream, in Riverpod 3.0 and later, if the provider is paused
/// (i.e. has no listeners) the underlying Stream subscription is also paused to save resources. This
/// is problematic in our tests because it means updates emitted on the stream while there are no
/// listeners are lost entirely, so some tests require an additional listener on this upstream provider
/// to keep it active. Again, with Firestore this is not an issue, because it re-emits the latest data
/// when a stream subscription is unpaused.
///
/// Each test is still able to access an independent value of this provider, thanks to the use of a
/// [ProviderContainer] which scopes all providers to the test.
@Riverpod(keepAlive: true)
Stream<int> upstream(Ref ref) {
  return _upstreamController.stream;
}

/// Track how many times the provider under test has been rebuilt, disposed, and cancelled.
int _rebuildCount = 0;
int _disposeCount = 0;
int _cancelCount = 0;
Duration _delayDuration = const Duration(seconds: 1);

@riverpod
int delayDispose(Ref ref) {
  ref.delayDispose(_delayDuration);
  _rebuildCount++;
  ref.onDispose(() {
    _disposeCount++;
  });
  ref.onCancel(() {
    _cancelCount++;
  });
  return ref.watch(upstreamProvider).value ?? 0;
}

void main() {
  setUp(() {
    _rebuildCount = 0;
    _disposeCount = 0;
    _cancelCount = 0;
  });

  test(
      'GIVEN an auto dispose provider with delay dispose '
      'WHEN the last listener is detached '
      'THEN it is only disposed after the delay has elapsed', () {
    fakeAsync((fakeAsync) {
      final auth = FakeFirebaseAuth(user: buildUser());
      final container = createContainer(overrides: [auth.providerOverride]);

      // Create the subscription on the provider, triggering its build
      final subscription = container.listen(delayDisposeProvider, (_, __) {});
      expect(_disposeCount, 0);
      expect(_cancelCount, 0);

      // Cancel the subscription. This synchronously calls onCancel in the provider
      subscription.close();
      expect(_cancelCount, 1);
      expect(_disposeCount, 0);

      // After flushing timers, the provider should not yet be disposed
      fakeAsync.elapse(_oneEventLoop);
      expect(_disposeCount, 0);

      // Elapse time up to nearly the delay duration
      fakeAsync.elapse(_delayDuration - const Duration(milliseconds: 10));
      expect(_disposeCount, 0);

      // After the delay has elapsed, the provider should be disposed
      fakeAsync.elapse(const Duration(milliseconds: 10));
      expect(_disposeCount, 1);
    });
  });

  test(
      'GIVEN an auto dispose provider with delay dispose '
      'WHEN the user logs out while the provider has an active listener '
      'THEN the provider is rebuilt immediately', () {
    fakeAsync((fakeAsync) {
      final auth = FakeFirebaseAuth(user: buildUser());
      final container = createContainer(overrides: [auth.providerOverride]);
      final subscription = container.listen(delayDisposeProvider, (_, __) {});

      expect(_rebuildCount, 1);
      expect(_disposeCount, 0);
      expect(_cancelCount, 0);

      // Put the provider in a delayed dispose state by cancelling the listener
      fakeAsync.elapse(_oneEventLoop);

      // Simulate the user logging out
      auth.setUser(null);

      // Riverpod should rebuild the provider in the next event loop
      fakeAsync.elapse(_oneEventLoop);
      expect(_disposeCount, 1);
      expect(_rebuildCount, 2);

      // Tidy up
      subscription.close();
    });
  });

  test(
      'GIVEN an auto dispose provider with delay dispose '
      'WHEN the user logs out while the provider is in a delayed dispose state '
      'THEN the provider is disposed immediately and not rebuilt', () {
    fakeAsync((fakeAsync) {
      final auth = FakeFirebaseAuth(user: buildUser());
      final container = createContainer(overrides: [auth.providerOverride]);
      container.listen(userProvider, (_, __) {});
      final subscription = container.listen(delayDisposeProvider, (_, __) {});

      expect(_rebuildCount, 1);
      expect(_disposeCount, 0);
      expect(_cancelCount, 0);

      // Put the provider in a delayed dispose state by cancelling the listener
      subscription.close();
      fakeAsync.elapse(_oneEventLoop);

      // Simulate the user logging out
      auth.setUser(null);

      // Riverpod should dispose the provider without rebuilding in the next event loop
      fakeAsync.elapse(_oneEventLoop);
      expect(_disposeCount, 1);
      expect(_rebuildCount, 1);
    });
  });

  test(
      'GIVEN an auto dispose provider with delay dispose '
      'WHEN upstream data changes while the provider has an active listener '
      'THEN the provider is rebuilt immediately', () {
    fakeAsync((fakeAsync) {
      final auth = FakeFirebaseAuth(user: buildUser());
      final container = createContainer(overrides: [auth.providerOverride]);
      final subscription = container.listen(delayDisposeProvider, (_, __) {});

      expect(_rebuildCount, 1);
      expect(_disposeCount, 0);

      // Simulate upstream data changing
      _upstreamController.add(42);

      // Riverpod should rebuild the provider in the next event loop
      fakeAsync.elapse(_oneEventLoop);
      expect(_disposeCount, 1);
      expect(_rebuildCount, 2);

      // Tidy up
      subscription.close();
    });
  });

  test(
      'GIVEN an auto dispose provider with delay dispose '
      'WHEN upstream data changes while the provider is in a delayed dispose state '
      'THEN the provider is disposed immediately and not rebuilt', () {
    fakeAsync((fakeAsync) {
      final auth = FakeFirebaseAuth(user: buildUser());
      final container = createContainer(overrides: [auth.providerOverride]);
      container.listen(upstreamProvider, (_, __) {});
      final subscription = container.listen(delayDisposeProvider, (_, __) {});

      expect(_rebuildCount, 1);

      // Put the provider in a delayed dispose state by cancelling the listener
      subscription.close();
      fakeAsync.elapse(_oneEventLoop);
      expect(_disposeCount, 0);

      // Simulate upstream data changing
      _upstreamController.add(42);

      // Riverpod should dispose the provider without rebuilding in the next event loop
      fakeAsync.elapse(_oneEventLoop);
      expect(_disposeCount, 1);
      expect(_rebuildCount, 1);
    });
  });

  test(
      'GIVEN an auto dispose provider with delay dispose '
      'WHEN there are multiple upstream data changes while the provider is in a delayed dispose state '
      'THEN the provider is disposed only once and not rebuilt', () {
    fakeAsync((fakeAsync) {
      final auth = FakeFirebaseAuth(user: buildUser());
      final container = createContainer(overrides: [auth.providerOverride]);
      container.listen(userProvider, (_, __) {});
      final subscription = container.listen(delayDisposeProvider, (_, __) {});

      expect(_rebuildCount, 1);

      // Put the provider in a delayed dispose state by cancelling the listener
      subscription.close();
      fakeAsync.elapse(_oneEventLoop);
      expect(_disposeCount, 0);

      // Simulate upstream data changing multiple times
      _upstreamController.add(42);
      fakeAsync.elapse(_oneEventLoop);
      _upstreamController.add(43);
      fakeAsync.elapse(_oneEventLoop);
      _upstreamController.add(44);
      fakeAsync.elapse(_oneEventLoop);

      // The provider should have been disposed only once and not rebuilt
      expect(_disposeCount, 1);
      expect(_rebuildCount, 1);
    });
  });

  test(
      'GIVEN an auto dispose provider with delay dispose '
      'WHEN a new listener attaches while the provider is in a delayed dispose state '
      'THEN it should immediately receive the cached value without rebuilding the provider', () {
    fakeAsync((fakeAsync) {
      final auth = FakeFirebaseAuth(user: buildUser());
      final container = createContainer(overrides: [auth.providerOverride]);
      int emittedValue = 0;
      final subscription = container.listen(delayDisposeProvider, (_, newState) {
        emittedValue = newState;
      });
      expect(_rebuildCount, 1);

      // Add a value to the provider which should cause a dispose and rebuild
      _upstreamController.add(42);
      fakeAsync.elapse(_oneEventLoop);
      expect(emittedValue, 42);
      expect(_disposeCount, 1);
      expect(_cancelCount, 0);
      expect(_rebuildCount, 2);

      // Put the provider in a delayed dispose state by cancelling the listener, which should
      // cancel but not dispose the provider
      subscription.close();
      fakeAsync.elapse(_oneEventLoop);
      expect(_cancelCount, 1);
      expect(_disposeCount, 1);

      // When a new listener is added it should immediately receive the cached value without needing
      // to rebuild the provider
      int nextListenerEmittedValue = 0;
      final nextSubscription = container.listen(
        delayDisposeProvider,
        (_, newState) {
          nextListenerEmittedValue = newState;
        },
        fireImmediately: true,
      );
      expect(nextListenerEmittedValue, 42);
      expect(_rebuildCount, 2);

      // Tidy up
      nextSubscription.close();
    });
  });

  test(
      'GIVEN an auto dispose provider with delay dispose '
      'AND the provider is in a delayed dispose state '
      'WHEN upstream data changes while the upstream is listened to '
      'AND a new downstream listener is subsequently attached '
      'THEN it should immediately rebuild the provider with the upstream data', () {
    fakeAsync((fakeAsync) {
      final auth = FakeFirebaseAuth(user: buildUser());
      final container = createContainer(overrides: [auth.providerOverride]);
      // The upstream provider must be listened to; otherwise it pauses its internal Stream
      // subscription and does not receive updates emitted on the Stream.
      container.listen(upstreamProvider, (_, __) {});
      int emittedValue = 0;
      final subscription = container.listen(delayDisposeProvider, (_, newState) {
        emittedValue = newState;
      });
      expect(_rebuildCount, 1);

      // Add a value to the provider which should cause a dispose and rebuild
      _upstreamController.add(42);
      fakeAsync.elapse(_oneEventLoop);
      expect(emittedValue, 42);
      expect(_disposeCount, 1);
      expect(_cancelCount, 0);
      expect(_rebuildCount, 2);

      // Put the provider in a delayed dispose state by cancelling the listener, which should
      // cancel but not dispose the provider
      subscription.close();
      fakeAsync.elapse(_oneEventLoop);
      expect(_cancelCount, 1);
      expect(_disposeCount, 1);

      // Simulate upstream data changing again while the provider is in a delayed dispose state.
      // This should dipose but not rebuild the provider
      _upstreamController.add(43);
      fakeAsync.elapse(_oneEventLoop);
      expect(_disposeCount, 2);
      expect(_rebuildCount, 2);

      // When a new listener is added the provider should be rebuilt with the new upstream data
      int nextListenerEmittedValue = 0;
      final nextSubscription = container.listen(
        delayDisposeProvider,
        (_, newState) {
          nextListenerEmittedValue = newState;
        },
        fireImmediately: true,
      );
      fakeAsync.elapse(_oneEventLoop);
      expect(nextListenerEmittedValue, 43);
      expect(_rebuildCount, 3);

      // Tidy up
      nextSubscription.close();
    });
  });
}
