import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../models/shopping/autocomplete/shopping_item_autocomplete.dart';
import '../../../../repositories/shopping/autocomplete/shopping_item_autocomplete_repo.dart';
import '../../../../repositories/shopping/shopping_item_repo.dart';
import '../../../../router.dart';
import '../../../../widgets/padding.dart';
import 'category_selector.dart';
import 'models/shopping_item_raw_data.dart';
import 'shopping_item_create_view_model.dart';
import 'shopping_item_view.dart';

class ShoppingItemCreatePage extends ConsumerStatefulWidget {
  const ShoppingItemCreatePage({required this.listId, super.key});
  final String listId;

  @override
  ConsumerState<ShoppingItemCreatePage> createState() => _ShoppingItemCreatePageState();
}

class _ShoppingItemCreatePageState extends ConsumerState<ShoppingItemCreatePage> with SingleTickerProviderStateMixin {
  late final tabController = TabController(length: 3, vsync: this);
  bool showErrors = false;
  int childrenResetKey = DateTime.now().millisecondsSinceEpoch;

  @override
  Widget build(BuildContext context) {
    final model = ref.watch(shoppingItemCreateViewModelProvider);
    final screenTitle = ['New item', 'Select category', 'Edit item details'][tabController.index];
    return PopScope(
      canPop: tabController.index == 0,
      onPopInvokedWithResult: (didPop, _) {
        if (didPop) {
          return;
        }
        moveToTab(tabController.index - 1);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(screenTitle),
          actions: const [
            ShoppingItemTooltipAction(),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: TabBarView(
                controller: tabController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  ShoppingItemSearchView(
                    key: ValueKey('search_$childrenResetKey'),
                    showErrors: showErrors,
                    onAutocompleteSelected: onAutocompleteSelected,
                    listId: widget.listId,
                  ),
                  ShoppingItemCategorySelectView(
                    key: ValueKey('category_$childrenResetKey'),
                    listId: widget.listId,
                    showErrors: showErrors,
                    onEditItem: () => moveToTab(2),
                  ),
                  ShoppingItemView(
                    key: ValueKey('edit_$childrenResetKey'),
                    listId: widget.listId,
                    data: ShoppingItemViewCreateData(
                      rawData: ShoppingItemRawData(
                        product: model.data.product,
                        quantity: model.data.quantity,
                        categories: model.data.categories,
                      ),
                    ),
                    errors: showErrors ? model.itemErrors : null,
                    onDataChanged: (rawData) {
                      ref.read(shoppingItemCreateViewModelProvider.notifier).setRawData(rawData);
                    },
                    onDone: () => onDone(addMore: false),
                  ),
                ],
              ),
            ),
            Material(
              elevation: 4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton.icon(
                    onPressed: () => onDone(addMore: true),
                    icon: const Icon(Icons.add),
                    label: const Text('Add more'),
                  ),
                  TextButton.icon(
                    onPressed: () => onDone(addMore: false),
                    icon: const Icon(Icons.check),
                    label: const Text('Done'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onAutocompleteSelected(ShoppingItemAutocomplete suggestion, bool addMore) async {
    await ref.read(shoppingListItemRepoProvider(widget.listId).notifier).addAutocomplete(suggestion);
    ref.read(routerProvider).pop();
    showConfirmationSnackbar(suggestion.displayName);
    if (addMore) {
      resetPage();
    }
  }

  void onDone({bool addMore = false}) async {
    final itemRepo = ref.read(shoppingListItemRepoProvider(widget.listId).notifier);
    final model = ref.read(shoppingItemCreateViewModelProvider);
    if (model.hasErrors) {
      setState(() => showErrors = true);
      return;
    }

    if (tabController.index == 0) {
      final result = await itemRepo.addItemByName(model.filter);
      result.when(
        categoryRequired: () => moveToTab(1),
        success: (addedItem) {
          showConfirmationSnackbar(addedItem.displayName);
          if (addMore) {
            resetPage();
          } else {
            ref.read(routerProvider).pop();
          }
        },
      );
    } else {
      itemRepo.addItem(
        productName: model.data.product,
        quantity: model.data.quantity,
        categories: model.data.categories,
      );
      showConfirmationSnackbar(model.data.displayName);
    }
  }

  void showConfirmationSnackbar(String displayName) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Added $displayName to list'),
        duration: const Duration(milliseconds: 2400),
      ));
    }
  }

  void resetPage() {
    moveToTab(0);
    showErrors = false;
    ref.read(shoppingItemCreateViewModelProvider.notifier).reset();
    setState(() {
      childrenResetKey = DateTime.now().millisecondsSinceEpoch;
    });
  }

  void moveToTab(int index) {
    tabController.animateTo(index);
    setState(() {
      // This triggers a rebuild so the PopScope can update its canPop value
    });
  }
}

class ShoppingItemSearchView extends ConsumerStatefulWidget {
  const ShoppingItemSearchView(
      {required this.listId, required this.showErrors, required this.onAutocompleteSelected, super.key});
  final String listId;
  final bool showErrors;
  final Function(ShoppingItemAutocomplete autocomplete, bool addMore) onAutocompleteSelected;

  @override
  ConsumerState<ShoppingItemSearchView> createState() => _ShoppingItemSearchViewState();
}

class _ShoppingItemSearchViewState extends ConsumerState<ShoppingItemSearchView> {
  late final TextEditingController nameController;
  String? nameError;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(
      text: ref.read(shoppingItemCreateViewModelProvider).filter,
    );
  }

  @override
  Widget build(BuildContext context) {
    final model = ref.watch(shoppingItemCreateViewModelProvider);
    return Column(children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
        child: TextField(
          decoration: InputDecoration(
            labelText: 'Enter item name',
            errorText: widget.showErrors ? model.filterError : null,
          ),
          autofocus: true,
          controller: nameController,
          onChanged: (newValue) {
            ref.read(shoppingItemCreateViewModelProvider.notifier).setFilter(newValue);
          },
        ),
      ),
      Expanded(
        child: model.filter.isEmpty
            ? const ItemSuggestionsPlaceholder()
            : ItemSuggestionsList(
                listId: widget.listId,
                onAdd: (suggestion) => widget.onAutocompleteSelected(suggestion, false),
                onAddMore: (suggestion) => widget.onAutocompleteSelected(suggestion, true),
              ),
      ),
    ]);
  }
}

class ItemSuggestionsList extends ConsumerStatefulWidget {
  const ItemSuggestionsList({
    required this.listId,
    required this.onAdd,
    required this.onAddMore,
    super.key,
  });
  final String listId;
  final Function(ShoppingItemAutocomplete) onAdd;
  final Function(ShoppingItemAutocomplete) onAddMore;

  @override
  ConsumerState<ItemSuggestionsList> createState() => _ItemSuggestionsListState();
}

class _ItemSuggestionsListState extends ConsumerState<ItemSuggestionsList> {
  int? highlightedIndex;
  bool preventTaps = false;

  @override
  Widget build(BuildContext context) {
    final autocompleteAsync = ref.watch(itemAutocompleteProvider(widget.listId));
    if (autocompleteAsync.isLoading && !autocompleteAsync.hasValue) {
      return const Center(child: CircularProgressIndicator());
    }
    if (autocompleteAsync.hasError) {
      return const Center(child: Text('Failed to load suggestions'));
    }
    final autocompletes = autocompleteAsync.requireValue;
    if (autocompletes.isEmpty) {
      return const ItemSuggestionsEmpty();
    }
    return ListView.builder(
      itemCount: autocompletes.length,
      itemBuilder: (context, index) {
        final autocomplete = autocompletes[index];
        return switch (autocomplete.source) {
          ShoppingItemAutocompleteSource.history || ShoppingItemAutocompleteSource.suggested => MenuAnchor(
              onClose: () {
                setState(() {
                  highlightedIndex = null;
                  preventTaps = true;
                });
                Future.delayed(const Duration(milliseconds: 300), () {
                  setState(() => preventTaps = false);
                });
              },
              builder: (context, controller, child) => ListTile(
                visualDensity: VisualDensity.compact,
                tileColor: highlightedIndex == index ? Colors.grey.shade200 : null,
                title: Text(autocomplete.displayName),
                subtitle: Text(autocomplete.categories.join(', ')),
                onLongPress: () {
                  controller.open();
                  setState(() => highlightedIndex = index);
                },
                onTap: () {
                  if (highlightedIndex != null) {
                    controller.close();
                    setState(() => highlightedIndex = null);
                  } else if (!preventTaps) {
                    widget.onAdd(autocomplete);
                  }
                },
                trailing: IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () => widget.onAddMore(autocomplete),
                ),
              ),
              style: const MenuStyle(
                alignment: Alignment.center,
              ),
              alignmentOffset: const Offset(-36, 0),
              menuChildren: [
                MenuItemButton(
                  child: const Text('Remove'),
                  onPressed: () =>
                      ref.read(shoppingItemAutocompleteRepoProvider(widget.listId)).removeSuggestion(autocomplete),
                ),
                MenuItemButton(
                  child: const Text('Edit'),
                  onPressed: () => _onEditSuggestion(ref, autocomplete),
                ),
              ],
            ),
          ShoppingItemAutocompleteSource.list => ListTile(
              visualDensity: VisualDensity.compact,
              contentPadding: const EdgeInsets.only(left: 16, right: 4),
              title: Text(
                autocomplete.displayName,
                style: const TextStyle(fontStyle: FontStyle.italic),
              ),
              subtitle: const Text(
                'Already on list',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
              trailing: TextButton.icon(
                onPressed: () => _onEditListItem(ref, autocomplete),
                label: const Text('Edit'),
                icon: const Icon(Icons.edit),
              ),
            ),
        };
      },
    );
  }

  void _onEditListItem(WidgetRef ref, ShoppingItemAutocomplete suggestion) {
    ref.read(routerProvider).go(Routes.shoppingListEditItem(widget.listId, suggestion.sourceId).path);
  }

  void _onEditSuggestion(WidgetRef ref, ShoppingItemAutocomplete suggestion) {
    // TODO: Show a suggestion edit page
    print('On edit: $suggestion');
  }
}

class ItemSuggestionsPlaceholder extends StatelessWidget {
  const ItemSuggestionsPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: Icon(Icons.search),
            title: Text('Start typing to search suggested items and your item history'),
          ),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Long press suggestions to edit or delete them'),
          ),
          ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('For better suggestions, put item quantities and product sizes at the start'),
            subtitle: Text(
                'For example: 2 small green apples, 500g mince beef, two cans of tomato soup, a large loaf of bread'),
          )
        ],
      ),
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
  final String listId;
  final VoidCallback onEditItem;
  final bool showErrors;
  const ShoppingItemCategorySelectView({
    required this.listId,
    required this.onEditItem,
    required this.showErrors,
    super.key,
  });

  @override
  ConsumerState<ShoppingItemCategorySelectView> createState() => _ShoppingItemCategorySelectViewState();
}

class _ShoppingItemCategorySelectViewState extends ConsumerState<ShoppingItemCategorySelectView> {
  String? categoryError;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bodyStyle = Theme.of(context).textTheme.bodyMedium;
    final bodyBoldStyle = bodyStyle?.copyWith(fontWeight: FontWeight.bold);
    final model = ref.watch(shoppingItemCreateViewModelProvider);
    categoryError = widget.showErrors ? model.itemErrors?.categoriesError : null;
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: 16.horizontalSymmetric,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                16.vertical,
                Text(
                  "Select one or more categories for where you might find this product in store.",
                  style: bodyStyle,
                ),
                6.vertical,
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text.rich(TextSpan(
                            text: 'Base product name: ',
                            style: bodyBoldStyle,
                            children: [
                              TextSpan(text: model.data.product, style: bodyStyle),
                            ],
                          )),
                          2.vertical,
                          Text.rich(TextSpan(
                            text: 'Quantity/size: ',
                            style: bodyBoldStyle,
                            children: [
                              TextSpan(
                                text: model.data.quantity.isNotEmpty ? model.data.quantity : 'Not specified',
                                style: bodyStyle,
                              ),
                            ],
                          )),
                        ],
                      ),
                    ),
                    8.horizontal,
                    TextButton.icon(
                      onPressed: widget.onEditItem,
                      label: Text('Edit'),
                      icon: Icon(Icons.edit),
                    ),
                  ],
                ),
                16.vertical,
                CategorySelector(
                  listId: widget.listId,
                  selectedCategories: model.data.categories,
                  onCategoriesChanged: (categories) {
                    ref.read(shoppingItemCreateViewModelProvider.notifier).setSelectedCategories(categories);
                  },
                  error: categoryError,
                ),
              ],
            ),
          ),
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
