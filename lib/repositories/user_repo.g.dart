// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$authUserStreamHash() => r'1367a1a9c96ec782c20b75803f37524c726f2801';

/// See also [_authUserStream].
@ProviderFor(_authUserStream)
final _authUserStreamProvider = AutoDisposeStreamProvider<auth.User?>.internal(
  _authUserStream,
  name: r'_authUserStreamProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authUserStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef _AuthUserStreamRef = AutoDisposeStreamProviderRef<auth.User?>;
String _$loggedInHash() => r'8c22c9aad479fb7111ffc5c612566c3ec10e27e5';

/// See also [loggedIn].
@ProviderFor(loggedIn)
final loggedInProvider = Provider<bool>.internal(
  loggedIn,
  name: r'loggedInProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$loggedInHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef LoggedInRef = ProviderRef<bool>;
String _$userIdHash() => r'b27febb8593f47be578a053cf5f048eeb0d4119e';

/// See also [userId].
@ProviderFor(userId)
final userIdProvider = Provider<String?>.internal(
  userId,
  name: r'userIdProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userIdHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UserIdRef = ProviderRef<String?>;
String _$userRepoHash() => r'533462564fc1d392cd9a22f04f03f6c830fa5c4a';

/// See also [UserRepo].
@ProviderFor(UserRepo)
final userRepoProvider = NotifierProvider<UserRepo, User?>.internal(
  UserRepo.new,
  name: r'userRepoProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userRepoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UserRepo = Notifier<User?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
