import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../models/shopping/autocomplete/shopping_item_autocomplete.dart';
import '../../../../repositories/shopping/autocomplete/shopping_item_autocomplete_repo.dart';

part 'item_search_view_model.freezed.dart';
part 'item_search_view_model.g.dart';

@freezed
abstract class ItemSuggestion with _$ItemSuggestion {
  const ItemSuggestion._();

  const factory ItemSuggestion({
    required String item,
    required String category,
    required bool isFromHistory,
  }) = _ItemSuggestion;
}

@riverpod
class ItemFilter extends _$ItemFilter {
  @override
  String build() {
    return "";
  }

  void setFilter(String filter) {
    state = filter;
  }
}

@riverpod
Future<List<ShoppingItemAutocomplete>> itemAutocomplete(Ref ref, String listId) {
  final filter = ref.watch(itemFilterProvider).trim().toLowerCase();
  final repo = ref.read(shoppingItemAutocompleteRepoProvider(listId));
  return repo.getAutocomplete(filter);
}
