import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../application/hidden_suggestions_use_case.dart';
import '../../../../application/shopping/autcomplete/shopping_item_autocomplete_use_case.dart';
import '../../../../application/shopping/shopping_items_notifier.dart';
import '../../../../application/tutorials_notifier.dart';
import '../../../../models/shopping/autocomplete/shopping_item_autocomplete.dart';
import '../../../../models/shopping/shopping_item_raw_data.dart';
import '../../../../router.dart';
import '../../../../widgets/confirmation_dialog.dart';
import '../../../../widgets/padding.dart';
import '../../../../widgets/tooltip_button.dart';
import 'category_selector.dart';
import 'shopping_item_create_view_model.dart';
import 'shopping_item_view.dart';

class ShoppingItemCreatePageKeys {
  static const addMoreButton = Key('add_more_button');
  static const doneButton = Key('done_button');
  static const editProductButton = Key('edit_product_button');
  static const itemInputField = Key('item_input_field');
}

class ShoppingItemCreatePageStrings {
  static String itemOnList(String displayName) => '$displayName is already on your list';
  static String addedToList(String displayName) => 'Added $displayName to list';
  static const String categoryRequired = 'Please select at least one category';
}

typedef _Keys = ShoppingItemCreatePageKeys;

class ShoppingItemCreatePage extends ConsumerStatefulWidget {
  const ShoppingItemCreatePage({required this.listId, super.key});
  final String listId;

  @override
  ConsumerState<ShoppingItemCreatePage> createState() => _ShoppingItemCreatePageState();
}

class _ShoppingItemCreatePageState extends ConsumerState<ShoppingItemCreatePage> with SingleTickerProviderStateMixin {
  late final tabController = TabController(length: 3, vsync: this);
  int showErrorsOnTab = -1;
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
                    showErrors: showErrorsOnTab == 0,
                    onAutocompleteSelected: onAutocompleteSelected,
                    listId: widget.listId,
                  ),
                  ShoppingItemCategorySelectView(
                    key: ValueKey('category_$childrenResetKey'),
                    listId: widget.listId,
                    showErrors: showErrorsOnTab == 1,
                    isVisible: tabController.index == 1,
                    onEditItem: () => moveToTab(2),
                    onSelection: (addMore) => onDone(addMore: addMore),
                  ),
                  ShoppingItemView(
                    key: ValueKey('edit_$childrenResetKey'),
                    listId: widget.listId,
                    data: ShoppingItemViewCreateData(
                      rawData: ShoppingItemRawData(
                        product: model.data.product,
                        quantity: model.data.quantity,
                        category: model.data.category,
                      ),
                    ),
                    errors: showErrorsOnTab == 2 ? model.itemErrors : null,
                    onDataChanged: (rawData) {
                      ref.read(shoppingItemCreateViewModelProvider.notifier).setRawData(rawData);
                    },
                    onSubmitted: () => onDone(addMore: false),
                  ),
                ],
              ),
            ),
            Material(
              elevation: 4,
              child: Padding(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton.icon(
                      key: _Keys.addMoreButton,
                      onPressed: () => onDone(addMore: true),
                      icon: const Icon(Icons.add),
                      label: const Text('Add more'),
                    ),
                    TextButton.icon(
                      key: _Keys.doneButton,
                      onPressed: () => onDone(addMore: false),
                      icon: const Icon(Icons.check),
                      label: const Text('Done'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onAutocompleteSelected(ShoppingItemAutocomplete suggestion, bool addMore) async {
    await ref.read(shoppingItemsProvider(widget.listId).notifier).addAutocomplete(suggestion);
    onAddedItem(suggestion.displayName, addMore);
  }

  void onAddedItem(String displayName, bool addMore) {
    showConfirmationSnackbar(displayName);
    if (addMore) {
      resetPage();
    } else {
      ref.read(routerProvider).pop();
    }
  }

  void onDone({bool addMore = false}) async {
    final itemStore = ref.read(shoppingItemsProvider(widget.listId).notifier);
    ref.read(shoppingItemCreateViewModelProvider.notifier).setAutoValidation(true);
    final model = ref.read(shoppingItemCreateViewModelProvider);

    if (tabController.index == 0) {
      if (model.filterError != null) {
        setState(() => showErrorsOnTab = 0);
        return;
      }
      final result = await itemStore.addItemByName(model.filter);
      result.when(
        categoryRequired: () => moveToTab(1),
        alreadyOnList: (product) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(ShoppingItemCreatePageStrings.itemOnList(product)),
              duration: const Duration(milliseconds: 2400),
            ),
          );
        },
        success: (addedItem) {
          onAddedItem(addedItem.displayName, addMore);
        },
      );
    } else {
      if (model.itemErrors?.hasErrors ?? false) {
        setState(() => showErrorsOnTab = tabController.index);
        return;
      }
      itemStore.addItem(model.data);
      onAddedItem(model.data.displayName, addMore);
    }
  }

  void showConfirmationSnackbar(String displayName) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(ShoppingItemCreatePageStrings.addedToList(displayName)),
          duration: const Duration(milliseconds: 2400),
        ),
      );
    }
  }

  void resetPage() {
    moveToTab(0);

    ref.read(shoppingItemCreateViewModelProvider.notifier).reset();
    setState(() {
      childrenResetKey = DateTime.now().millisecondsSinceEpoch;
    });
  }

  void moveToTab(int index) {
    tabController.animateTo(index);
    // When switching tabs, don't immediately show any errors - give the user a
    // chance to enter input into the fields, and only show errors on submit.
    ref.read(shoppingItemCreateViewModelProvider.notifier).setAutoValidation(true);
    setState(() => showErrorsOnTab = -1);
  }
}

class ShoppingItemSearchView extends ConsumerStatefulWidget {
  const ShoppingItemSearchView({
    required this.listId,
    required this.showErrors,
    required this.onAutocompleteSelected,
    super.key,
  });
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
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
          child: TextField(
            key: _Keys.itemInputField,
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
              ? const ItemAutocompletePlaceholder()
              : ItemSuggestionsList(
                  listId: widget.listId,
                  onAdd: (suggestion) => widget.onAutocompleteSelected(suggestion, false),
                  onAddMore: (suggestion) => widget.onAutocompleteSelected(suggestion, true),
                ),
        ),
      ],
    );
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
      return ItemAutocompleteLoading();
    }
    if (autocompleteAsync.hasError) {
      return ItemAutocompleteError();
    }
    final autocompletes = autocompleteAsync.requireValue;
    if (autocompletes.isEmpty) {
      return const ItemAutocompleteEmpty();
    }
    return ListView.builder(
      itemCount: autocompletes.length,
      itemBuilder: (context, index) {
        final autocomplete = autocompletes[index];
        return ItemAutocompleteEntry(
          listId: widget.listId,
          autocomplete: autocomplete,
          onAdd: () => widget.onAdd(autocomplete),
          onAddMore: () => widget.onAddMore(autocomplete),
        );
      },
    );
  }
}

class ItemAutocompleteEntry extends ConsumerStatefulWidget {
  final String listId;
  final ShoppingItemAutocomplete autocomplete;
  final VoidCallback onAdd;
  final VoidCallback onAddMore;
  const ItemAutocompleteEntry({
    super.key,
    required this.listId,
    required this.autocomplete,
    required this.onAdd,
    required this.onAddMore,
  });

  @override
  ConsumerState<ItemAutocompleteEntry> createState() => _ItemAutocompleteEntryState();
}

class _ItemAutocompleteEntryState extends ConsumerState<ItemAutocompleteEntry> {
  bool highlighted = false;
  bool preventTaps = false;

  @override
  Widget build(BuildContext context) {
    return switch (widget.autocomplete.source) {
      ShoppingItemAutocompleteSource.history || ShoppingItemAutocompleteSource.suggested => MenuAnchor(
        onClose: () {
          setState(() {
            highlighted = false;
            preventTaps = true;
          });
          Future.delayed(const Duration(milliseconds: 300), () {
            setState(() => preventTaps = false);
          });
        },
        builder: (context, controller, child) => ListTile(
          visualDensity: VisualDensity.compact,
          tileColor: highlighted ? Colors.grey.shade200 : null,
          title: Text(widget.autocomplete.displayName),
          subtitle: Text(widget.autocomplete.category),
          leading: Icon(
            widget.autocomplete.source == ShoppingItemAutocompleteSource.history ? Icons.history : null,
          ),
          onLongPress: () {
            controller.open();
            setState(() => highlighted = true);
          },
          onTap: () {
            if (highlighted) {
              controller.close();
              setState(() => highlighted = false);
            } else if (!preventTaps) {
              widget.onAdd();
            }
          },
          trailing: IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => widget.onAddMore(),
          ),
        ),
        style: const MenuStyle(
          alignment: Alignment.center,
        ),
        alignmentOffset: const Offset(-36, 0),
        menuChildren: widget.autocomplete.source == ShoppingItemAutocompleteSource.suggested
            ? [
                MenuItemButton(
                  child: const Text('Hide suggestion'),
                  onPressed: () => _onHideSuggestion(widget.autocomplete),
                ),
              ]
            : [
                MenuItemButton(
                  child: const Text('Edit history entry'),
                  onPressed: () => _onEditHistoryEntry(widget.autocomplete),
                ),
                MenuItemButton(
                  child: const Text('Remove from history'),
                  onPressed: () => _onRemoveHistoryEntry(widget.autocomplete),
                ),
              ],
      ),
      ShoppingItemAutocompleteSource.list => ListTile(
        visualDensity: VisualDensity.compact,
        contentPadding: const EdgeInsets.only(left: 16, right: 4),
        leading: const Icon(Icons.list),
        title: Text(
          widget.autocomplete.displayName,
          style: const TextStyle(fontStyle: FontStyle.italic),
        ),
        subtitle: const Text(
          'Already on list',
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
        trailing: TextButton.icon(
          onPressed: () => _onEditListItem(widget.autocomplete),
          label: const Text('Edit'),
          icon: const Icon(Icons.edit),
        ),
      ),
    };
  }

  void _onEditListItem(ShoppingItemAutocomplete suggestion) {
    ref.read(routerProvider).go(Routes.shoppingListEditItem(widget.listId, suggestion.sourceId).path);
  }

  void _onRemoveHistoryEntry(ShoppingItemAutocomplete historyEntry) async {
    final didConfirm = await ConfirmationDialog.show(
      context,
      ConfirmationDialogContent(
        title: 'Remove from history',
        message: 'Do you want to remove this item from your history?',
        confirmationAction: 'Remove',
      ),
    );
    if (didConfirm) {
      await ref.read(shoppingItemAutocompleteUseCaseProvider(widget.listId)).removeHistoryEntry(historyEntry);
      ref.invalidate(itemAutocompleteProvider(widget.listId));
    }
  }

  void _onHideSuggestion(ShoppingItemAutocomplete suggestion) async {
    final didConfirm = await ConfirmationDialog.show(
      context,
      ConfirmationDialogContent(
        title: 'Hide suggestion',
        message: 'Do you want to hide this suggestion?',
        confirmationAction: 'Hide',
      ),
    );
    if (didConfirm) {
      await ref.read(hiddenSuggestionsUseCaseProvider).hideItemSuggestion(suggestion);
      ref.invalidate(itemAutocompleteProvider(widget.listId));
    }
  }

  void _onEditHistoryEntry(ShoppingItemAutocomplete history) {
    // TODO: Show a history edit page
  }
}

class ItemAutocompleteError extends StatelessWidget {
  const ItemAutocompleteError({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Failed to load suggestions'));
  }
}

class ItemAutocompleteLoading extends StatelessWidget {
  const ItemAutocompleteLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}

class ItemAutocompletePlaceholder extends StatelessWidget {
  const ItemAutocompletePlaceholder({super.key});

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
              'For example: 2 small green apples, 500g mince beef, two cans of tomato soup, a large loaf of bread',
            ),
          ),
        ],
      ),
    );
  }
}

class ItemAutocompleteEmpty extends StatelessWidget {
  const ItemAutocompleteEmpty({super.key});

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
  final bool isVisible;
  final bool showErrors;
  final Function(bool addMore) onSelection;
  const ShoppingItemCategorySelectView({
    required this.listId,
    required this.onEditItem,
    required this.isVisible,
    required this.showErrors,
    required this.onSelection,
    super.key,
  });

  @override
  ConsumerState<ShoppingItemCategorySelectView> createState() => _ShoppingItemCategorySelectViewState();
}

class _ShoppingItemCategorySelectViewState extends ConsumerState<ShoppingItemCategorySelectView> {
  String? categoryError;
  final controller = TextEditingController();
  final focusNode = FocusNode();
  late bool shouldShowTutorial;

  @override
  void initState() {
    super.initState();
    shouldShowTutorial = !ref.read(tutorialsProvider).contains(Tutorial.categorySelection);
    controller.addListener(() {
      ref.read(shoppingItemCreateViewModelProvider.notifier).setCategory(controller.text);
    });
  }

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant ShoppingItemCategorySelectView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isVisible && !oldWidget.isVisible) {
      if (shouldShowTutorial) {
        WidgetsBinding.instance.addPostFrameCallback((_) async {
          await Future.delayed(const Duration(milliseconds: 300));
          if (mounted) {
            await showDialog(
              context: context,
              builder: (context) => const TooltipDialog(
                title: CategorySelector.tooltipTitle,
                message: CategorySelector.tooltipMessage,
              ),
            );
            await ref.read(tutorialsProvider.notifier).markTutorialCompleted(Tutorial.categorySelection);
            focusNode.requestFocus();
            setState(() => shouldShowTutorial = false);
          }
        });
      } else {
        focusNode.requestFocus();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final bodyStyle = Theme.of(context).textTheme.bodyMedium;
    final bodyBoldStyle = bodyStyle?.copyWith(fontWeight: FontWeight.bold);
    final model = ref.watch(shoppingItemCreateViewModelProvider);
    categoryError = widget.showErrors ? model.itemErrors?.categoryError : null;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          12.vertical,
          Padding(
            padding: 16.horizontalSymmetric,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(
                        TextSpan(
                          text: 'Base product name: ',
                          style: bodyBoldStyle,
                          children: [
                            TextSpan(text: model.data.product, style: bodyStyle),
                          ],
                        ),
                      ),
                      2.vertical,
                      Text.rich(
                        TextSpan(
                          text: 'Quantity/size: ',
                          style: bodyBoldStyle,
                          children: [
                            TextSpan(
                              text: model.data.quantity.isNotEmpty ? model.data.quantity : 'Not specified',
                              style: bodyStyle,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                8.horizontal,
                TextButton.icon(
                  key: _Keys.editProductButton,
                  onPressed: widget.onEditItem,
                  label: Text('Edit'),
                  icon: Icon(Icons.edit),
                ),
              ],
            ),
          ),
          10.vertical,
          CategorySelector(
            listId: widget.listId,
            controller: controller,
            focusNode: focusNode,
            onSubmit: () {
              widget.onSelection(false);
            },
            onAddMore: () {
              widget.onSelection(true);
            },
            error: categoryError,
          ),
        ],
      ),
    );
  }
}
