// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tooltips_repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TooltipsRepo)
const tooltipsRepoProvider = TooltipsRepoFamily._();

final class TooltipsRepoProvider extends $NotifierProvider<TooltipsRepo, bool> {
  const TooltipsRepoProvider._(
      {required TooltipsRepoFamily super.from,
      required TooltipType super.argument})
      : super(
          retry: null,
          name: r'tooltipsRepoProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$tooltipsRepoHash();

  @override
  String toString() {
    return r'tooltipsRepoProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  TooltipsRepo create() => TooltipsRepo();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is TooltipsRepoProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$tooltipsRepoHash() => r'1663a2fd7e3b4b26f937664ae26c09ad9765397e';

final class TooltipsRepoFamily extends $Family
    with $ClassFamilyOverride<TooltipsRepo, bool, bool, bool, TooltipType> {
  const TooltipsRepoFamily._()
      : super(
          retry: null,
          name: r'tooltipsRepoProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  TooltipsRepoProvider call(
    TooltipType type,
  ) =>
      TooltipsRepoProvider._(argument: type, from: this);

  @override
  String toString() => r'tooltipsRepoProvider';
}

abstract class _$TooltipsRepo extends $Notifier<bool> {
  late final _$args = ref.$arg as TooltipType;
  TooltipType get type => _$args;

  bool build(
    TooltipType type,
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
