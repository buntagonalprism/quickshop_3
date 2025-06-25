import 'package:freezed_annotation/freezed_annotation.dart';

part 'shopping_category_history.freezed.dart';

@freezed
class ShoppingCategoryHistory with _$ShoppingCategoryHistory {
  const ShoppingCategoryHistory._();

  const factory ShoppingCategoryHistory({
    required String id,
    required String name,
    required int usageCount,
    required DateTime lastUsed,
  }) = _ShoppingCategoryHistory;
}
