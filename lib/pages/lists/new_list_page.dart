import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../analytics/crash_reporter.dart';
import '../../application/lists_notifier.dart';
import '../../models/list_summary.dart';
import '../../router.dart';

class NewListPage extends ConsumerStatefulWidget {
  const NewListPage({super.key});

  @override
  ConsumerState<NewListPage> createState() => _NewListPageState();
}

class _NewListPageState extends ConsumerState<NewListPage> with SingleTickerProviderStateMixin {
  late final TabController tabController = TabController(length: 2, vsync: this);
  ListType? listType;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: listType == null,
      onPopInvokedWithResult: (didPop, _) {
        if (didPop) {
          return;
        }
        setState(() => listType = null);
        tabController.animateTo(0);
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('New list'),
        ),
        body: TabBarView(
          controller: tabController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            SelectListTypeTab(
              onSelect: (type) {
                setState(() => listType = type);
                // This lets the [InputListNameTab] build method run before the animation starts
                // so it can display the correct list type name during the animation
                WidgetsBinding.instance.addPostFrameCallback((_) => tabController.animateTo(1));
              },
            ),
            InputListNameTab(type: listType ?? ListType.shoppingList),
          ],
        ),
      ),
    );
  }
}

class SelectListTypeTab extends StatelessWidget {
  final Function(ListType) onSelect;

  const SelectListTypeTab({super.key, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 16),
            Text(
              'What type of list would you like to create?',
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: 16),
            ListTypeTile(
              title: 'Shopping List',
              description:
                  'Shopping list items have categories - like bakery, dairy, spices, or toiletries, which allow sorting the list by aisle while shopping in a supermarket',
              icon: Padding(
                padding: const EdgeInsets.all(1),
                child: Image.asset(
                  'assets/logo/logo_grey_small.png',
                  height: 30,
                  width: 30,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              onTap: () => onSelect(ListType.shoppingList),
            ),
            const SizedBox(height: 16),
            ListTypeTile(
              title: 'Checklist',
              description:
                  'A checklist is a simple list of items to complete. They can be grouped under headings and sorted arbitrarily',
              icon: Padding(
                padding: const EdgeInsets.all(2),
                child: Icon(
                  Icons.check_box_outlined,
                  color: Theme.of(context).colorScheme.primary,
                  size: 28,
                ),
              ),
              onTap: () => onSelect(ListType.checklist),
            ),
          ],
        ),
      ),
    );
  }
}

class InputListNameTab extends ConsumerStatefulWidget {
  const InputListNameTab({required this.type, super.key});
  final ListType type;

  @override
  ConsumerState<InputListNameTab> createState() => _InputListNameTabState();
}

class _InputListNameTabState extends ConsumerState<InputListNameTab> {
  final TextEditingController _nameController = TextEditingController();
  String? errorText;
  bool createInProgress = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 16),
          Text.rich(
            TextSpan(
              text: 'Enter a name for your ',
              children: [
                TextSpan(
                  text: widget.type.displayName,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 16),
          TextField(
            decoration: const InputDecoration(labelText: 'List name'),
            autofocus: true,
            controller: _nameController,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: _onSubmit,
            child: const Text('Create list'),
          ),
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
      final listId = await ref.read(listsNotifierProvider.notifier).createList(name, widget.type);
      switch (widget.type) {
        case ListType.shoppingList:
          ref.read(routerProvider).pushReplacement(Routes.shoppingListDetail(listId).path);
          break;
        case ListType.checklist:
          ref.read(routerProvider).pushReplacement(Routes.checklistDetail(listId).path);
          break;
      }
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

class ListTypeTile extends StatelessWidget {
  const ListTypeTile({
    required this.title,
    required this.description,
    required this.icon,
    required this.onTap,
    super.key,
  });

  final String title;
  final String description;
  final Widget icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).colorScheme.primary),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              children: [
                icon,
                const SizedBox(width: 8),
                Text(title, style: Theme.of(context).textTheme.headlineSmall),
              ],
            ),
            const SizedBox(height: 8),
            Text(description, style: Theme.of(context).textTheme.bodyLarge),
          ],
        ),
      ),
    );
  }
}
