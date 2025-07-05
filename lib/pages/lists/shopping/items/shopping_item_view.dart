import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../models/shopping/shopping_item.dart';
import '../../../../repositories/shopping/shopping_item_repo.dart';
import '../../../../repositories/tooltips_repo.dart';
import '../../../../router.dart';
import '../../../../widgets/toggle_tooltip.dart';
import 'category_selector.dart';

class ShoppingItemView extends ConsumerStatefulWidget {
  const ShoppingItemView({required this.listId, this.item, super.key});
  final String listId;
  final ShoppingItem? item;

  @override
  ConsumerState<ShoppingItemView> createState() => _ShoppingItemViewState();
}

class _ShoppingItemViewState extends ConsumerState<ShoppingItemView> {
  List<String> selectedCategories = [];
  late final TextEditingController productController;
  late final TextEditingController quantityController;
  late final TextEditingController categoriesController = TextEditingController();
  final productFocusNode = FocusNode();
  final quantityFocusNode = FocusNode();
  final categoriesFocusNode = FocusNode();
  String? productError;
  String? categoriesError;

  late final _Mode mode;

  @override
  void initState() {
    super.initState();
    productController = TextEditingController(text: widget.item?.product);
    quantityController = TextEditingController(text: widget.item?.quantity);
    selectedCategories = widget.item?.categories ?? [];
    mode = widget.item == null ? _Mode.create : _Mode.edit;
    productController.addListener(onProductChanges);
  }

  void onProductChanges() {
    if (productError != null && productController.text.isNotEmpty) {
      setState(() => productError = null);
    }
  }

  @override
  void dispose() {
    productFocusNode.dispose();
    productController.dispose();
    categoriesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextField(
                    autofocus: true,
                    focusNode: productFocusNode,
                    textInputAction: TextInputAction.next,
                    textCapitalization: TextCapitalization.sentences,
                    decoration: InputDecoration(
                      labelText: 'Product name',
                      hintText: 'Enter product name',
                      hintStyle: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.normal,
                      ),
                      border: const OutlineInputBorder(),
                      errorText: productError,
                    ),
                    controller: productController,
                    onSubmitted: (value) => quantityFocusNode.requestFocus(),
                  ),
                  const ToggleTooltip(
                    type: TooltipType.shoppingItemName,
                    message:
                        'E.g. milk, tomato sauce, cucumbers, chicken thigh, sourdough bread, paprika, fabric softener',
                  ),
                  const SizedBox(height: 24),
                  TextField(
                    focusNode: quantityFocusNode,
                    textInputAction: TextInputAction.next,
                    textCapitalization: TextCapitalization.sentences,
                    decoration: const InputDecoration(
                      labelText: 'Quantity (optional)',
                      hintText: 'Enter quantity',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.normal,
                      ),
                      border: OutlineInputBorder(),
                    ),
                    controller: quantityController,
                    onSubmitted: (_) => categoriesFocusNode.requestFocus(),
                  ),
                  const ToggleTooltip(
                    type: TooltipType.shoppingItemQuantity,
                    message:
                        'E.g. one, 2, 3 kg, four litres, 5 cans, two dozen, a few, several, or leave blank',
                  ),
                  const SizedBox(height: 28),
                  CategorySelector(
                    focusNode: categoriesFocusNode,
                    controller: categoriesController,
                    selectedCategories: selectedCategories,
                    onCategoriesChanged: (newCategories) {
                      setState(() {
                        selectedCategories = newCategories;
                        if (newCategories.isNotEmpty) {
                          categoriesError = null;
                        }
                      });
                    },
                    error: categoriesError,
                    onSubmitted: _onDone,
                  ),
                ],
              ),
            ),
          ),
        ),
        Material(
          elevation: 4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              mode == _Mode.create
                  ? TextButton.icon(
                      onPressed: _onAddMore,
                      icon: const Icon(Icons.add),
                      label: const Text('Add more'),
                    )
                  : const SizedBox(),
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
    if (_validate()) {
      _saveItem();
      ref.read(routerProvider).pop();
    }
  }

  void _onAddMore() {
    if (_validate()) {
      _saveItem();
      _resetPage();
    }
  }

  bool _validate() {
    productError = productController.text.trim().isEmpty ? 'Please enter a product name' : null;
    categoriesError = selectedCategories.isEmpty ? 'Please select at least one category' : null;
    setState(() {});
    return ![productError, categoriesError].any((err) => err != null);
  }

  void _saveItem() {
    if (mode == _Mode.create) {
      _saveNewItem();
    } else {
      _saveUpdatedItem();
    }
  }

  void _saveNewItem() {
    final name = productController.text.trim();
    final quantity = quantityController.text.trim();
    ref.read(shoppingListItemRepoProvider(widget.listId).notifier).addItem(
          productName: name,
          quantity: quantity,
          categories: selectedCategories,
        );
    final displayName = quantity.isEmpty ? name : '$quantity $name';
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Added $displayName to list'),
      duration: const Duration(milliseconds: 2400),
    ));
  }

  void _saveUpdatedItem() {
    final name = productController.text.trim();
    final quantity = quantityController.text.trim();
    ref.read(shoppingListItemRepoProvider(widget.listId).notifier).updateItem(
          item: widget.item!,
          newName: name,
          newQuantity: quantity,
          newCategories: selectedCategories,
        );
    final displayName = quantity.isEmpty ? name : '$quantity $name';

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Updated item to $displayName'),
      duration: const Duration(milliseconds: 2400),
    ));
  }

  void _resetPage() {
    productController.clear();
    quantityController.clear();
    categoriesController.clear();
    selectedCategories.clear();
    productFocusNode.requestFocus();
  }
}

enum _Mode {
  create,
  edit,
}

class ShoppingItemTooltipAction extends ConsumerWidget {
  const ShoppingItemTooltipAction({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showNameTooltip = ref.watch(tooltipsRepoProvider(TooltipType.shoppingItemName));
    final showQuantityTooltip = ref.watch(tooltipsRepoProvider(TooltipType.shoppingItemQuantity));
    final showCategoriesTooltip =
        ref.watch(tooltipsRepoProvider(TooltipType.shoppingItemCategories));

    if ([showNameTooltip, showQuantityTooltip, showCategoriesTooltip].any((e) => !e)) {
      return IconButton(
        icon: const Icon(Icons.help_outline),
        onPressed: () {
          ref
              .read(tooltipsRepoProvider(TooltipType.shoppingItemName).notifier)
              .setDisplayTooltip(true);
          ref
              .read(tooltipsRepoProvider(TooltipType.shoppingItemQuantity).notifier)
              .setDisplayTooltip(true);
          ref
              .read(tooltipsRepoProvider(TooltipType.shoppingItemCategories).notifier)
              .setDisplayTooltip(true);
        },
      );
    }
    return const SizedBox();
  }
}
