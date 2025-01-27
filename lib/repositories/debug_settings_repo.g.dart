// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'debug_settings_repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$debugSettingsRepoHash() => r'02c32ad36db7e55d85be39d540505a54306ec52b';

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

abstract class _$DebugSettingsRepo extends BuildlessNotifier<bool> {
  late final DebugSetting type;

  bool build(
    DebugSetting type,
  );
}

/// See also [DebugSettingsRepo].
@ProviderFor(DebugSettingsRepo)
const debugSettingsRepoProvider = DebugSettingsRepoFamily();

/// See also [DebugSettingsRepo].
class DebugSettingsRepoFamily extends Family<bool> {
  /// See also [DebugSettingsRepo].
  const DebugSettingsRepoFamily();

  /// See also [DebugSettingsRepo].
  DebugSettingsRepoProvider call(
    DebugSetting type,
  ) {
    return DebugSettingsRepoProvider(
      type,
    );
  }

  @override
  DebugSettingsRepoProvider getProviderOverride(
    covariant DebugSettingsRepoProvider provider,
  ) {
    return call(
      provider.type,
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
  String? get name => r'debugSettingsRepoProvider';
}

/// See also [DebugSettingsRepo].
class DebugSettingsRepoProvider
    extends NotifierProviderImpl<DebugSettingsRepo, bool> {
  /// See also [DebugSettingsRepo].
  DebugSettingsRepoProvider(
    DebugSetting type,
  ) : this._internal(
          () => DebugSettingsRepo()..type = type,
          from: debugSettingsRepoProvider,
          name: r'debugSettingsRepoProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$debugSettingsRepoHash,
          dependencies: DebugSettingsRepoFamily._dependencies,
          allTransitiveDependencies:
              DebugSettingsRepoFamily._allTransitiveDependencies,
          type: type,
        );

  DebugSettingsRepoProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.type,
  }) : super.internal();

  final DebugSetting type;

  @override
  bool runNotifierBuild(
    covariant DebugSettingsRepo notifier,
  ) {
    return notifier.build(
      type,
    );
  }

  @override
  Override overrideWith(DebugSettingsRepo Function() create) {
    return ProviderOverride(
      origin: this,
      override: DebugSettingsRepoProvider._internal(
        () => create()..type = type,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        type: type,
      ),
    );
  }

  @override
  NotifierProviderElement<DebugSettingsRepo, bool> createElement() {
    return _DebugSettingsRepoProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DebugSettingsRepoProvider && other.type == type;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, type.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin DebugSettingsRepoRef on NotifierProviderRef<bool> {
  /// The parameter `type` of this provider.
  DebugSetting get type;
}

class _DebugSettingsRepoProviderElement
    extends NotifierProviderElement<DebugSettingsRepo, bool>
    with DebugSettingsRepoRef {
  _DebugSettingsRepoProviderElement(super.provider);

  @override
  DebugSetting get type => (origin as DebugSettingsRepoProvider).type;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
