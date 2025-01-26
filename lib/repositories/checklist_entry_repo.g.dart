// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checklist_entry_repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$checklistEntryRepoHash() =>
    r'50f0d206751ca45196a525af5b4048546b579157';

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

abstract class _$ChecklistEntryRepo
    extends BuildlessAutoDisposeStreamNotifier<List<ChecklistEntry>> {
  late final String listId;

  Stream<List<ChecklistEntry>> build(
    String listId,
  );
}

/// See also [ChecklistEntryRepo].
@ProviderFor(ChecklistEntryRepo)
const checklistEntryRepoProvider = ChecklistEntryRepoFamily();

/// See also [ChecklistEntryRepo].
class ChecklistEntryRepoFamily
    extends Family<AsyncValue<List<ChecklistEntry>>> {
  /// See also [ChecklistEntryRepo].
  const ChecklistEntryRepoFamily();

  /// See also [ChecklistEntryRepo].
  ChecklistEntryRepoProvider call(
    String listId,
  ) {
    return ChecklistEntryRepoProvider(
      listId,
    );
  }

  @override
  ChecklistEntryRepoProvider getProviderOverride(
    covariant ChecklistEntryRepoProvider provider,
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
  String? get name => r'checklistEntryRepoProvider';
}

/// See also [ChecklistEntryRepo].
class ChecklistEntryRepoProvider extends AutoDisposeStreamNotifierProviderImpl<
    ChecklistEntryRepo, List<ChecklistEntry>> {
  /// See also [ChecklistEntryRepo].
  ChecklistEntryRepoProvider(
    String listId,
  ) : this._internal(
          () => ChecklistEntryRepo()..listId = listId,
          from: checklistEntryRepoProvider,
          name: r'checklistEntryRepoProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$checklistEntryRepoHash,
          dependencies: ChecklistEntryRepoFamily._dependencies,
          allTransitiveDependencies:
              ChecklistEntryRepoFamily._allTransitiveDependencies,
          listId: listId,
        );

  ChecklistEntryRepoProvider._internal(
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
  Stream<List<ChecklistEntry>> runNotifierBuild(
    covariant ChecklistEntryRepo notifier,
  ) {
    return notifier.build(
      listId,
    );
  }

  @override
  Override overrideWith(ChecklistEntryRepo Function() create) {
    return ProviderOverride(
      origin: this,
      override: ChecklistEntryRepoProvider._internal(
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
  AutoDisposeStreamNotifierProviderElement<ChecklistEntryRepo,
      List<ChecklistEntry>> createElement() {
    return _ChecklistEntryRepoProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ChecklistEntryRepoProvider && other.listId == listId;
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
mixin ChecklistEntryRepoRef
    on AutoDisposeStreamNotifierProviderRef<List<ChecklistEntry>> {
  /// The parameter `listId` of this provider.
  String get listId;
}

class _ChecklistEntryRepoProviderElement
    extends AutoDisposeStreamNotifierProviderElement<ChecklistEntryRepo,
        List<ChecklistEntry>> with ChecklistEntryRepoRef {
  _ChecklistEntryRepoProviderElement(super.provider);

  @override
  String get listId => (origin as ChecklistEntryRepoProvider).listId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
