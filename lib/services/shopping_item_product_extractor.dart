import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'shopping_item_product_extractor.g.dart';

@riverpod
ShoppingItemProductExtractor shoppingItemProductExtractor(Ref ref) {
  return ShoppingItemProductExtractor();
}

class ShoppingItemProductExtractor {
  /// Extract the product name from a shopping list item, removing quantity and size information.
  ///
  /// For example:
  /// ```dart
  /// extract('A loaf of white bread') == 'white bread';
  /// extract('2 small brown onions, finely chopped') = 'brown onions, finely chopped';
  /// extract('500g mince beef') == 'mince beef'
  /// ```
  String extract(String item) {
    return '';
  }
}
