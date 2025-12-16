// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hidden_suggestions_use_case.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(hiddenSuggestionsUseCase)
const hiddenSuggestionsUseCaseProvider = HiddenSuggestionsUseCaseProvider._();

final class HiddenSuggestionsUseCaseProvider extends $FunctionalProvider<
    HiddenSuggestionsUseCase,
    HiddenSuggestionsUseCase,
    HiddenSuggestionsUseCase> with $Provider<HiddenSuggestionsUseCase> {
  const HiddenSuggestionsUseCaseProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'hiddenSuggestionsUseCaseProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$hiddenSuggestionsUseCaseHash();

  @$internal
  @override
  $ProviderElement<HiddenSuggestionsUseCase> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  HiddenSuggestionsUseCase create(Ref ref) {
    return hiddenSuggestionsUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(HiddenSuggestionsUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<HiddenSuggestionsUseCase>(value),
    );
  }
}

String _$hiddenSuggestionsUseCaseHash() =>
    r'e856b797031cbb27c9fabc82cb694ff0313ca712';
