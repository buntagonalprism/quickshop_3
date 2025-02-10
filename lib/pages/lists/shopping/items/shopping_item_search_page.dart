import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'item_search_view_model.dart';
import 'shopping_item_view.dart';

class ShoppingItemSearchPage extends ConsumerWidget {
  const ShoppingItemSearchPage({required this.listId, super.key});
  final String listId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterValue = ref.watch(itemFilterProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('New Item'),
        actions: const [
          ShoppingItemTooltipAction(),
        ],
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
            decoration: const InputDecoration(
              labelText: 'Enter item name',
            ),
            onChanged: (newValue) {
              ref.read(itemFilterProvider.notifier).setFilter(newValue);
            },
          ),
        ),
        Expanded(
          child: filterValue.isEmpty ? const SuggestionsPlaceholderView() : const SuggestionsView(),
        ),
      ]),
    );
  }
}

class SuggestionsView extends ConsumerWidget {
  const SuggestionsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final suggestionsAsync = ref.watch(itemSuggestionsProvider);
    if (suggestionsAsync.isLoading && !suggestionsAsync.hasValue) {
      return const Center(child: CircularProgressIndicator());
    }
    if (suggestionsAsync.hasError) {
      return const Center(child: Text('Failed to load suggestions'));
    }
    final suggestions = suggestionsAsync.requireValue;
    if (suggestions.isEmpty) {
      return const SuggestionsEmptyView();
    }
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];
        return ListTile(
          title: Text(suggestion.item),
          subtitle: Text(suggestion.category),
          leading: suggestion.isFromHistory ? const Icon(Icons.history) : null,
        );
      },
    );
  }
}

class SuggestionsPlaceholderView extends StatelessWidget {
  const SuggestionsPlaceholderView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          leading: Icon(Icons.recommend_outlined),
          title: Text('Start typing to search suggested items and your item history'),
        ),
        ListTile(
          leading: Icon(Icons.history),
          title: Text('You can delete suggestions from your item history by long pressing them'),
        ),
        ListTile(
          leading: Icon(Icons.info_outline),
          title: Text('For better suggestions, put item quantities and product sizes at the start'),
          subtitle: Text(
              'For example: 2 small green apples, 500g mince beef, two cans of tomato soup, a large loaf of bread'),
        )
      ],
    );
  }
}

class SuggestionsEmptyView extends StatelessWidget {
  const SuggestionsEmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('No suggestions found'),
    );
  }
}
