import 'dart:async';

import 'package:riverpod/riverpod.dart';

import 'user_repo.dart';

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
  void delayDispose(Duration duration) {
    KeepAliveLink? link;
    Timer? timer;

    // Disable the delay if the user is not logged in
    final String? userId = watch(userRepoProvider.select((user) => user?.id));
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
  }
}
