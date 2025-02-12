import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../data/category_suggestions.dart' as data;
import '../../../../repositories/shopping_category_suggestion_repo.dart';

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
CategorySelectorViewModel categorySelectorViewModel(Ref ref) {
  return CategorySelectorViewModel._(ref);
}

class CategorySelectorViewModel {
  final Ref _ref;
  CategorySelectorViewModel._(this._ref);

  Future<List<CategorySelectorItem>> getItems(String filter) async {
    final categoryRepo = _ref.read(shoppingCategorySuggestionRepoProvider);
    final categorySuggestions = await categoryRepo.getSuggestions(filter);
    final suggestionResults = categorySuggestions
        .map((suggestion) => CategorySelectorItem.suggestion(suggestion.name))
        .toList();
    if (suggestionResults.isEmpty || filter.length > 3) {
      suggestionResults.insert(0, const CategorySelectorItem.newCategory());
    }
    return suggestionResults;
  }
}

@riverpod
List<String> categorySuggestions(Ref ref) {
  return data.categorySuggestions;
}
