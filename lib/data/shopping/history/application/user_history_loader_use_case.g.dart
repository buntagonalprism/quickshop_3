// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_history_loader_use_case.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(userAutcompleteLoaderUseCase)
const userAutcompleteLoaderUseCaseProvider =
    UserAutcompleteLoaderUseCaseProvider._();

final class UserAutcompleteLoaderUseCaseProvider
    extends
        $FunctionalProvider<
          UserHistoryLoaderUseCase,
          UserHistoryLoaderUseCase,
          UserHistoryLoaderUseCase
        >
    with $Provider<UserHistoryLoaderUseCase> {
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
  $ProviderElement<UserHistoryLoaderUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  UserHistoryLoaderUseCase create(Ref ref) {
    return userAutcompleteLoaderUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserHistoryLoaderUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserHistoryLoaderUseCase>(value),
    );
  }
}

String _$userAutcompleteLoaderUseCaseHash() =>
    r'0aab69bf4a547faec20094376bfd2c81c1299689';
