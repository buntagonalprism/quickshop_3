import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../widgets/padding.dart';
import '../../../../widgets/tooltip_button.dart';
import 'category_selector_view_model.dart';

class CategorySelector extends StatefulWidget {
  const CategorySelector({
    required this.listId,
    required this.onCategorySelected,
    required this.error,
    required this.controller,
    this.focusNode,
    this.onSubmitted,
    super.key,
  });
  final String listId;
  final void Function() onCategorySelected;
  final String? error;
  final FocusNode? focusNode;
  final TextEditingController controller;
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
    controller = widget.controller;
    focusNode = widget.focusNode ?? FocusNode();
    focusNode.addListener(onFocusChanged);
    controller.addListener(onInput);
  }

  @override
  void didUpdateWidget(CategorySelector oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller != oldWidget.controller) {
      controller.removeListener(onInput);
      controller = widget.controller;
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
    return InputDecorator(
      isFocused: focusNode.hasFocus,
      decoration: InputDecoration(
        labelText: 'Category',
        border: const OutlineInputBorder(),
        contentPadding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
        isDense: true,
        errorText: widget.error,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          LayoutBuilder(
            builder: (context, constraints) {
              return Consumer(
                builder: (context, ref, _) {
                  final vm = ref.watch(categorySelectorViewModelProvider(widget.listId));
                  return RawAutocomplete<CategorySelectorItem>(
                    optionsViewOpenDirection: OptionsViewOpenDirection.up,
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
                    fieldViewBuilder: (context, textEditingController, focusNode, onFieldSubmitted) {
                      return TextFormField(
                        controller: textEditingController,
                        focusNode: focusNode,
                        onFieldSubmitted: (String value) => widget.onSubmitted?.call(),
                        textInputAction: TextInputAction.done,
                        textCapitalization: TextCapitalization.sentences,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: const InputDecoration(
                          hintText: 'Enter category name',
                          hintStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.normal),
                          border: InputBorder.none,
                          suffixIcon: TooltipButton(
                            title: 'Product categories',
                            message:
                                'The categories where you might find this product in store. For example:\n\nDairy, Sauces, Herbs & Spices, Bakery, Laundry, Cleaning Supplies.',
                          ),
                        ),
                      );
                    },
                    optionsViewBuilder: (context, onSelected, options) {
                      return Align(
                        alignment: Alignment.bottomLeft,
                        child: ConstrainedBox(
                          constraints: BoxConstraints(maxHeight: 200, maxWidth: constraints.maxWidth),
                          child: Material(
                            elevation: 4,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: options.length,
                              itemBuilder: (BuildContext context, int index) {
                                final option = options.elementAt(index);
                                return option.when(
                                  newCategory: () => CategoryAutocompleteTile(
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
                                    onTap: () => _selectCategory(controller.text),
                                  ),
                                  list: (name) => CategoryAutocompleteTile(
                                    title: Text(name),
                                    onTap: () => _selectCategory(name),
                                  ),
                                  suggestion: (name) => CategoryAutocompleteTile(
                                    title: Text(name),
                                    onTap: () => _selectCategory(name),
                                  ),
                                  history: (name) => CategoryAutocompleteTile(
                                    title: Text(name),
                                    onTap: () => _selectCategory(name),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            },
          ),
          4.vertical,
        ],
      ),
    );
  }

  void _selectCategory(String category) {
    controller.text = category;
    widget.onCategorySelected();
  }
}

class CategoryAutocompleteTile extends StatelessWidget {
  final Widget title;
  final VoidCallback onTap;
  const CategoryAutocompleteTile({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: title,
      onTap: onTap,
    );
  }
}
