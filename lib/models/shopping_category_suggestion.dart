import 'package:freezed_annotation/freezed_annotation.dart';

part 'shopping_category_suggestion.freezed.dart';

@freezed
class ShoppingCategorySuggestion with _$ShoppingCategorySuggestion {
  const ShoppingCategorySuggestion._();

  const factory ShoppingCategorySuggestion({
    required String name,
    required ShoppingCategorySuggestionSource source,
  }) = _ShoppingItemCategorySuggestion;
}

enum ShoppingCategorySuggestionSource {
  history,
  suggested,
}
