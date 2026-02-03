import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../application/hidden_suggestions_use_case.dart';
import '../../../../application/shopping/autcomplete/shopping_category_autocomplete_use_case.dart';
import '../../../../models/shopping/autocomplete/shopping_category_autocomplete.dart';
import '../../../../widgets/confirmation_dialog.dart';
import 'category_selector_view_model.dart';

class CategorySelector extends ConsumerStatefulWidget {
  const CategorySelector({
    required this.listId,
    required this.onSubmit,
    required this.error,
    required this.controller,
    this.focusNode,
    this.onAddMore,
    super.key,
  });
  final String listId;
  final void Function() onSubmit;
  final void Function()? onAddMore;
  final String? error;
  final FocusNode? focusNode;
  final TextEditingController controller;

  static const tooltipTitle = 'Product category';
  static const tooltipMessage =
      'QuickShop uses categories to organse your shopping list.\n\nEnter the category where you might find this product in store. For example:\n\nDairy, Sauces, Herbs & Spices, Bakery, Laundry, Cleaning Supplies.';

  @override
  ConsumerState<CategorySelector> createState() => _CategorySelectorState();
}

class _CategorySelectorState extends ConsumerState<CategorySelector> {
  @override
  Widget build(BuildContext context) {
    final filter = ref.watch(categoryFilterProvider(widget.listId));
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
          child: TextField(
            decoration: InputDecoration(
              labelText: 'Enter category name',
              errorText: widget.error,
            ),
            focusNode: widget.focusNode,
            controller: widget.controller,
            onChanged: (newValue) {
              ref.read(categoryFilterProvider(widget.listId).notifier).setFilter(newValue);
            },
            onSubmitted: (_) => widget.onSubmit(),
          ),
        ),
        ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: 200,
          ),
          child: filter.isEmpty
              ? const CategoryAutocompletePlaceholder()
              : CategorySuggestionsList(
                  listId: widget.listId,
                  onSelect: (suggestion) {
                    widget.controller.text = suggestion.name;
                    widget.onSubmit();
                  },
                  onSelectAndAdd: widget.onAddMore != null
                      ? (suggestion) {
                          widget.controller.text = suggestion.name;
                          widget.onAddMore!();
                        }
                      : null,
                ),
        ),
      ],
    );
  }
}

class CategorySuggestionsList extends ConsumerStatefulWidget {
  const CategorySuggestionsList({
    required this.listId,
    required this.onSelect,
    required this.onSelectAndAdd,
    super.key,
  });
  final String listId;
  final Function(ShoppingCategoryAutocomplete) onSelect;
  final Function(ShoppingCategoryAutocomplete)? onSelectAndAdd;

  @override
  ConsumerState<CategorySuggestionsList> createState() => _CategorySuggestionsListState();
}

class _CategorySuggestionsListState extends ConsumerState<CategorySuggestionsList> {
  int? highlightedIndex;
  bool preventTaps = false;

  @override
  Widget build(BuildContext context) {
    final autocompleteAsync = ref.watch(categoryAutocompleteProvider(widget.listId));
    if (autocompleteAsync.isLoading && !autocompleteAsync.hasValue) {
      return CategoryAutocompleteLoading();
    }
    if (autocompleteAsync.hasError) {
      return CategoryAutocompleteError();
    }
    final autocompletes = autocompleteAsync.requireValue;
    if (autocompletes.isEmpty) {
      return const CategoryAutocompleteEmpty();
    }
    return ListView.builder(
      itemCount: autocompletes.length,
      itemBuilder: (context, index) {
        final autocomplete = autocompletes[index];
        return CategoryAutocompleteEntry(
          listId: widget.listId,
          autocomplete: autocomplete,
          onAdd: () => widget.onSelect(autocomplete),
          onAddMore: widget.onSelectAndAdd != null ? () => widget.onSelectAndAdd!(autocomplete) : null,
        );
      },
    );
  }
}

class CategoryAutocompleteEntry extends ConsumerStatefulWidget {
  final String listId;
  final ShoppingCategoryAutocomplete autocomplete;
  final VoidCallback onAdd;
  final VoidCallback? onAddMore;
  const CategoryAutocompleteEntry({
    super.key,
    required this.listId,
    required this.autocomplete,
    required this.onAdd,
    required this.onAddMore,
  });

  @override
  ConsumerState<CategoryAutocompleteEntry> createState() => _CategoryAutocompleteEntryState();
}

class _CategoryAutocompleteEntryState extends ConsumerState<CategoryAutocompleteEntry> {
  bool highlighted = false;
  bool preventTaps = false;

  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
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
        title: Text(widget.autocomplete.name),
        leading: Icon(
          <ShoppingCategoryAutocompleteSource>{.history, .list}.contains(widget.autocomplete.source)
              ? Icons.history
              : null,
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
        trailing: widget.onAddMore != null
            ? IconButton(
                icon: const Icon(Icons.add),
                onPressed: () => widget.onAddMore!(),
              )
            : null,
      ),
      style: const MenuStyle(
        alignment: Alignment.center,
      ),
      alignmentOffset: const Offset(-36, 0),
      menuChildren: switch (widget.autocomplete.source) {
        ShoppingCategoryAutocompleteSource.suggested => [
          MenuItemButton(
            child: const Text('Hide suggestion'),
            onPressed: () => _onHideSuggestion(widget.autocomplete),
          ),
        ],
        ShoppingCategoryAutocompleteSource.history => [
          MenuItemButton(
            child: const Text('Edit history entry'),
            onPressed: () => _onEditHistoryEntry(widget.autocomplete),
          ),
          MenuItemButton(
            child: const Text('Remove from history'),
            onPressed: () => _onRemoveHistoryEntry(widget.autocomplete),
          ),
        ],
        ShoppingCategoryAutocompleteSource.list => [
          MenuItemButton(
            child: const Text('This is a category from your current shopping list'),
            onPressed: () {},
          ),
        ],
      },
    );
  }

  void _onRemoveHistoryEntry(ShoppingCategoryAutocomplete historyEntry) async {
    final didConfirm = await ConfirmationDialog.show(
      context,
      ConfirmationDialogContent(
        title: 'Remove from history',
        message: 'Do you want to remove this category from your history?',
        confirmationAction: 'Remove',
      ),
    );
    if (didConfirm) {
      await ref.read(shoppingCategoryAutocompleteUseCaseProvider(widget.listId)).removeHistoryEntry(historyEntry);
    }
  }

  void _onHideSuggestion(ShoppingCategoryAutocomplete suggestion) async {
    final didConfirm = await ConfirmationDialog.show(
      context,
      ConfirmationDialogContent(
        title: 'Hide suggestion',
        message: 'Do you want to hide this suggestion?',
        confirmationAction: 'Hide',
      ),
    );
    if (didConfirm) {
      await ref.read(hiddenSuggestionsUseCaseProvider).hideCategorySuggestion(suggestion);
      ref.invalidate(categoryAutocompleteProvider(widget.listId));
    }
  }

  void _onEditHistoryEntry(ShoppingCategoryAutocomplete history) {
    // TODO: Show a history edit page
  }
}

class CategoryAutocompleteError extends StatelessWidget {
  const CategoryAutocompleteError({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Failed to load suggestions'));
  }
}

class CategoryAutocompleteLoading extends StatelessWidget {
  const CategoryAutocompleteLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}

class CategoryAutocompletePlaceholder extends StatelessWidget {
  const CategoryAutocompletePlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: Icon(Icons.search),
            title: Text('Start typing to search suggested categories and your category history'),
          ),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Long press suggestions to edit or delete them'),
          ),
        ],
      ),
    );
  }
}

class CategoryAutocompleteEmpty extends StatelessWidget {
  const CategoryAutocompleteEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('No suggestions found'),
    );
  }
}
