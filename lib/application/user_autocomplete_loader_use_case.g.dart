// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_autocomplete_loader_use_case.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(userAutcompleteLoaderUseCase)
const userAutcompleteLoaderUseCaseProvider =
    UserAutcompleteLoaderUseCaseProvider._();

final class UserAutcompleteLoaderUseCaseProvider extends $FunctionalProvider<
        UserAutocompleteLoaderUserCase,
        UserAutocompleteLoaderUserCase,
        UserAutocompleteLoaderUserCase>
    with $Provider<UserAutocompleteLoaderUserCase> {
  const UserAutcompleteLoaderUseCaseProvider._()
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
  $ProviderElement<UserAutocompleteLoaderUserCase> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  UserAutocompleteLoaderUserCase create(Ref ref) {
    return userAutcompleteLoaderUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserAutocompleteLoaderUserCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<UserAutocompleteLoaderUserCase>(value),
    );
  }
}

String _$userAutcompleteLoaderUseCaseHash() =>
    r'535df509f936ac56cfdf2fa6cc2077010e1d0992';
