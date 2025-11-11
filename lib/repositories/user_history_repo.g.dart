// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_history_repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(userHistory)
const userHistoryProvider = UserHistoryProvider._();

final class UserHistoryProvider extends $FunctionalProvider<
        AsyncValue<UserHistory?>, UserHistory?, Stream<UserHistory?>>
    with $FutureModifier<UserHistory?>, $StreamProvider<UserHistory?> {
  const UserHistoryProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'userHistoryProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$userHistoryHash();

  @$internal
  @override
  $StreamProviderElement<UserHistory?> $createElement(
          $ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<UserHistory?> create(Ref ref) {
    return userHistory(ref);
  }
}

String _$userHistoryHash() => r'0b958856391f782df11cd508dafc78709ff1bf03';
