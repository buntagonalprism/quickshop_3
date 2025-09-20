import 'package:freezed_annotation/freezed_annotation.dart';

part 'shopping_item_raw_data.freezed.dart';

/// The minimal data needed to define a shopping item with no metadata
@freezed
abstract class ShoppingItemRawData with _$ShoppingItemRawData {
  ShoppingItemRawData._();

  factory ShoppingItemRawData({
    required String product,
    required String quantity,
    required List<String> categories,
  }) = _ShoppingItemRawData;

  factory ShoppingItemRawData.empty() => ShoppingItemRawData(product: '', quantity: '', categories: []);

  String get displayName => quantity.isEmpty ? product : '$quantity $product';
}
