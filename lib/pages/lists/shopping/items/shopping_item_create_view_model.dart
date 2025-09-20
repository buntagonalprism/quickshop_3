import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../models/shopping/autocomplete/shopping_item_autocomplete.dart';
import '../../../../repositories/shopping/autocomplete/shopping_item_autocomplete_repo.dart';
import '../../../../services/shopping_item_name_parser.dart';

part 'shopping_item_create_view_model.freezed.dart';
part 'shopping_item_create_view_model.g.dart';

@riverpod
Future<List<ShoppingItemAutocomplete>> itemAutocomplete(Ref ref, String listId) {
  final filter = ref.watch(shoppingItemCreateViewModelProvider).filter.trim().toLowerCase();
  final repo = ref.read(shoppingItemAutocompleteRepoProvider(listId));
  return repo.getAutocomplete(filter);
}

@freezed
abstract class ShoppingItemCreateData with _$ShoppingItemCreateData {
  const ShoppingItemCreateData._();

  const factory ShoppingItemCreateData({
    required String filter,
    required String product,
    required String quantity,
    required List<String> selectedCategories,
  }) = _ShoppingItemCreateData;
}

@riverpod
class ShoppingItemCreateViewModel extends _$ShoppingItemCreateViewModel {
  @override
  ShoppingItemCreateData build() {
    return const ShoppingItemCreateData(
      filter: '',
      product: '',
      quantity: '',
      selectedCategories: [],
    );
  }

  void setFilter(String filter) {
    final parsedItem = ref.read(shoppingItemNameParserProvider).parse(filter);
    state = state.copyWith(
      filter: filter,
      product: parsedItem.product,
      quantity: parsedItem.quantity,
    );
  }

  void setProduct(String product) {
    state = state.copyWith(product: product);
  }

  void setQuantity(String quantity) {
    state = state.copyWith(quantity: quantity);
  }

  void setSelectedCategories(List<String> selectedCategories) {
    state = state.copyWith(selectedCategories: selectedCategories);
  }
}
