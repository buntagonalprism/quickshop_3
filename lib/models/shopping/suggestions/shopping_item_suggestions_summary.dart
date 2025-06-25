import 'package:freezed_annotation/freezed_annotation.dart';

part 'shopping_item_suggestions_summary.freezed.dart';

@freezed
class ShoppingItemSuggestionsSummary with _$ShoppingItemSuggestionsSummary {
  const ShoppingItemSuggestionsSummary._();

  const factory ShoppingItemSuggestionsSummary({
    required Map<String, DateTime> updatedAt,
  }) = _ShoppingItemSuggestionsSummary;
}
