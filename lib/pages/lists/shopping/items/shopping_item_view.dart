import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../data/settings/application/tooltips_notifier.dart';
import '../../../../data/shopping/items/models/shopping_item.dart';
import '../../../../data/shopping/items/models/shopping_item_raw_data.dart';
import '../../../../data/settings/models/tooltip_type.dart';
import '../../../../widgets/padding.dart';
import '../../../../widgets/tooltip_button.dart';
import 'category_selector.dart';
import 'models/shopping_item_errors.dart';

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
  late final TextEditingController productController;
  late final TextEditingController quantityController;
  late final TextEditingController categoryController;
  final productFocusNode = FocusNode();
  final quantityFocusNode = FocusNode();
  final categoryFocusNode = FocusNode();

  late final _Mode mode;

  static const keys = ShoppingItemView.keys;

  @override
  void initState() {
    super.initState();
    switch (widget.data) {
      case ShoppingItemViewEditData(:final item):
        productController = TextEditingController(text: item.product);
        quantityController = TextEditingController(text: item.quantity);
        categoryController = TextEditingController(text: item.category);
        mode = _Mode.edit;
        break;
      case ShoppingItemViewCreateData(:final rawData):
        productController = TextEditingController(text: rawData.product);
        quantityController = TextEditingController(text: rawData.quantity);
        categoryController = TextEditingController(text: rawData.category);
        mode = _Mode.create;
        break;
    }
    productController.addListener(onDataChanges);
    quantityController.addListener(onDataChanges);
    categoryController.addListener(onDataChanges);
  }

  void onDataChanges() {
    widget.onDataChanged(
      ShoppingItemRawData(
        product: productController.text,
        quantity: quantityController.text,
        category: categoryController.text,
      ),
    );
  }

  @override
  void dispose() {
    productFocusNode.dispose();
    productController.dispose();
    categoryController.dispose();
    categoryFocusNode.dispose();
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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                16.vertical,
                Padding(
                  padding: 16.horizontalSymmetric,
                  child: TextField(
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
                ),
                20.vertical,
                Padding(
                  padding: 16.horizontalSymmetric,
                  child: TextField(
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
                    onSubmitted: (_) => categoryFocusNode.requestFocus(),
                  ),
                ),
                20.vertical,
                CategorySelector(
                  key: keys.categoriesInput,
                  listId: widget.listId,
                  focusNode: categoryFocusNode,
                  controller: categoryController,
                  onSubmit: () => setState(() => onDataChanges()),
                  error: widget.errors?.categoryError,
                ),
                16.vertical,
              ],
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
    final showCategoryTooltip = ref.watch(tooltipsProvider(TooltipType.shoppingItemCategory));

    if ([showNameTooltip, showQuantityTooltip, showCategoryTooltip].any((e) => !e)) {
      return IconButton(
        icon: const Icon(Icons.help_outline),
        onPressed: () {
          ref.read(tooltipsProvider(TooltipType.shoppingItemName).notifier).set(true);
          ref.read(tooltipsProvider(TooltipType.shoppingItemQuantity).notifier).set(true);
          ref.read(tooltipsProvider(TooltipType.shoppingItemCategory).notifier).set(true);
        },
      );
    }
    return const SizedBox();
  }
}
