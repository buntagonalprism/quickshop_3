import 'package:freezed_annotation/freezed_annotation.dart';

part 'shopping_item.freezed.dart';

@freezed
class ShoppingItem with _$ShoppingItem {
  const ShoppingItem._();

  const factory ShoppingItem({
    required String id,
    required String path,
    required String name,
    required String quantity,
    required List<String> categories,
    required String addedByUserId,
    required bool completed,
  }) = _ShoppingItem;

  String get displayName => quantity.isEmpty ? name : '$quantity $name';
}
