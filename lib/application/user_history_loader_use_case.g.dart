// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_history_loader_use_case.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(userHistoryLoaderUseCase)
const userHistoryLoaderUseCaseProvider = UserHistoryLoaderUseCaseProvider._();

final class UserHistoryLoaderUseCaseProvider extends $FunctionalProvider<
    UserHistoryLoaderUseCase,
    UserHistoryLoaderUseCase,
    UserHistoryLoaderUseCase> with $Provider<UserHistoryLoaderUseCase> {
  const UserHistoryLoaderUseCaseProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'userHistoryLoaderUseCaseProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$userHistoryLoaderUseCaseHash();

  @$internal
  @override
  $ProviderElement<UserHistoryLoaderUseCase> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  UserHistoryLoaderUseCase create(Ref ref) {
    return userHistoryLoaderUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserHistoryLoaderUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserHistoryLoaderUseCase>(value),
    );
  }
}

String _$userHistoryLoaderUseCaseHash() =>
    r'1d958bd847c907afe42edbc26c8bbe09a8fc30d7';
