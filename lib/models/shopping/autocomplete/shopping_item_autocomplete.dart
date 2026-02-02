import 'package:freezed_annotation/freezed_annotation.dart';

part 'shopping_item_autocomplete.freezed.dart';

@freezed
abstract class ShoppingItemAutocomplete with _$ShoppingItemAutocomplete {
  const ShoppingItemAutocomplete._();

  const factory ShoppingItemAutocomplete({
    required String product,
    required String quantity,
    required String category,
    required ShoppingItemAutocompleteSource source,
    required String sourceId,
  }) = _ShoppingItemAutocomplete;

  String get displayName => quantity.isEmpty ? product : '$quantity $product';
}

enum ShoppingItemAutocompleteSource {
  history,
  list,
  suggested,
}
