import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:mocktail/mocktail.dart';
import 'package:quickshop/data/user/models/user_auth.dart';
import 'package:quickshop/services/firebase_auth.dart';
import 'package:riverpod/misc.dart';

class _MockAuthUser extends Mock implements auth.User {}

UserAuth buildUser({String? id, String? displayName, String? email}) {
  return UserAuth(
    id: id ?? 'uid',
    name: displayName ?? 'name',
    email: email ?? 'email',
  );
}

/// Fake class for replacing [auth.FirebaseAuth] in tests. Use [providerOverride] to override
/// the default [FirebaseAuthProvider] with an instance of this class
class FakeFirebaseAuth extends Mock implements auth.FirebaseAuth {
  FakeFirebaseAuth({required UserAuth? user}) {
    _user = user;
    when(() => currentUser).thenAnswer((_) => _getMockAuthUser());
    when(() => authStateChanges()).thenAnswer((_) => _controller.stream);
  }

  late Override providerOverride = firebaseAuthProvider.overrideWith((ref) {
    return this;
  });

  final _controller = StreamController<auth.User?>();
  UserAuth? _user;

  _MockAuthUser? _getMockAuthUser() {
    final user = _user;
    if (user == null) {
      return null;
    }
    final mockAuthUser = _MockAuthUser();
    when(() => mockAuthUser.uid).thenReturn(user.id);
    when(() => mockAuthUser.displayName).thenReturn(user.name);
    when(() => mockAuthUser.email).thenReturn(user.email);
    return mockAuthUser;
  }

  void setUser(UserAuth? newUser) {
    _user = newUser;
    _controller.add(_getMockAuthUser());
  }
}
