import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../repositories/tooltips_repo.dart';
import '../../../widgets/toggle_tooltip.dart';
import 'category_selector_view_model.dart';

class CategorySelector extends StatefulWidget {
  const CategorySelector({
    required this.selectedCategories,
    required this.onCategoriesChanged,
    required this.error,
    this.focusNode,
    this.controller,
    this.onSubmitted,
    super.key,
  });
  final List<String> selectedCategories;
  final void Function(List<String>) onCategoriesChanged;
  final String? error;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final VoidCallback? onSubmitted;

  @override
  State<CategorySelector> createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  late TextEditingController controller;
  late FocusNode focusNode;
  bool enableAddCategory = false;

  @override
  void initState() {
    super.initState();
    controller = widget.controller ?? TextEditingController();
    focusNode = widget.focusNode ?? FocusNode();
    focusNode.addListener(onFocusChanged);
    controller.addListener(onInput);
  }

  @override
  void didUpdateWidget(CategorySelector oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller != oldWidget.controller) {
      controller.removeListener(onInput);
      controller = widget.controller ?? TextEditingController();
      controller.addListener(onInput);
    }
    if (widget.focusNode != oldWidget.focusNode) {
      focusNode.removeListener(onFocusChanged);
      focusNode = widget.focusNode ?? FocusNode();
      focusNode.addListener(onFocusChanged);
    }
  }

  void onFocusChanged() {
    setState(() {});
  }

  void onInput() {
    final newEnableAddCategory = controller.text.length >= 2;
    if (enableAddCategory != newEnableAddCategory) {
      setState(() => enableAddCategory = newEnableAddCategory);
    }
  }

  @override
  void dispose() {
    focusNode.removeListener(onFocusChanged);
    controller.removeListener(onInput);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InputDecorator(
          isFocused: focusNode.hasFocus,
          decoration: InputDecoration(
            labelText: 'Categories',
            border: const OutlineInputBorder(),
            contentPadding: const EdgeInsets.fromLTRB(12, 16, 12, 4),
            errorText: widget.error,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              widget.selectedCategories.isEmpty
                  ? const Padding(
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                      child: Text(
                        'No categories selected',
                        style: TextStyle(fontStyle: FontStyle.italic),
                        textAlign: TextAlign.center,
                      ),
                    )
                  : Wrap(
                      spacing: 8,
                      children: widget.selectedCategories
                          .map((category) => Chip(
                                label: Text(category),
                                onDeleted: () => widget.onCategoriesChanged(
                                    List.from(widget.selectedCategories)..remove(category)),
                              ))
                          .toList(),
                    ),
              LayoutBuilder(builder: (context, constraints) {
                return Consumer(builder: (context, ref, _) {
                  final vm = ref.watch(categorySelectorViewModelProvider);
                  return RawAutocomplete<CategorySelectorItem>(
                    focusNode: focusNode,
                    textEditingController: controller,
                    optionsBuilder: (textEditingValue) {
                      if (textEditingValue.text.isEmpty) {
                        return const [];
                      }
                      // While the search query for items is being performed, the autocomplete will
                      // show the items from the last successfully completd query.
                      return vm.getItems(textEditingValue.text);
                    },
                    fieldViewBuilder:
                        (context, textEditingController, focusNode, onFieldSubmitted) {
                      return TextFormField(
                        controller: textEditingController,
                        focusNode: focusNode,
                        onFieldSubmitted: (String value) => widget.onSubmitted?.call(),
                        textInputAction: TextInputAction.done,
                        textCapitalization: TextCapitalization.sentences,
                        decoration: const InputDecoration(
                          hintText: 'Enter category name',
                          hintStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.normal),
                          border: InputBorder.none,
                        ),
                      );
                    },
                    optionsViewBuilder: (context, onSelected, options) {
                      return Align(
                        alignment: Alignment.topLeft,
                        child: ConstrainedBox(
                          constraints:
                              BoxConstraints(maxHeight: 200, maxWidth: constraints.maxWidth),
                          child: Material(
                            elevation: 4,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: options.length,
                              itemBuilder: (BuildContext context, int index) {
                                final option = options.elementAt(index);
                                return option.when(
                                  newCategory: () => ListTile(
                                    title: Text.rich(
                                      TextSpan(
                                        text: 'Add new category: ',
                                        children: [
                                          TextSpan(
                                            text: controller.text,
                                            style: const TextStyle(fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                    onTap: () => _addCategory(controller.text),
                                  ),
                                  heading: (name) => ListTile(
                                    title: Text(name),
                                    enabled: false,
                                  ),
                                  suggestion: (name) => ListTile(
                                    title: Text(name),
                                    onTap: () => _addCategory(name),
                                  ),
                                  history: (name) => ListTile(
                                    title: Text(name),
                                    onTap: () => _addCategory(name),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      );
                    },
                  );
                });
              }),
            ],
          ),
        ),
        const SizedBox(height: 8),
        const ToggleTooltip(
          type: TooltipType.shoppingItemCategories,
          message:
              'E.g. dairy, sauces, fruit & vegetables, meat, bakery, herbs and spices, laundry. These are the categories where you might find this item in store.',
        ),
      ],
    );
  }

  void _addCategory(String category) {
    widget.onCategoriesChanged(List.from(widget.selectedCategories)..add(category));
    controller.clear();
  }
}

final List<String> itemSuggestions = [
  'Apples',
  'Bananas',
  'Oranges',
  'Pears',
  'Potatoes',
  'Carrots',
  'Broccoli',
  'Tomatoes',
  'Lettuce',
  'Cucumbers',
  'Onions',
  'Garlic',
  'Peppers',
  'Milk',
  'Bread',
  'Eggs',
  'Butter',
  'Cheese',
  'Yogurt',
  'Chicken',
  'Chicken breast',
  'Chicken thigh',
  'Beef',
  'Pork',
  'Fish',
  'Rice',
  'Pasta',
  'Applesauce',
  'Peanut Butter',
  'Jelly',
  'Cereal',
  'Oatmeal',
  'Granola Bars',
  'Chips',
  'Salsa',
  'Cookies',
  'Crackers',
  'Popcorn',
  'Ice Cream',
  'Frozen Pizza',
];

final List<String> categorySuggestions = [
  'Fruit and Vegetables',
  'Dairy',
  'Meat',
  'Laundry',
  'Cleaning',
  'Pasta',
  'Soft Drinks',
  'Pantry',
  'Frozen',
  'Bakery',
  'Snacks',
  'Beverages',
  'Household',
  'Personal Care',
  'Pet',
];
