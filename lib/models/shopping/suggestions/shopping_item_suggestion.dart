import 'package:freezed_annotation/freezed_annotation.dart';

part 'shopping_item_suggestion.freezed.dart';

@freezed
class ShoppingItemSuggestion with _$ShoppingItemSuggestion {
  const ShoppingItemSuggestion._();

  const factory ShoppingItemSuggestion({
    required String id,
    required String locale,
    required String name,
    required List<String> categories,
    int? popularity,
  }) = _ShoppingItemSuggestion;
}
