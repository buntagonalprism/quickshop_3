// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firestore_transaction.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(firestoreTransaction)
const firestoreTransactionProvider = FirestoreTransactionProvider._();

final class FirestoreTransactionProvider
    extends
        $FunctionalProvider<
          FirestoreTransaction Function(),
          FirestoreTransaction Function(),
          FirestoreTransaction Function()
        >
    with $Provider<FirestoreTransaction Function()> {
  const FirestoreTransactionProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'firestoreTransactionProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$firestoreTransactionHash();

  @$internal
  @override
  $ProviderElement<FirestoreTransaction Function()> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  FirestoreTransaction Function() create(Ref ref) {
    return firestoreTransaction(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FirestoreTransaction Function() value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FirestoreTransaction Function()>(
        value,
      ),
    );
  }
}

String _$firestoreTransactionHash() =>
    r'150985b3814f86208e27355c82ef5f5b36e600c1';
