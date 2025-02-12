import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../models/shopping_item_suggestion.dart';
import 'item_search_view_model.dart';
import 'shopping_item_view.dart';

class ShoppingItemSearchPage extends ConsumerStatefulWidget {
  const ShoppingItemSearchPage({required this.listId, super.key});
  final String listId;

  @override
  ConsumerState<ShoppingItemSearchPage> createState() => _ShoppingItemSearchPageState();
}

class _ShoppingItemSearchPageState extends ConsumerState<ShoppingItemSearchPage>
    with SingleTickerProviderStateMixin {
  late final tabController = TabController(length: 2, vsync: this);
  String? nameError;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: tabController.index == 0,
      onPopInvokedWithResult: (didPop, _) {
        if (didPop) {
          return;
        }
        tabController.animateTo(0);
        setState(() {
          // This triggers a rebuild so the PopScope can update its canPop value
        });
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('New Item'),
          actions: const [
            ShoppingItemTooltipAction(),
          ],
        ),
        body: TabBarView(
          controller: tabController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            ShoppingItemSearchView(
              onCategoryRequired: () {
                tabController.animateTo(1);
                setState(() {
                  // This triggers a rebuild so the PopScope can update its canPop value
                });
              },
              listId: widget.listId,
            ),
            const ShoppingItemCategorySelectView(),
          ],
        ),
      ),
    );
  }
}

class ShoppingItemSearchView extends ConsumerStatefulWidget {
  const ShoppingItemSearchView({required this.onCategoryRequired, required this.listId, super.key});
  final VoidCallback onCategoryRequired;
  final String listId;

  @override
  ConsumerState<ShoppingItemSearchView> createState() => _ShoppingItemSearchViewState();
}

class _ShoppingItemSearchViewState extends ConsumerState<ShoppingItemSearchView> {
  final _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final filterValue = ref.watch(itemFilterProvider);
    return Column(children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
        child: TextField(
          decoration: const InputDecoration(
            labelText: 'Enter item name',
          ),
          autofocus: true,
          controller: _nameController,
          onChanged: (newValue) {
            ref.read(itemFilterProvider.notifier).setFilter(newValue);
          },
        ),
      ),
      Expanded(
        child: filterValue.isEmpty
            ? const ItemSuggestionsPlaceholder()
            : ItemSuggestionsList(listId: widget.listId),
      ),
      Material(
        elevation: 4,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton.icon(
              onPressed: _onAddMore,
              icon: const Icon(Icons.add),
              label: const Text('Add more'),
            ),
            TextButton.icon(
              onPressed: _onDone,
              icon: const Icon(Icons.check),
              label: const Text('Done'),
            ),
          ],
        ),
      ),
    ]);
  }

  void _onDone() {
    print('On done');
    widget.onCategoryRequired();
  }

  void _onAddMore() {
    print('On add more');
  }
}

class ItemSuggestionsList extends ConsumerWidget {
  const ItemSuggestionsList({required this.listId, super.key});
  final String listId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final suggestionsAsync = ref.watch(itemSuggestionsProvider(listId));
    if (suggestionsAsync.isLoading && !suggestionsAsync.hasValue) {
      return const Center(child: CircularProgressIndicator());
    }
    if (suggestionsAsync.hasError) {
      return const Center(child: Text('Failed to load suggestions'));
    }
    final suggestions = suggestionsAsync.requireValue;
    if (suggestions.isEmpty) {
      return const ItemSuggestionsEmpty();
    }
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];
        return ListTile(
          title: Text(suggestion.displayName),
          subtitle: Text(suggestion.categories.join(', ')),
          leading: suggestion.source == ShoppingItemSuggestionSource.history
              ? const Icon(Icons.history)
              : null,
        );
      },
    );
  }
}

class ItemSuggestionsPlaceholder extends StatelessWidget {
  const ItemSuggestionsPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          leading: Icon(Icons.search),
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

class ItemSuggestionsEmpty extends StatelessWidget {
  const ItemSuggestionsEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('No suggestions found'),
    );
  }
}

class ShoppingItemCategorySelectView extends ConsumerStatefulWidget {
  const ShoppingItemCategorySelectView({super.key});

  @override
  ConsumerState<ShoppingItemCategorySelectView> createState() =>
      _ShoppingItemCategorySelectViewState();
}

class _ShoppingItemCategorySelectViewState extends ConsumerState<ShoppingItemCategorySelectView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(
          child: Center(child: Text('Category selector')),
        ),
        Material(
          elevation: 4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton.icon(
                onPressed: _onDone,
                icon: const Icon(Icons.check),
                label: const Text('Done'),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _onDone() {
    print('On done');
  }
}
