// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tooltips_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TooltipsNotifier)
const tooltipsProvider = TooltipsNotifierFamily._();

final class TooltipsNotifierProvider
    extends $NotifierProvider<TooltipsNotifier, bool> {
  const TooltipsNotifierProvider._({
    required TooltipsNotifierFamily super.from,
    required TooltipType super.argument,
  }) : super(
         retry: null,
         name: r'tooltipsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$tooltipsNotifierHash();

  @override
  String toString() {
    return r'tooltipsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  TooltipsNotifier create() => TooltipsNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is TooltipsNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$tooltipsNotifierHash() => r'c55eabee712fe4436d22d0c43c351d779efc5c68';

final class TooltipsNotifierFamily extends $Family
    with $ClassFamilyOverride<TooltipsNotifier, bool, bool, bool, TooltipType> {
  const TooltipsNotifierFamily._()
    : super(
        retry: null,
        name: r'tooltipsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  TooltipsNotifierProvider call(TooltipType type) =>
      TooltipsNotifierProvider._(argument: type, from: this);

  @override
  String toString() => r'tooltipsProvider';
}

abstract class _$TooltipsNotifier extends $Notifier<bool> {
  late final _$args = ref.$arg as TooltipType;
  TooltipType get type => _$args;

  bool build(TooltipType type);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
