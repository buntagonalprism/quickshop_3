// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tooltips_repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(tooltipsRepo)
const tooltipsRepoProvider = TooltipsRepoProvider._();

final class TooltipsRepoProvider
    extends $FunctionalProvider<TooltipsRepo, TooltipsRepo, TooltipsRepo>
    with $Provider<TooltipsRepo> {
  const TooltipsRepoProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'tooltipsRepoProvider',
          isAutoDispose: true,
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

String _$tooltipsRepoHash() => r'b3d25d43324242afc390671443316187298da943';
