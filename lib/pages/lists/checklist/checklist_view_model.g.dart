// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checklist_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$checklistViewModelHash() =>
    r'9d3dd0fd13257e4422d8560aa17b6827569211fa';

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

/// See also [checklistViewModel].
@ProviderFor(checklistViewModel)
const checklistViewModelProvider = ChecklistViewModelFamily();

/// See also [checklistViewModel].
class ChecklistViewModelFamily extends Family<ChecklistViewModel> {
  /// See also [checklistViewModel].
  const ChecklistViewModelFamily();

  /// See also [checklistViewModel].
  ChecklistViewModelProvider call(
    String listId,
  ) {
    return ChecklistViewModelProvider(
      listId,
    );
  }

  @override
  ChecklistViewModelProvider getProviderOverride(
    covariant ChecklistViewModelProvider provider,
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
  String? get name => r'checklistViewModelProvider';
}

/// See also [checklistViewModel].
class ChecklistViewModelProvider
    extends AutoDisposeProvider<ChecklistViewModel> {
  /// See also [checklistViewModel].
  ChecklistViewModelProvider(
    String listId,
  ) : this._internal(
          (ref) => checklistViewModel(
            ref as ChecklistViewModelRef,
            listId,
          ),
          from: checklistViewModelProvider,
          name: r'checklistViewModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$checklistViewModelHash,
          dependencies: ChecklistViewModelFamily._dependencies,
          allTransitiveDependencies:
              ChecklistViewModelFamily._allTransitiveDependencies,
          listId: listId,
        );

  ChecklistViewModelProvider._internal(
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
    ChecklistViewModel Function(ChecklistViewModelRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ChecklistViewModelProvider._internal(
        (ref) => create(ref as ChecklistViewModelRef),
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
  AutoDisposeProviderElement<ChecklistViewModel> createElement() {
    return _ChecklistViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ChecklistViewModelProvider && other.listId == listId;
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
mixin ChecklistViewModelRef on AutoDisposeProviderRef<ChecklistViewModel> {
  /// The parameter `listId` of this provider.
  String get listId;
}

class _ChecklistViewModelProviderElement
    extends AutoDisposeProviderElement<ChecklistViewModel>
    with ChecklistViewModelRef {
  _ChecklistViewModelProviderElement(super.provider);

  @override
  String get listId => (origin as ChecklistViewModelProvider).listId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
