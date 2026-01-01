import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod/riverpod.dart';

import '../utilities/create_provider_container.dart';

int _rebuildCount = 0;
int _disposeCount = 0;
int _cancelCount = 0;

final testProvider = Provider.autoDispose((ref) {
  _rebuildCount++;
  ref.onDispose(() {
    _disposeCount++;
  });
  ref.onCancel(() {
    _cancelCount++;
  });
  return 42;
});

void main() {
  setUp(() {
    _rebuildCount = 0;
    _disposeCount = 0;
    _cancelCount = 0;
  });

  test('GIVEN an auto dispose provider '
      'WHEN a listener is attached '
      'THEN it is built for the first time', () {
    fakeAsync((fakeAsync) {
      final container = createContainer();

      // Ensure there are no pending operations
      fakeAsync.flushMicrotasks();
      fakeAsync.flushTimers();

      // The provider should not have been built build when there are no listeners
      expect(_rebuildCount, 0);

      // Attaching a listener should initialise the provider
      final subscription = container.listen(testProvider, (_, _) {});
      expect(_rebuildCount, 1);

      subscription.close();
    });
  });

  test('GIVEN an auto dispose provider '
      'WHEN the last listener is detached '
      'THEN it disposes itself', () {
    fakeAsync((async) {
      final container = createContainer();

      // Create the subscription on the provider, triggering its build
      final subscription = container.listen(testProvider, (_, _) {});
      expect(_rebuildCount, 1);
      expect(_disposeCount, 0);
      expect(_cancelCount, 0);

      // Cancel the subscription. This synchronously calls onCancel in the provider
      subscription.close();
      expect(_cancelCount, 1);
      expect(_disposeCount, 0);

      // Elapse a small time period to trigger the dispose.
      //
      // Riverpod internally schedules disposal of a provider until the next event loop or the next
      // Flutter frame build, giving time for any other listeners to subscribe before the provider
      // is disposed.
      //
      // flushMicrotasks is insufficient - riverpod wraps the disposal operation in a Future, which
      // internally schedules on the next event loop using Timer.run, so we need to flush timers
      // by simulating a small amount of time passing. We could use flushTimers, but this flushes
      // all timers no matter how long they are scheduled for, meaning this test would not be able
      // to prove whether diposal occurred *soon* or *eventually*.
      async.elapse(const Duration(milliseconds: 1));
      expect(_disposeCount, 1);
      expect(_cancelCount, 1);
    });
  });
}
