import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/user/user.dart';
import '../repositories/user_repo.dart';

part 'user_store.g.dart';

@riverpod
class UserStore extends _$UserStore {
  @override
  User? build() {
    // Watch for changes on the auth user stream, but we can get the current user synchronously.
    final _ = ref.watch(_authUserStreamProvider);
    final userRepo = ref.watch(userRepoProvider);
    final user = userRepo.currentUser;
    if (user == null) {
      throw Exception('User not signed in');
    }
    return user;
  }

  void setUserName(String newName) {
    // Synchnronously update the local state with the new name
    final user = state;
    if (state != null) {
      state = user?.copyWith(name: newName);
    }
    ref.read(userRepoProvider).setUserName(newName);
  }

  void logout() {
    ref.read(userRepoProvider).logout();
    state = null;
  }
}

@Riverpod(keepAlive: true)
bool loggedIn(Ref ref) {
  return ref.watch(userStoreProvider) != null;
}

@Riverpod(keepAlive: true)
String? userId(Ref ref) {
  final user = ref.watch(userStoreProvider);
  return user?.id;
}

@riverpod
Stream<DateTime> _authUserStream(Ref ref) {
  return ref.read(userRepoProvider).userChanges.map((_) => DateTime.now());
}
