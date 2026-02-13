import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../data/common/application/firestore_transaction.dart';
import '../../../../data/shopping/history/models/shopping_item_history.dart';
import '../../../../data/shopping/history/repositories/shopping_item_history_repo.dart';
import '../../../../data/user/repositories/user_profile_repo.dart';
import '../../../../widgets/padding.dart';

class ShoppingHistoryItemEditDialog extends ConsumerStatefulWidget {
  final ShoppingItemHistory itemHistory;
  const ShoppingHistoryItemEditDialog({super.key, required this.itemHistory});

  static Future<void> show(BuildContext context, ShoppingItemHistory itemHistory) {
    return showDialog<void>(
      context: context,
      useSafeArea: false, // Set to false to ensure it covers the whole screen
      builder: (BuildContext context) {
        return Dialog.fullscreen(
          child: ShoppingHistoryItemEditDialog(itemHistory: itemHistory),
        );
      },
    );
  }

  @override
  ConsumerState<ShoppingHistoryItemEditDialog> createState() => _ShoppingHistoryItemEditDialogState();
}

class _ShoppingHistoryItemEditDialogState extends ConsumerState<ShoppingHistoryItemEditDialog> {
  final nameController = TextEditingController();
  final categoryController = TextEditingController();
  String? nameError;
  String? categoryError;

  @override
  void initState() {
    super.initState();
    nameController.text = widget.itemHistory.name;
    categoryController.text = widget.itemHistory.category;
  }

  void validateAndSave() {
    setState(() {
      nameError = nameController.text.trim().isEmpty ? 'Name cannot be empty' : null;
      categoryError = categoryController.text.trim().isEmpty ? 'Category cannot be empty' : null;
    });
    if (nameError == null && categoryError == null) {
      final tx = ref.read(firestoreTransactionProvider)();
      final historyRepo = ref.read(shoppingItemHistoryRepoProvider);
      historyRepo.update(
        tx,
        widget.itemHistory.id,
        nameController.text.trim(),
        categoryController.text.trim(),
      );
      ref.read(userProfileRepoProvider).setLastHistoryUpdate(tx, DateTime.now());
      tx.commit();
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Shopping History Item'),
        automaticallyImplyLeading: false,
        leading: CloseButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: .stretch,
          children: [
            TextField(
              controller: nameController,
              autofocus: true,
              decoration: InputDecoration(
                labelText: 'Name',
                errorText: nameError,
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: categoryController,
              decoration: InputDecoration(
                labelText: 'Category',
                errorText: categoryError,
              ),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: validateAndSave,
              child: Text('Save'),
            ),
            MediaQuery.of(context).padding.bottom.vertical,
          ],
        ),
      ),
    );
  }
}
