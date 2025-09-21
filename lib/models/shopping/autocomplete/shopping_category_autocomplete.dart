import 'package:freezed_annotation/freezed_annotation.dart';

part 'shopping_category_autocomplete.freezed.dart';

@freezed
abstract class ShoppingCategoryAutocomplete with _$ShoppingCategoryAutocomplete {
  const ShoppingCategoryAutocomplete._();

  const factory ShoppingCategoryAutocomplete({
    required String name,
    required ShoppingCategoryAutocompleteSource source,
    required String sourceId,
  }) = _ShoppingCategoryAutocomplete;
}

enum ShoppingCategoryAutocompleteSource {
  history,
  suggested,
  list,
}
