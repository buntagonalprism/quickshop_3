// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_transaction.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(userProfileTransaction)
const userProfileTransactionProvider = UserProfileTransactionProvider._();

final class UserProfileTransactionProvider
    extends
        $FunctionalProvider<
          UserProfileTransaction Function(),
          UserProfileTransaction Function(),
          UserProfileTransaction Function()
        >
    with $Provider<UserProfileTransaction Function()> {
  const UserProfileTransactionProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userProfileTransactionProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userProfileTransactionHash();

  @$internal
  @override
  $ProviderElement<UserProfileTransaction Function()> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  UserProfileTransaction Function() create(Ref ref) {
    return userProfileTransaction(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserProfileTransaction Function() value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserProfileTransaction Function()>(
        value,
      ),
    );
  }
}

String _$userProfileTransactionHash() =>
    r'e99dcc430318c4f39027a068f762af2aa30e00f3';
