import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../data/item_suggestions.dart';

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
Future<List<ItemSuggestion>> itemSuggestions(Ref ref) async {
  final filter = ref.watch(itemFilterProvider).trim().toLowerCase();
  if (filter.isEmpty) {
    return Future.value([]);
  }
  await Future.delayed(const Duration(milliseconds: 300));
  final product = removeQuantity(filter);
  final startMatches = <ItemSuggestion>[];
  final middleMatches = <ItemSuggestion>[];
  for (var entry in itemSuggestionsData.entries) {
    final suggestion = ItemSuggestion(item: entry.key, category: entry.value, isFromHistory: false);
    if (entry.key.toLowerCase().startsWith(product)) {
      startMatches.add(suggestion);
    } else if (entry.key.toLowerCase().contains(product)) {
      middleMatches.add(suggestion);
    }
  }
  return [...startMatches, ...middleMatches];
}

String removeQuantity(String input) {
  return input.replaceAll(RegExp('\\d'), '').trim();
}
