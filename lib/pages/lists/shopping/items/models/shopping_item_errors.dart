import 'shopping_item_raw_data.dart';

class ShoppingItemErrors {
  final String? productError;
  final String? quantityError;
  final String? categoriesError;

  ShoppingItemErrors({
    required this.productError,
    required this.quantityError,
    required this.categoriesError,
  });

  bool get hasErrors => productError != null || quantityError != null || categoriesError != null;

  factory ShoppingItemErrors.empty() {
    return ShoppingItemErrors(
      productError: null,
      quantityError: null,
      categoriesError: null,
    );
  }

  factory ShoppingItemErrors.validate(ShoppingItemRawData data) {
    return ShoppingItemErrors(
      productError: data.product.isEmpty ? 'Please enter a product name' : null,
      quantityError: null,
      categoriesError: data.categories.isEmpty ? 'Please select at least one category' : null,
    );
  }
}
