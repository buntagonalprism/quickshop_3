import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/user/user.dart';
import '../services/firebase_auth.dart';

part 'user_repo.g.dart';

@riverpod
Stream<auth.User?> _authUserStream(Ref ref) {
  return ref.read(firebaseAuthProvider).authStateChanges();
}

@Riverpod(keepAlive: true)
class UserRepo extends _$UserRepo {
  @override
  User? build() {
    // Watch for changes on the auth user stream, but we can get the current user synchronously.
    final _ = ref.watch(_authUserStreamProvider);
    final authUser = ref.read(firebaseAuthProvider).currentUser;
    if (authUser != null) {
      return _fromFirebase(authUser);
    }
    return null;
  }

  void logout() {
    ref.read(firebaseAuthProvider).signOut();

    // In the Flutter Firebase Authentication package for mobile clients, the first time a user
    // signs in with google they are always shown an account selection screen (even if they only
    // have one account). Once the user has logged in with google once, if they then sign out and
    // then signs in again, they are no longer shown the account selection screen. Instead they will
    // be automatically logged in with the same account as before.
    //
    // It is preferable to always show the account selection screen. During testing, it makes it
    // easier to switch between different test accounts. In production, it allows users to maintain
    // different accounts for different purposes. The only drawback is that if a user has signed in
    // once on a device and then signs out accidentally, they will have to select their account
    // again when they sign in, which overall seems an insignificant impact compared to the
    // increased flexibility and ease of testing.
    //
    // To force showing the account selection again, we disconnect the google sign in account. See
    // https://github.com/flutter/flutter/issues/161476#issuecomment-2591358974
    // This method has no effect if the user is not signed in with Google.
    GoogleSignIn().disconnect();
  }

  void setUserName(String name) {
    final user = ref.read(firebaseAuthProvider).currentUser;
    if (user != null) {
      user.updateDisplayName(name);
      // Synchnronously update the local state with the new name
      state = _fromFirebase(user).copyWith(name: name);
    }
  }

  User _fromFirebase(auth.User user) {
    return User(
      id: user.uid,
      name: user.displayName ?? '',
      email: user.email ?? '',
    );
  }
}

@Riverpod(keepAlive: true)
bool loggedIn(Ref ref) {
  return ref.watch(userRepoProvider) != null;
}

@Riverpod(keepAlive: true)
String? userId(Ref ref) {
  final user = ref.watch(userRepoProvider);
  return user?.id;
}
