// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_store.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$loggedInHash() => r'86b566fda11db01a0e99100bd0f5452e28b6d893';

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
String _$userIdHash() => r'aa7be4bd7d01d3a5c33261b0e3890be0e66306be';

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
String _$authUserStreamHash() => r'c3555eaac82d497b103fb6f1af3eee4781acd6ba';

/// See also [_authUserStream].
@ProviderFor(_authUserStream)
final _authUserStreamProvider = AutoDisposeStreamProvider<DateTime>.internal(
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
typedef _AuthUserStreamRef = AutoDisposeStreamProviderRef<DateTime>;
String _$userStoreHash() => r'f2eaaed1bd1605339b6b450f5184d3e70858280d';

/// See also [UserStore].
@ProviderFor(UserStore)
final userStoreProvider =
    AutoDisposeNotifierProvider<UserStore, User?>.internal(
  UserStore.new,
  name: r'userStoreProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userStoreHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UserStore = AutoDisposeNotifier<User?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
