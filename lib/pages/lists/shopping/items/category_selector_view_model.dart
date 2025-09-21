import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../data/category_suggestions.dart' as data;
import '../../../../repositories/shopping/autocomplete/shopping_category_autocomplete_repo.dart';

part 'category_selector_view_model.freezed.dart';
part 'category_selector_view_model.g.dart';

@freezed
class CategorySelectorItem with _$CategorySelectorItem {
  const CategorySelectorItem._();

  const factory CategorySelectorItem.newCategory() = _NewCategory;
  const factory CategorySelectorItem.heading(String name) = _Heading;
  const factory CategorySelectorItem.suggestion(String name) = _Suggestion;
  const factory CategorySelectorItem.history(String name) = _History;
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
    final items = autocompletes.map((autocomplete) => CategorySelectorItem.suggestion(autocomplete.name)).toList();
    if (items.isEmpty || filter.length > 3) {
      items.insert(0, const CategorySelectorItem.newCategory());
    }
    return items;
  }
}

@riverpod
List<String> categorySuggestions(Ref ref) {
  return data.categorySuggestions;
}
