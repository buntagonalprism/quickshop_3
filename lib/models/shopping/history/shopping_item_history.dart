import 'package:freezed_annotation/freezed_annotation.dart';

part 'shopping_item_history.freezed.dart';

@freezed
abstract class ShoppingItemHistory with _$ShoppingItemHistory {
  const ShoppingItemHistory._();

  const factory ShoppingItemHistory({
    required String id,
    required String name,
    required String nameLower,
    required List<String> categories,
    required DateTime lastUsed,
    required int usageCount,
  }) = _ShoppingItemHistory;
}
