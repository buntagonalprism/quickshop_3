// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hidden_suggestions_repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(hiddenSuggestionsRepo)
const hiddenSuggestionsRepoProvider = HiddenSuggestionsRepoProvider._();

final class HiddenSuggestionsRepoProvider extends $FunctionalProvider<
    HiddenSuggestionsRepo,
    HiddenSuggestionsRepo,
    HiddenSuggestionsRepo> with $Provider<HiddenSuggestionsRepo> {
  const HiddenSuggestionsRepoProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'hiddenSuggestionsRepoProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$hiddenSuggestionsRepoHash();

  @$internal
  @override
  $ProviderElement<HiddenSuggestionsRepo> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  HiddenSuggestionsRepo create(Ref ref) {
    return hiddenSuggestionsRepo(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(HiddenSuggestionsRepo value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<HiddenSuggestionsRepo>(value),
    );
  }
}

String _$hiddenSuggestionsRepoHash() =>
    r'38862d8049198eeadb30bea7ab5b0eb7b2fa9d4d';
