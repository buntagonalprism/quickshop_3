// GENERATED CODE - DO NOT MODIFY BY HAND

// coverage:ignore-file
// dart format off

part of 'suggestions_sync_use_case.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(suggestionsSyncUseCase)
final suggestionsSyncUseCaseProvider = SuggestionsSyncUseCaseProvider._();

final class SuggestionsSyncUseCaseProvider
    extends
        $FunctionalProvider<
          SuggestionsSyncUseCase,
          SuggestionsSyncUseCase,
          SuggestionsSyncUseCase
        >
    with $Provider<SuggestionsSyncUseCase> {
  SuggestionsSyncUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'suggestionsSyncUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$suggestionsSyncUseCaseHash();

  @$internal
  @override
  $ProviderElement<SuggestionsSyncUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SuggestionsSyncUseCase create(Ref ref) {
    return suggestionsSyncUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SuggestionsSyncUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SuggestionsSyncUseCase>(value),
    );
  }
}

String _$suggestionsSyncUseCaseHash() =>
    r'5e7762b859feaaec751729cf62e7147b4efaa85c';
