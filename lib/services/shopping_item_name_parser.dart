import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'shopping_item_name_parser.freezed.dart';
part 'shopping_item_name_parser.g.dart';

@freezed
class ParsedShoppingItem with _$ParsedShoppingItem {
  const ParsedShoppingItem._();

  const factory ParsedShoppingItem({
    required String product,
    required String quantity,
  }) = _ParsedShoppingItem;
}

@riverpod
ShoppingItemNameParser shoppingItemNameParser(Ref ref) {
  return ShoppingItemNameParser();
}

class ShoppingItemNameParser {
  /// Parse the product name and quantity from a shopping list item
  ///
  /// For example:
  /// ```dart
  /// parse('A loaf of white bread') == ParsedShoppingItem(product: 'white bread', quantity: 'A loaf of');
  /// parse('2 small brown onions, finely chopped') = ParsedShoppingItem(product: 'brown onions, finely chopped', quantity: '2');
  /// parse('500g mince beef') == ParsedShoppingItem(product: 'mince beef', quantity: '500g');
  /// ```
  ParsedShoppingItem parse(String item) {
    final numericStart = RegExp('^(\\d+\\s+)').firstMatch(item);
    if (numericStart != null) {
      final quantity = numericStart.group(1)!;
      item = item.replaceFirst(quantity, '');
      return ParsedShoppingItem(
        product: item.trim(),
        quantity: quantity.trim(),
      );
    }
    return ParsedShoppingItem(
      product: item,
      quantity: '',
    );
  }
}
