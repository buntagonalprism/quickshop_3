import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../models/shopping/autocomplete/shopping_category_autocomplete.dart';
import '../../../../repositories/shopping/autocomplete/shopping_category_autocomplete_repo.dart';

part 'category_selector_view_model.freezed.dart';
part 'category_selector_view_model.g.dart';

@freezed
class CategorySelectorItem with _$CategorySelectorItem {
  const CategorySelectorItem._();

  const factory CategorySelectorItem.newCategory() = _NewCategory;
  const factory CategorySelectorItem.suggestion(String name) = _Suggestion;
  const factory CategorySelectorItem.history(String name) = _History;
  const factory CategorySelectorItem.list(String name) = _List;
}

@riverpod
class CategoryFilter extends _$CategoryFilter {
  @override
  String build() {
    return "";
  }

  void setFilter(String filter) {
    state = filter;
  }
}

@riverpod
CategorySelectorViewModel categorySelectorViewModel(Ref ref, String listId) {
  return CategorySelectorViewModel._(ref, listId);
}

class CategorySelectorViewModel {
  final Ref _ref;
  final String listId;
  CategorySelectorViewModel._(this._ref, this.listId);

  Future<List<CategorySelectorItem>> getItems(String filter) async {
    final autocompleteRepo = _ref.read(shoppingCategoryAutocompleteRepoProvider(listId));
    final autocompletes = await autocompleteRepo.getAutocomplete(filter);
    final items = autocompletes.map((autocomplete) {
      return switch (autocomplete.source) {
        ShoppingCategoryAutocompleteSource.history => CategorySelectorItem.history(autocomplete.name),
        ShoppingCategoryAutocompleteSource.suggested => CategorySelectorItem.suggestion(autocomplete.name),
        ShoppingCategoryAutocompleteSource.list => CategorySelectorItem.list(autocomplete.name),
      };
    }).toList();
    if (items.isEmpty || filter.length > 3) {
      items.insert(0, const CategorySelectorItem.newCategory());
    }
    return items;
  }
}
