import 'package:freezed_annotation/freezed_annotation.dart';

import '../has_id.dart';

part 'shopping_item.freezed.dart';

@freezed
abstract class ShoppingItem with _$ShoppingItem implements HasId {
  const ShoppingItem._();

  const factory ShoppingItem({
    required String id,
    required String path,
    required String product,
    required String quantity,
    required List<String> categories,
    required String addedByUserId,
    required String lastModifiedByUserId,
    required DateTime lastModifiedAt,
    required bool completed,
  }) = _ShoppingItem;

  String get displayName => quantity.isEmpty ? product : '$quantity $product';
}
