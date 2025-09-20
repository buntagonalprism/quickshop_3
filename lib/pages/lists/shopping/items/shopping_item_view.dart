import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../models/shopping/shopping_item.dart';
import '../../../../repositories/tooltips_repo.dart';
import '../../../../widgets/padding.dart';
import '../../../../widgets/tooltip_button.dart';
import 'category_selector.dart';
import 'models/shopping_item_errors.dart';
import 'models/shopping_item_raw_data.dart';

sealed class ShoppingItemViewData {}

class ShoppingItemViewEditData extends ShoppingItemViewData {
  ShoppingItemViewEditData({required this.item});
  final ShoppingItem item;
}

class ShoppingItemViewCreateData extends ShoppingItemViewData {
  ShoppingItemViewCreateData({required this.rawData});
  final ShoppingItemRawData rawData;
}

class ShoppingItemView extends ConsumerStatefulWidget {
  const ShoppingItemView({
    required this.listId,
    required this.data,
    required this.onDataChanged,
    required this.onDone,
    this.errors,
    super.key,
  });
  final String listId;
  final ShoppingItemViewData data;
  final Function(ShoppingItemRawData rawData) onDataChanged;
  final VoidCallback onDone;
  final ShoppingItemErrors? errors;

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

  late final _Mode mode;

  @override
  void initState() {
    super.initState();
    switch (widget.data) {
      case ShoppingItemViewEditData(:final item):
        productController = TextEditingController(text: item.product);
        quantityController = TextEditingController(text: item.quantity);
        selectedCategories = item.categories;
        mode = _Mode.edit;
        break;
      case ShoppingItemViewCreateData(:final rawData):
        productController = TextEditingController(text: rawData.product);
        quantityController = TextEditingController(text: rawData.quantity);
        selectedCategories = rawData.categories;
        mode = _Mode.create;
        break;
    }
    productController.addListener(onDataChanges);
    quantityController.addListener(onDataChanges);
  }

  void onDataChanges() {
    widget.onDataChanged(ShoppingItemRawData(
      product: productController.text,
      quantity: quantityController.text,
      categories: selectedCategories,
    ));
  }

  @override
  void dispose() {
    productFocusNode.dispose();
    productController.dispose();
    categoriesController.dispose();
    categoriesFocusNode.dispose();
    quantityFocusNode.dispose();
    quantityController.dispose();
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
                      errorText: widget.errors?.productError,
                      suffixIcon: TooltipButton(
                        title: 'Product name',
                        message:
                            'The base name of the product, without any quantity or size. For example:\n\nMilk, Tomato sauce, Cucumbers, Chicken thigh, Sourdough bread, Paprika, Fabric softener.',
                      ),
                    ),
                    controller: productController,
                    onSubmitted: (value) => quantityFocusNode.requestFocus(),
                  ),
                  20.vertical,
                  TextField(
                    focusNode: quantityFocusNode,
                    textInputAction: TextInputAction.next,
                    textCapitalization: TextCapitalization.sentences,
                    decoration: const InputDecoration(
                      labelText: 'Quantity / size (optional)',
                      hintText: 'Enter quantity',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.normal,
                      ),
                      border: OutlineInputBorder(),
                      suffixIcon: TooltipButton(
                        title: 'Quantity / size',
                        message:
                            'The quantity or size of the product you want to buy. For example:\n\none, 2, 3 kg, four litres, 5 cans, two dozen, a few, several, or leave blank',
                      ),
                    ),
                    controller: quantityController,
                    onSubmitted: (_) => categoriesFocusNode.requestFocus(),
                  ),
                  20.vertical,
                  CategorySelector(
                    focusNode: categoriesFocusNode,
                    controller: categoriesController,
                    selectedCategories: selectedCategories,
                    onCategoriesChanged: (newCategories) {
                      setState(() {
                        selectedCategories = newCategories;
                        onDataChanges();
                      });
                    },
                    error: widget.errors?.categoriesError,
                    onSubmitted: widget.onDone,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
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
    final showCategoriesTooltip = ref.watch(tooltipsRepoProvider(TooltipType.shoppingItemCategories));

    if ([showNameTooltip, showQuantityTooltip, showCategoriesTooltip].any((e) => !e)) {
      return IconButton(
        icon: const Icon(Icons.help_outline),
        onPressed: () {
          ref.read(tooltipsRepoProvider(TooltipType.shoppingItemName).notifier).setDisplayTooltip(true);
          ref.read(tooltipsRepoProvider(TooltipType.shoppingItemQuantity).notifier).setDisplayTooltip(true);
          ref.read(tooltipsRepoProvider(TooltipType.shoppingItemCategories).notifier).setDisplayTooltip(true);
        },
      );
    }
    return const SizedBox();
  }
}
