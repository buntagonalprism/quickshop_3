import 'dart:async';

import 'package:riverpod/misc.dart';
import 'package:riverpod/riverpod.dart';

import '../application/user_notifier.dart';

extension DelayProviderDisposeExtension on Ref {
  /// Delay disposal of this provider for the specified [duration]. This means the provider state is
  /// maintained for the duration after all listeners have stopped listening to it, preventing
  /// the need to recompute the value from scratch if the user accesses the data again within the
  /// time period.
  ///
  /// When providers have no active listeners they do not recompute their value when upsteam
  /// providers change; they only call [onDispose] on the current value to mark it as out-of-date.
  /// Therefore a provider in a delayed disposal state merely maintains the value it had
  /// when the last listener disconnected - i.e. when [onCancel] was called. A new value will only
  /// be rebuilt with the new upstream data once a new listener is connected again.
  ///
  /// When a provider [onDispose] is invoked, all existing keepAlive links are removed, so the
  /// provider will not be notified again of any further upstream changes until a new listener is
  /// connected again. If using Firestore as an upstream data source, this means the query snapshot
  /// listener stays active until the data changes, then the snapshot listener is released.
  void delayDispose(Duration duration) {
    KeepAliveLink? link;
    Timer? timer;

    // Disable the delay if the user is not logged in
    final String? userId = watch(userProvider.select((user) => user?.id));
    if (userId == null) {
      return;
    }

    // When the provider is paused the keep alive link is created to maintain the provider state
    // until the duration elapses. Once the keep alive link is closed, if there are no new listeners
    // the provider will be fully disposed of (i.e. state will be removed from memory).
    // If a new listener is added then removed again before the original duration elapses, the
    // original keep alive link is closed and a new one is created while restarting the timer.
    onCancel(() {
      link?.close();
      timer?.cancel();
      link = keepAlive();
      timer = Timer(duration, () {
        link?.close();
        link = null;
        timer = null;
      });
    });

    // When the provider is disposed due to a rebuild triggered by upstream changes, release the
    // keep alive link if it exists since the data is now out-of-date.
    // If the provider is being fully disposed of when there are no current listeners and the
    // keepAlive timer has already expired, then the link and timer will already be null.
    onDispose(() {
      link?.close();
      timer?.cancel();
      link = null;
      timer = null;
    });
  }
}
