import 'package:freezed_annotation/freezed_annotation.dart';

part 'shopping_item_suggestion.freezed.dart';

@freezed
class ShoppingItemSuggestion with _$ShoppingItemSuggestion {
  const ShoppingItemSuggestion._();

  const factory ShoppingItemSuggestion({
    required String product,
    required String quantity,
    required List<String> categories,
    required ShoppingItemSuggestionSource source,
    String? listItemId,
  }) = _ShoppingItemSuggestion;

  String get displayName => quantity.isEmpty ? product : '$quantity $product';
}

enum ShoppingItemSuggestionSource {
  history,
  list,
  suggested,
}
