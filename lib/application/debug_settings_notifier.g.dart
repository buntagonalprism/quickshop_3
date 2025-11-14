// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'debug_settings_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DebugSettingsNotifier)
const debugSettingsProvider = DebugSettingsNotifierFamily._();

final class DebugSettingsNotifierProvider
    extends $NotifierProvider<DebugSettingsNotifier, bool> {
  const DebugSettingsNotifierProvider._(
      {required DebugSettingsNotifierFamily super.from,
      required DebugSetting super.argument})
      : super(
          retry: null,
          name: r'debugSettingsProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$debugSettingsNotifierHash();

  @override
  String toString() {
    return r'debugSettingsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  DebugSettingsNotifier create() => DebugSettingsNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is DebugSettingsNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$debugSettingsNotifierHash() =>
    r'da9cdca9f65a51a314c7ec8898c2e4352e8897d5';

final class DebugSettingsNotifierFamily extends $Family
    with
        $ClassFamilyOverride<DebugSettingsNotifier, bool, bool, bool,
            DebugSetting> {
  const DebugSettingsNotifierFamily._()
      : super(
          retry: null,
          name: r'debugSettingsProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: false,
        );

  DebugSettingsNotifierProvider call(
    DebugSetting type,
  ) =>
      DebugSettingsNotifierProvider._(argument: type, from: this);

  @override
  String toString() => r'debugSettingsProvider';
}

abstract class _$DebugSettingsNotifier extends $Notifier<bool> {
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
