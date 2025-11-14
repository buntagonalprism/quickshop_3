import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../application/tooltips_notifier.dart';
import '../../../../models/shopping/shopping_item.dart';
import '../../../../models/tooltip_type.dart';
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
    required this.onSubmitted,
    this.errors,
    super.key,
  });
  final String listId;
  final ShoppingItemViewData data;
  final Function(ShoppingItemRawData rawData) onDataChanged;
  final VoidCallback onSubmitted;
  final ShoppingItemErrors? errors;

  static const keys = (
    productInput: Key('shopping_item_view_product_input'),
    quantityInput: Key('shopping_item_view_quantity_input'),
    categoriesInput: Key('shopping_item_view_categories_input'),
  );

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

  static const keys = ShoppingItemView.keys;

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
                    key: keys.productInput,
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
                    key: keys.quantityInput,
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
                    key: keys.categoriesInput,
                    listId: widget.listId,
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
                    onSubmitted: widget.onSubmitted,
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
    final showNameTooltip = ref.watch(tooltipsProvider(TooltipType.shoppingItemName));
    final showQuantityTooltip = ref.watch(tooltipsProvider(TooltipType.shoppingItemQuantity));
    final showCategoriesTooltip = ref.watch(tooltipsProvider(TooltipType.shoppingItemCategories));

    if ([showNameTooltip, showQuantityTooltip, showCategoriesTooltip].any((e) => !e)) {
      return IconButton(
        icon: const Icon(Icons.help_outline),
        onPressed: () {
          ref.read(tooltipsProvider(TooltipType.shoppingItemName).notifier).set(true);
          ref.read(tooltipsProvider(TooltipType.shoppingItemQuantity).notifier).set(true);
          ref.read(tooltipsProvider(TooltipType.shoppingItemCategories).notifier).set(true);
        },
      );
    }
    return const SizedBox();
  }
}
