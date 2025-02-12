import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../models/shopping_item_suggestion.dart';
import '../../../../repositories/shopping_item_suggestion_repo.dart';

part 'item_search_view_model.freezed.dart';
part 'item_search_view_model.g.dart';

@freezed
class ItemSuggestion with _$ItemSuggestion {
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
Future<List<ShoppingItemSuggestion>> itemSuggestions(Ref ref, String listId) {
  final filter = ref.watch(itemFilterProvider).trim().toLowerCase();
  final repo = ref.read(shoppingItemSuggestionRepoProvider(listId));
  return repo.getSuggestions(filter);
}
