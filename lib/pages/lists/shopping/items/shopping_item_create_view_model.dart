import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../models/shopping/autocomplete/shopping_item_autocomplete.dart';
import '../../../../repositories/shopping/autocomplete/shopping_item_autocomplete_repo.dart';
import '../../../../services/shopping_item_name_parser.dart';
import 'models/shopping_item_errors.dart';
import 'models/shopping_item_raw_data.dart';

part 'shopping_item_create_view_model.freezed.dart';
part 'shopping_item_create_view_model.g.dart';

@riverpod
Future<List<ShoppingItemAutocomplete>> itemAutocomplete(Ref ref, String listId) {
  final filter = ref.watch(shoppingItemCreateViewModelProvider).filter.trim().toLowerCase();
  final repo = ref.read(shoppingItemAutocompleteRepoProvider(listId));
  return repo.getAutocomplete(filter);
}

class ShoppingItemCreateErrors {
  final String? filter;
  final ShoppingItemErrors item;

  ShoppingItemCreateErrors({
    required this.filter,
    required this.item,
  });
  bool get hasErrors => filter != null || item.hasErrors;
}

@freezed
abstract class ShoppingItemCreateData with _$ShoppingItemCreateData {
  const ShoppingItemCreateData._();

  const factory ShoppingItemCreateData({
    required String filter,
    required ShoppingItemRawData data,
    String? filterError,
    ShoppingItemErrors? itemErrors,
  }) = _ShoppingItemCreateData;

  factory ShoppingItemCreateData.empty() => ShoppingItemCreateData(
        filter: '',
        data: ShoppingItemRawData.empty(),
      );
}

@riverpod
class ShoppingItemCreateViewModel extends _$ShoppingItemCreateViewModel {
  @override
  ShoppingItemCreateData build() {
    return ShoppingItemCreateData.empty();
  }

  void reset() {
    state = ShoppingItemCreateData.empty();
  }

  void setFilter(String filter) {
    final parsedItem = ref.read(shoppingItemNameParserProvider).parse(filter);
    state = state.copyWith(
      filter: filter,
      data: state.data.copyWith(
        product: parsedItem.product,
        quantity: parsedItem.quantity,
      ),
    );
  }

  bool validate() {
    state = state.copyWith(
      filterError: state.filter.isEmpty ? 'Please enter an item name' : null,
      itemErrors: ShoppingItemErrors.validate(state.data),
    );
    return state.filterError == null && !state.itemErrors!.hasErrors;
  }

  void setProduct(String product) {
    state = state.copyWith.data(product: product);
  }

  void setQuantity(String quantity) {
    state = state.copyWith.data(quantity: quantity);
  }

  void setSelectedCategories(List<String> selectedCategories) {
    state = state.copyWith.data(categories: selectedCategories);
  }

  void setRawData(ShoppingItemRawData rawData) {
    state = state.copyWith(data: rawData);
  }
}
