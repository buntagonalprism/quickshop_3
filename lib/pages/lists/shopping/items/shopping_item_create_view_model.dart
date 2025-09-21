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

@freezed
abstract class ShoppingItemCreateModel with _$ShoppingItemCreateModel {
  const ShoppingItemCreateModel._();

  const factory ShoppingItemCreateModel({
    required String filter,
    required ShoppingItemRawData data,
    String? filterError,
    ShoppingItemErrors? itemErrors,
  }) = _ShoppingItemCreateData;

  factory ShoppingItemCreateModel.empty() => ShoppingItemCreateModel(
        filter: '',
        data: ShoppingItemRawData.empty(),
      );

  bool get hasErrors => filterError != null || itemErrors?.hasErrors == true;
}

@riverpod
class ShoppingItemCreateViewModel extends _$ShoppingItemCreateViewModel {
  @override
  ShoppingItemCreateModel build() {
    return ShoppingItemCreateModel.empty();
  }

  void reset() {
    state = ShoppingItemCreateModel.empty();
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

  void setProduct(String product) {
    state = state.copyWith.data(product: product);
    _validate();
  }

  void setQuantity(String quantity) {
    state = state.copyWith.data(quantity: quantity);
    _validate();
  }

  void setSelectedCategories(List<String> selectedCategories) {
    state = state.copyWith.data(categories: selectedCategories);
    _validate();
  }

  void setRawData(ShoppingItemRawData rawData) {
    state = state.copyWith(data: rawData);
    _validate();
  }

  void _validate() {
    state = state.copyWith(
      filterError: state.filter.isEmpty ? 'Please enter an item name' : null,
      itemErrors: ShoppingItemErrors.validate(state.data),
    );
  }
}
