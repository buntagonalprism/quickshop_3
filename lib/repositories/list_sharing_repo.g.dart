// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_sharing_repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$listSharingRepoHash() => r'76cad44b87a256a6d1741b511a9cb97ba774366c';

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

abstract class _$ListSharingRepo
    extends BuildlessAutoDisposeStreamNotifier<ListInvite?> {
  late final String listId;

  Stream<ListInvite?> build(
    String listId,
  );
}

/// A repository that handles sharing lists with other users. The output of this repository
/// is a [ListInvite] object that represents the sharing link for a given list, if it exists.
///
/// Copied from [ListSharingRepo].
@ProviderFor(ListSharingRepo)
const listSharingRepoProvider = ListSharingRepoFamily();

/// A repository that handles sharing lists with other users. The output of this repository
/// is a [ListInvite] object that represents the sharing link for a given list, if it exists.
///
/// Copied from [ListSharingRepo].
class ListSharingRepoFamily extends Family<AsyncValue<ListInvite?>> {
  /// A repository that handles sharing lists with other users. The output of this repository
  /// is a [ListInvite] object that represents the sharing link for a given list, if it exists.
  ///
  /// Copied from [ListSharingRepo].
  const ListSharingRepoFamily();

  /// A repository that handles sharing lists with other users. The output of this repository
  /// is a [ListInvite] object that represents the sharing link for a given list, if it exists.
  ///
  /// Copied from [ListSharingRepo].
  ListSharingRepoProvider call(
    String listId,
  ) {
    return ListSharingRepoProvider(
      listId,
    );
  }

  @override
  ListSharingRepoProvider getProviderOverride(
    covariant ListSharingRepoProvider provider,
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
  String? get name => r'listSharingRepoProvider';
}

/// A repository that handles sharing lists with other users. The output of this repository
/// is a [ListInvite] object that represents the sharing link for a given list, if it exists.
///
/// Copied from [ListSharingRepo].
class ListSharingRepoProvider extends AutoDisposeStreamNotifierProviderImpl<
    ListSharingRepo, ListInvite?> {
  /// A repository that handles sharing lists with other users. The output of this repository
  /// is a [ListInvite] object that represents the sharing link for a given list, if it exists.
  ///
  /// Copied from [ListSharingRepo].
  ListSharingRepoProvider(
    String listId,
  ) : this._internal(
          () => ListSharingRepo()..listId = listId,
          from: listSharingRepoProvider,
          name: r'listSharingRepoProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$listSharingRepoHash,
          dependencies: ListSharingRepoFamily._dependencies,
          allTransitiveDependencies:
              ListSharingRepoFamily._allTransitiveDependencies,
          listId: listId,
        );

  ListSharingRepoProvider._internal(
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
  Stream<ListInvite?> runNotifierBuild(
    covariant ListSharingRepo notifier,
  ) {
    return notifier.build(
      listId,
    );
  }

  @override
  Override overrideWith(ListSharingRepo Function() create) {
    return ProviderOverride(
      origin: this,
      override: ListSharingRepoProvider._internal(
        () => create()..listId = listId,
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
  AutoDisposeStreamNotifierProviderElement<ListSharingRepo, ListInvite?>
      createElement() {
    return _ListSharingRepoProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ListSharingRepoProvider && other.listId == listId;
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
mixin ListSharingRepoRef on AutoDisposeStreamNotifierProviderRef<ListInvite?> {
  /// The parameter `listId` of this provider.
  String get listId;
}

class _ListSharingRepoProviderElement
    extends AutoDisposeStreamNotifierProviderElement<ListSharingRepo,
        ListInvite?> with ListSharingRepoRef {
  _ListSharingRepoProviderElement(super.provider);

  @override
  String get listId => (origin as ListSharingRepoProvider).listId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
