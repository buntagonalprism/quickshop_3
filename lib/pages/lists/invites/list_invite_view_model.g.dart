// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_invite_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$listInviteStateHash() => r'063bb25f7235893cb9b2c0e593bc8fd6d147f74d';

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

/// See also [listInviteState].
@ProviderFor(listInviteState)
const listInviteStateProvider = ListInviteStateFamily();

/// See also [listInviteState].
class ListInviteStateFamily extends Family<ListInviteViewModel> {
  /// See also [listInviteState].
  const ListInviteStateFamily();

  /// See also [listInviteState].
  ListInviteStateProvider call(
    String inviteId,
  ) {
    return ListInviteStateProvider(
      inviteId,
    );
  }

  @override
  ListInviteStateProvider getProviderOverride(
    covariant ListInviteStateProvider provider,
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
  String? get name => r'listInviteStateProvider';
}

/// See also [listInviteState].
class ListInviteStateProvider extends AutoDisposeProvider<ListInviteViewModel> {
  /// See also [listInviteState].
  ListInviteStateProvider(
    String inviteId,
  ) : this._internal(
          (ref) => listInviteState(
            ref as ListInviteStateRef,
            inviteId,
          ),
          from: listInviteStateProvider,
          name: r'listInviteStateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$listInviteStateHash,
          dependencies: ListInviteStateFamily._dependencies,
          allTransitiveDependencies:
              ListInviteStateFamily._allTransitiveDependencies,
          inviteId: inviteId,
        );

  ListInviteStateProvider._internal(
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
    ListInviteViewModel Function(ListInviteStateRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ListInviteStateProvider._internal(
        (ref) => create(ref as ListInviteStateRef),
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
  AutoDisposeProviderElement<ListInviteViewModel> createElement() {
    return _ListInviteStateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ListInviteStateProvider && other.inviteId == inviteId;
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
mixin ListInviteStateRef on AutoDisposeProviderRef<ListInviteViewModel> {
  /// The parameter `inviteId` of this provider.
  String get inviteId;
}

class _ListInviteStateProviderElement
    extends AutoDisposeProviderElement<ListInviteViewModel>
    with ListInviteStateRef {
  _ListInviteStateProviderElement(super.provider);

  @override
  String get inviteId => (origin as ListInviteStateProvider).inviteId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
