import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/user/user.dart';
import '../services/auth_service.dart';

part 'user_notifier.g.dart';

@riverpod
class UserNotifier extends _$UserNotifier {
  @override
  User? build() {
    return ref.watch(authUserProvider);
  }

  void setUserName(String newName) {
    // Synchnronously update the local state with the new name
    final user = state;
    if (state != null) {
      state = user?.copyWith(name: newName);
    }
    ref.read(authServiceProvider).setUserName(newName);
  }

  void logout() {
    ref.read(authServiceProvider).logout();
    state = null;
  }
}
