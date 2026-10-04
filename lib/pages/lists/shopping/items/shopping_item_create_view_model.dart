import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../data/shopping/autocomplete/application/shopping_item_autocomplete_use_case.dart';
import '../../../../data/shopping/autocomplete/models/shopping_item_autocomplete.dart';
import '../../../../data/shopping/items/models/shopping_item_raw_data.dart';
import '../../../../services/shopping_item_name_parser.dart';
import 'models/shopping_item_errors.dart';

part 'shopping_item_create_view_model.freezed.dart';
part 'shopping_item_create_view_model.g.dart';

@riverpod
Future<List<ShoppingItemAutocomplete>> itemAutocomplete(Ref ref, String listId) {
  final filter = ref.watch(itemFormProvider).filter.trim().toLowerCase();
  final repo = ref.read(shoppingItemAutocompleteUseCaseProvider(listId));
  return repo.getAutocomplete(filter);
}

@freezed
abstract class ItemFormData with _$ItemFormData {
  const ItemFormData._();

  const factory ItemFormData({
    required String filter,
    required ShoppingItemRawData data,
    String? filterError,
    ShoppingItemErrors? itemErrors,
  }) = _ItemFormData;

  factory ItemFormData.empty() => ItemFormData(
    filter: '',
    data: ShoppingItemRawData.empty(),
  );

  bool get hasErrors => filterError != null || itemErrors?.hasErrors == true;
}

@riverpod
class ItemForm extends _$ItemForm {
  bool _autoValidate = false;

  @override
  ItemFormData build() {
    return ItemFormData.empty();
  }

  void reset() {
    state = ItemFormData.empty();
    _autoValidate = false;
  }

  void setAutoValidation(bool autoValidate) {
    _autoValidate = autoValidate;
    _validateIfEnabled();
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
    _validateIfEnabled();
  }

  void setProduct(String product) {
    state = state.copyWith.data(product: product);
    _validateIfEnabled();
  }

  void setQuantity(String quantity) {
    state = state.copyWith.data(quantity: quantity);
    _validateIfEnabled();
  }

  void setCategory(String category) {
    state = state.copyWith.data(category: category);
    _validateIfEnabled();
  }

  void setRawData(ShoppingItemRawData rawData) {
    state = state.copyWith(data: rawData);
    _validateIfEnabled();
  }

  void _validateIfEnabled() {
    if (!_autoValidate) {
      return;
    }

    state = state.copyWith(
      filterError: state.filter.isEmpty ? itemError : null,
      itemErrors: ShoppingItemErrors.validate(state.data),
    );
  }

  static String itemError = 'Please enter an item name';
}
