// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_items_transaction.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(listItemsTransaction)
const listItemsTransactionProvider = ListItemsTransactionProvider._();

final class ListItemsTransactionProvider
    extends
        $FunctionalProvider<
          ListItemsTransaction Function(),
          ListItemsTransaction Function(),
          ListItemsTransaction Function()
        >
    with $Provider<ListItemsTransaction Function()> {
  const ListItemsTransactionProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'listItemsTransactionProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$listItemsTransactionHash();

  @$internal
  @override
  $ProviderElement<ListItemsTransaction Function()> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ListItemsTransaction Function() create(Ref ref) {
    return listItemsTransaction(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ListItemsTransaction Function() value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ListItemsTransaction Function()>(
        value,
      ),
    );
  }
}

String _$listItemsTransactionHash() =>
    r'be9d18eaf11d0bf58657aa8153cc016d8ec31765';
