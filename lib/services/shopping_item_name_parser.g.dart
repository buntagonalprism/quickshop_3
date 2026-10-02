// GENERATED CODE - DO NOT MODIFY BY HAND

// coverage:ignore-file
// dart format off

part of 'shopping_item_name_parser.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(shoppingItemNameParser)
final shoppingItemNameParserProvider = ShoppingItemNameParserProvider._();

final class ShoppingItemNameParserProvider
    extends
        $FunctionalProvider<
          ShoppingItemNameParser,
          ShoppingItemNameParser,
          ShoppingItemNameParser
        >
    with $Provider<ShoppingItemNameParser> {
  ShoppingItemNameParserProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'shoppingItemNameParserProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$shoppingItemNameParserHash();

  @$internal
  @override
  $ProviderElement<ShoppingItemNameParser> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ShoppingItemNameParser create(Ref ref) {
    return shoppingItemNameParser(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ShoppingItemNameParser value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ShoppingItemNameParser>(value),
    );
  }
}

String _$shoppingItemNameParserHash() =>
    r'7abd9360e745aa47a7dd1ffc60ed80bcb307b8c3';
