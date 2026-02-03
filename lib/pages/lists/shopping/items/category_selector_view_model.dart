import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../application/shopping/autcomplete/shopping_category_autocomplete_use_case.dart';
import '../../../../models/shopping/autocomplete/shopping_category_autocomplete.dart';

part 'category_selector_view_model.g.dart';

@riverpod
class CategoryFilter extends _$CategoryFilter {
  @override
  String build(String listId) {
    return "";
  }

  void setFilter(String filter) {
    state = filter;
  }
}

@riverpod
Future<List<ShoppingCategoryAutocomplete>> categoryAutocomplete(Ref ref, String listId) async {
  final autocompleteRepo = ref.read(shoppingCategoryAutocompleteUseCaseProvider(listId));
  final filter = ref.watch(categoryFilterProvider(listId)).trim().toLowerCase();
  final autocompletes = await autocompleteRepo.getAutocomplete(filter);
  return autocompletes;
}
