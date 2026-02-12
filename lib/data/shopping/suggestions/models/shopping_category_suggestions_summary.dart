import 'package:freezed_annotation/freezed_annotation.dart';

part 'shopping_category_suggestions_summary.freezed.dart';

@freezed
abstract class ShoppingCategorySuggestionsSummary with _$ShoppingCategorySuggestionsSummary {
  const ShoppingCategorySuggestionsSummary._();

  const factory ShoppingCategorySuggestionsSummary({
    required Map<String, DateTime> updatedAt,
  }) = _ShoppingCategorySuggestionsSummary;
}
