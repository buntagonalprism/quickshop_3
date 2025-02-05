// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_invite_repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$listInviteByIdHash() => r'cae1b10c96e8d9b39ce064e21e62bf872d461523';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// Load a list invite by its id.
///
/// Will return null if the invite does not exist.
///
/// Copied from [listInviteById].
@ProviderFor(listInviteById)
const listInviteByIdProvider = ListInviteByIdFamily();

/// Load a list invite by its id.
///
/// Will return null if the invite does not exist.
///
/// Copied from [listInviteById].
class ListInviteByIdFamily extends Family<AsyncValue<ListInvite?>> {
  /// Load a list invite by its id.
  ///
  /// Will return null if the invite does not exist.
  ///
  /// Copied from [listInviteById].
  const ListInviteByIdFamily();

  /// Load a list invite by its id.
  ///
  /// Will return null if the invite does not exist.
  ///
  /// Copied from [listInviteById].
  ListInviteByIdProvider call(
    String inviteId,
  ) {
    return ListInviteByIdProvider(
      inviteId,
    );
  }

  @override
  ListInviteByIdProvider getProviderOverride(
    covariant ListInviteByIdProvider provider,
  ) {
    return call(
      provider.inviteId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'listInviteByIdProvider';
}

/// Load a list invite by its id.
///
/// Will return null if the invite does not exist.
///
/// Copied from [listInviteById].
class ListInviteByIdProvider extends AutoDisposeStreamProvider<ListInvite?> {
  /// Load a list invite by its id.
  ///
  /// Will return null if the invite does not exist.
  ///
  /// Copied from [listInviteById].
  ListInviteByIdProvider(
    String inviteId,
  ) : this._internal(
          (ref) => listInviteById(
            ref as ListInviteByIdRef,
            inviteId,
          ),
          from: listInviteByIdProvider,
          name: r'listInviteByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$listInviteByIdHash,
          dependencies: ListInviteByIdFamily._dependencies,
          allTransitiveDependencies:
              ListInviteByIdFamily._allTransitiveDependencies,
          inviteId: inviteId,
        );

  ListInviteByIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.inviteId,
  }) : super.internal();

  final String inviteId;

  @override
  Override overrideWith(
    Stream<ListInvite?> Function(ListInviteByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ListInviteByIdProvider._internal(
        (ref) => create(ref as ListInviteByIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        inviteId: inviteId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<ListInvite?> createElement() {
    return _ListInviteByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ListInviteByIdProvider && other.inviteId == inviteId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, inviteId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ListInviteByIdRef on AutoDisposeStreamProviderRef<ListInvite?> {
  /// The parameter `inviteId` of this provider.
  String get inviteId;
}

class _ListInviteByIdProviderElement
    extends AutoDisposeStreamProviderElement<ListInvite?>
    with ListInviteByIdRef {
  _ListInviteByIdProviderElement(super.provider);

  @override
  String get inviteId => (origin as ListInviteByIdProvider).inviteId;
}

String _$userListInviteByListIdHash() =>
    r'5a13a9867f37a64d07e0092f5f43dbb3a0025355';

/// Load the currently authenticated user's personal list invite for sharing a given list.
///
/// Will return null if the user has not created a sharing link for the list.
///
/// Copied from [userListInviteByListId].
@ProviderFor(userListInviteByListId)
const userListInviteByListIdProvider = UserListInviteByListIdFamily();

/// Load the currently authenticated user's personal list invite for sharing a given list.
///
/// Will return null if the user has not created a sharing link for the list.
///
/// Copied from [userListInviteByListId].
class UserListInviteByListIdFamily extends Family<AsyncValue<ListInvite?>> {
  /// Load the currently authenticated user's personal list invite for sharing a given list.
  ///
  /// Will return null if the user has not created a sharing link for the list.
  ///
  /// Copied from [userListInviteByListId].
  const UserListInviteByListIdFamily();

  /// Load the currently authenticated user's personal list invite for sharing a given list.
  ///
  /// Will return null if the user has not created a sharing link for the list.
  ///
  /// Copied from [userListInviteByListId].
  UserListInviteByListIdProvider call(
    String listId,
  ) {
    return UserListInviteByListIdProvider(
      listId,
    );
  }

  @override
  UserListInviteByListIdProvider getProviderOverride(
    covariant UserListInviteByListIdProvider provider,
  ) {
    return call(
      provider.listId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'userListInviteByListIdProvider';
}

/// Load the currently authenticated user's personal list invite for sharing a given list.
///
/// Will return null if the user has not created a sharing link for the list.
///
/// Copied from [userListInviteByListId].
class UserListInviteByListIdProvider
    extends AutoDisposeStreamProvider<ListInvite?> {
  /// Load the currently authenticated user's personal list invite for sharing a given list.
  ///
  /// Will return null if the user has not created a sharing link for the list.
  ///
  /// Copied from [userListInviteByListId].
  UserListInviteByListIdProvider(
    String listId,
  ) : this._internal(
          (ref) => userListInviteByListId(
            ref as UserListInviteByListIdRef,
            listId,
          ),
          from: userListInviteByListIdProvider,
          name: r'userListInviteByListIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$userListInviteByListIdHash,
          dependencies: UserListInviteByListIdFamily._dependencies,
          allTransitiveDependencies:
              UserListInviteByListIdFamily._allTransitiveDependencies,
          listId: listId,
        );

  UserListInviteByListIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.listId,
  }) : super.internal();

  final String listId;

  @override
  Override overrideWith(
    Stream<ListInvite?> Function(UserListInviteByListIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UserListInviteByListIdProvider._internal(
        (ref) => create(ref as UserListInviteByListIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        listId: listId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<ListInvite?> createElement() {
    return _UserListInviteByListIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UserListInviteByListIdProvider && other.listId == listId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, listId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin UserListInviteByListIdRef on AutoDisposeStreamProviderRef<ListInvite?> {
  /// The parameter `listId` of this provider.
  String get listId;
}

class _UserListInviteByListIdProviderElement
    extends AutoDisposeStreamProviderElement<ListInvite?>
    with UserListInviteByListIdRef {
  _UserListInviteByListIdProviderElement(super.provider);

  @override
  String get listId => (origin as UserListInviteByListIdProvider).listId;
}

String _$listInviteRepoHash() => r'05576e133a43a8018739672e680b984c37c4542c';

/// See also [listInviteRepo].
@ProviderFor(listInviteRepo)
final listInviteRepoProvider = AutoDisposeProvider<ListInviteRepo>.internal(
  listInviteRepo,
  name: r'listInviteRepoProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$listInviteRepoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ListInviteRepoRef = AutoDisposeProviderRef<ListInviteRepo>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
