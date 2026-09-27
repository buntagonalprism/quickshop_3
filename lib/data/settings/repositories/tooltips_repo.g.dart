// GENERATED CODE - DO NOT MODIFY BY HAND

// coverage:ignore-file
// dart format off

part of 'tooltips_repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(tooltipsRepo)
final tooltipsRepoProvider = TooltipsRepoProvider._();

final class TooltipsRepoProvider
    extends $FunctionalProvider<TooltipsRepo, TooltipsRepo, TooltipsRepo>
    with $Provider<TooltipsRepo> {
  TooltipsRepoProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tooltipsRepoProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tooltipsRepoHash();

  @$internal
  @override
  $ProviderElement<TooltipsRepo> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  TooltipsRepo create(Ref ref) {
    return tooltipsRepo(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TooltipsRepo value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TooltipsRepo>(value),
    );
  }
}

String _$tooltipsRepoHash() => r'0f32ff93c9f669eccde379f45d0018d303f5926e';
