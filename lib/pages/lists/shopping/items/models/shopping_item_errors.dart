import '../../../../../data/shopping/items/models/shopping_item_raw_data.dart';

class ShoppingItemErrors {
  final String? productError;
  final String? quantityError;
  final String? categoryError;

  ShoppingItemErrors({
    required this.productError,
    required this.quantityError,
    required this.categoryError,
  });

  bool get hasErrors => productError != null || quantityError != null || categoryError != null;

  factory ShoppingItemErrors.empty() {
    return ShoppingItemErrors(
      productError: null,
      quantityError: null,
      categoryError: null,
    );
  }

  factory ShoppingItemErrors.validate(ShoppingItemRawData data) {
    return ShoppingItemErrors(
      productError: data.product.isEmpty ? messages.productNameMissing : null,
      quantityError: null,
      categoryError: data.category.isEmpty ? messages.categoryMissing : null,
    );
  }

  static const messages = (
    productNameMissing: 'Please enter a product name',
    categoryMissing: 'Please select at least one category',
  );
}
