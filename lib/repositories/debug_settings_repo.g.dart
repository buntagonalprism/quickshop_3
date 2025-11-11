// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'debug_settings_repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DebugSettingsRepo)
const debugSettingsRepoProvider = DebugSettingsRepoFamily._();

final class DebugSettingsRepoProvider
    extends $NotifierProvider<DebugSettingsRepo, bool> {
  const DebugSettingsRepoProvider._(
      {required DebugSettingsRepoFamily super.from,
      required DebugSetting super.argument})
      : super(
          retry: null,
          name: r'debugSettingsRepoProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$debugSettingsRepoHash();

  @override
  String toString() {
    return r'debugSettingsRepoProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  DebugSettingsRepo create() => DebugSettingsRepo();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is DebugSettingsRepoProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$debugSettingsRepoHash() => r'02c32ad36db7e55d85be39d540505a54306ec52b';

final class DebugSettingsRepoFamily extends $Family
    with
        $ClassFamilyOverride<DebugSettingsRepo, bool, bool, bool,
            DebugSetting> {
  const DebugSettingsRepoFamily._()
      : super(
          retry: null,
          name: r'debugSettingsRepoProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: false,
        );

  DebugSettingsRepoProvider call(
    DebugSetting type,
  ) =>
      DebugSettingsRepoProvider._(argument: type, from: this);

  @override
  String toString() => r'debugSettingsRepoProvider';
}

abstract class _$DebugSettingsRepo extends $Notifier<bool> {
  late final _$args = ref.$arg as DebugSetting;
  DebugSetting get type => _$args;

  bool build(
    DebugSetting type,
  );
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(
      _$args,
    );
    final ref = this.ref as $Ref<bool, bool>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<bool, bool>, bool, Object?, Object?>;
    element.handleValue(ref, created);
  }
}
