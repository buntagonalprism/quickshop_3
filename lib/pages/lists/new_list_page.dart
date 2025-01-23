import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../analytics/crash_reporter.dart';
import '../../models/list_summary.dart';
import '../../repositories/list_repo.dart';
import '../../router.dart';
import '../../widgets/button_progress_indicator.dart';

class NewListPage extends ConsumerStatefulWidget {
  const NewListPage({super.key});

  @override
  ConsumerState<NewListPage> createState() => _NewListPageState();
}

class _NewListPageState extends ConsumerState<NewListPage> {
  final TextEditingController _nameController = TextEditingController();
  String? errorText;
  ListType listType = ListType.shoppingList;
  bool createInProgress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New list'),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    TextField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        labelText: 'List name',
                        errorText: errorText,
                      ),
                    ),
                    ListTile(
                      title: const Text('Shopping List'),
                      leading: Radio<ListType>(
                        value: ListType.shoppingList,
                        groupValue: listType,
                        onChanged: (ListType? value) => setState(() => listType = value!),
                      ),
                      trailing: Image.asset(
                        'assets/logo/logo.png',
                        height: 24,
                        width: 24,
                      ),
                    ),
                    const Text(
                        'A shopping list is a list of items with categories - like bakery, dairy, spices, or toiletries. These categories allow sorting the list by aisle while shopping in a store or supermarket.'),
                    ListTile(
                      title: const Text('Checklist'),
                      leading: Radio<ListType>(
                        value: ListType.checklist,
                        groupValue: listType,
                        onChanged: (ListType? value) => setState(() => listType = value!),
                      ),
                    ),
                    const Text('A checklist is a simple list of items without categories'),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () => ref.read(routerProvider).pop(),
                    child: const Text('Cancel'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: createInProgress ? null : _onSubmit,
                    child:
                        createInProgress ? const ButtonProgressIndicator() : const Text('Create'),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void _onSubmit() async {
    final name = _nameController.text;
    if (name.isEmpty) {
      setState(() => errorText = 'Name cannot be empty');
      return;
    }
    setState(() => createInProgress = true);
    try {
      final listId = await ref.read(listRepoProvider.notifier).createList(name, listType);
      ref.read(routerProvider).pushReplacement(Routes.shoppingListDetail(listId).path);
    } catch (e, t) {
      ref.read(crashReporterProvider).report(e, t);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to create list')),
        );
      }
    } finally {
      setState(() => createInProgress = false);
    }
  }
}
