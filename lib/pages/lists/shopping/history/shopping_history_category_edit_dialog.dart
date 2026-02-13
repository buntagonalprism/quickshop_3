import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../data/common/application/firestore_transaction.dart';
import '../../../../data/shopping/history/models/shopping_category_history.dart';
import '../../../../data/shopping/history/repositories/shopping_category_history_repo.dart';
import '../../../../data/user/repositories/user_profile_repo.dart';
import '../../../../widgets/padding.dart';

class ShoppingHistoryCategoryEditDialog extends ConsumerStatefulWidget {
  final ShoppingCategoryHistory categoryHistory;
  const ShoppingHistoryCategoryEditDialog({super.key, required this.categoryHistory});

  static Future<void> show(BuildContext context, ShoppingCategoryHistory categoryHistory) {
    return showDialog<void>(
      context: context,
      useSafeArea: false,
      builder: (BuildContext context) {
        return Dialog.fullscreen(
          child: ShoppingHistoryCategoryEditDialog(categoryHistory: categoryHistory),
        );
      },
    );
  }

  @override
  ConsumerState<ShoppingHistoryCategoryEditDialog> createState() => _ShoppingHistoryCategoryEditDialogState();
}

class _ShoppingHistoryCategoryEditDialogState extends ConsumerState<ShoppingHistoryCategoryEditDialog> {
  final nameController = TextEditingController();
  String? nameError;

  @override
  void initState() {
    super.initState();
    nameController.text = widget.categoryHistory.name;
  }

  void validateAndSave() {
    setState(() {
      nameError = nameController.text.trim().isEmpty ? 'Name cannot be empty' : null;
    });
    if (nameError == null) {
      final tx = ref.read(firestoreTransactionProvider)();
      final historyRepo = ref.read(shoppingCategoryHistoryRepoProvider);
      historyRepo.update(
        tx,
        widget.categoryHistory.id,
        nameController.text.trim(),
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
        title: Text('Edit Shopping History Category'),
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
