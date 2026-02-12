import 'package:freezed_annotation/freezed_annotation.dart';

part 'shopping_item_suggestion.freezed.dart';

@freezed
abstract class ShoppingItemSuggestion with _$ShoppingItemSuggestion {
  const ShoppingItemSuggestion._();

  const factory ShoppingItemSuggestion({
    required String id,
    required String langCode,
    required String name,
    required String category,
    int? popularity,
  }) = _ShoppingItemSuggestion;
}
