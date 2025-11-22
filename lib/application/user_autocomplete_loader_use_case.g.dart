// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_autocomplete_loader_use_case.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(userAutcompleteLoaderUseCase)
const userAutcompleteLoaderUseCaseProvider = UserHistoryLoaderUseCaseProvider._();

final class UserHistoryLoaderUseCaseProvider extends $FunctionalProvider<UserAutocompleteLoaderUserCase,
    UserAutocompleteLoaderUserCase, UserAutocompleteLoaderUserCase> with $Provider<UserAutocompleteLoaderUserCase> {
  const UserHistoryLoaderUseCaseProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'userAutcompleteLoaderUseCaseProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$userAutcompleteLoaderUseCaseHash();

  @$internal
  @override
  $ProviderElement<UserAutocompleteLoaderUserCase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  UserAutocompleteLoaderUserCase create(Ref ref) {
    return userAutcompleteLoaderUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserAutocompleteLoaderUserCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserAutocompleteLoaderUserCase>(value),
    );
  }
}

String _$userAutcompleteLoaderUseCaseHash() => r'1d958bd847c907afe42edbc26c8bbe09a8fc30d7';
