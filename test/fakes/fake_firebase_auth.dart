import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:mocktail/mocktail.dart';
import 'package:quickshop/models/user.dart';
import 'package:quickshop/services/firebase_auth.dart';
import 'package:riverpod/riverpod.dart';

class _MockAuthUser extends Mock implements auth.User {}

User buildUser({String? id, String? displayName, String? email}) {
  return User(
    id: id ?? 'uid',
    name: displayName ?? 'name',
    email: email ?? 'email',
  );
}

/// Fake class for replacing [auth.FirebaseAuth] in tests. Use [providerOverride] to override
/// the default [FirebaseAuthProvider] with an instance of this class
class FakeFirebaseAuth extends Mock implements auth.FirebaseAuth {
  FakeFirebaseAuth({required User? user}) {
    when(() => currentUser).thenAnswer((_) => _getMockAuthUser());
    when(() => authStateChanges()).thenAnswer((_) => _controller.stream);
  }

  late Override providerOverride = firebaseAuthProvider.overrideWith((ref) {
    return this;
  });

  final _controller = StreamController<auth.User?>();
  User? _user;

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

  setUser(User? newUser) {
    _user = newUser;
    _controller.add(_getMockAuthUser());
  }
}
