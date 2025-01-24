import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../../models/list_summary.dart';
import '../../../repositories/checklist_entry_repo.dart';
import '../../../widgets/center_scrollable_column.dart';
import '../list_detail_drawer.dart';
import 'checklist_view_model.dart';

class ChecklistPage extends ConsumerStatefulWidget {
  const ChecklistPage({required this.listId, super.key});
  final String listId;

  @override
  ConsumerState<ChecklistPage> createState() => _ChecklistPageState();
}

class _ChecklistPageState extends ConsumerState<ChecklistPage> {
  bool isEditing = false;

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(checklistViewModelProvider(widget.listId));
    final listTitle = state.maybeWhen(
      success: (list, _) => list.name,
      orElse: () => '',
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(listTitle),
        actions: [
          Builder(builder: (context) {
            return IconButton(
              icon: const Icon(Icons.more_vert),
              tooltip: 'Show menu',
              onPressed: () => Scaffold.of(context).openEndDrawer(),
            );
          }),
        ],
      ),
      endDrawer: ListDetailDrawer(
        listId: widget.listId,
        actions: [
          ListAction(
            name: 'Delete completed items',
            icon: const Icon(Icons.delete),
            onTap: () => onRemoveCheckedItems(),
          )
        ],
      ),
      body: state.when(
        notFound: () => const Center(child: Text('List not found')),
        error: () => const Center(child: Text('Failed to load list')),
        loading: () => const Center(child: CircularProgressIndicator()),
        success: (list, items) => ChecklistContentsView(
          list: list,
          items: items,
          isEditing: isEditing,
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: isEditing ? const Text('Done') : const Text('Edit'),
        icon: isEditing ? const Icon(Icons.done) : const Icon(Icons.edit),
        onPressed: () {
          setState(() => isEditing = !isEditing);
        },
      ),
    );
  }

  void onRemoveCheckedItems() async {
    Navigator.pop(context);
    throw UnimplementedError('onRemoveCheckedItems is not implemented');
  }
}

@visibleForTesting
class ChecklistContentsView extends StatelessWidget {
  const ChecklistContentsView({
    required this.list,
    required this.items,
    required this.isEditing,
    super.key,
  });
  final ListSummary list;
  final List<ChecklistPageEntry> items;
  final bool isEditing;

  @override
  Widget build(BuildContext context) {
    if (isEditing) {
      return ListView.builder(
        itemCount: items.length + 2,
        itemBuilder: (context, index) {
          if (index == 0) {
            return ChecklistAddActions(listId: list.id, addPosition: ChecklistAddPosition.start);
          }
          if (index == items.length + 1) {
            return ChecklistAddActions(listId: list.id, addPosition: ChecklistAddPosition.end);
          }
          return const SizedBox(height: 16);
        },
      );
    }
    if (items.isEmpty) {
      return const ChecklistEmptyView();
    }
    return Center(child: Text('ChecklistContentsView with list containing ${items.length} items'));
  }
}

@visibleForTesting
class ChecklistEmptyView extends StatelessWidget {
  const ChecklistEmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: CenterScrollableColumn(
        children: [
          SvgPicture.asset('assets/images/list_empty_icon.svg', height: 150, width: 120),
          const SizedBox(height: 16),
          Text(
            'This checklist is empty. It look\'s like you\'re all done for now!',
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text.rich(
            const TextSpan(
              text: 'To add items to this list and group them under headings, use the edit button ',
              children: [
                WidgetSpan(child: Icon(Icons.edit)),
                TextSpan(text: ' below'),
              ],
            ),
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text.rich(
            const TextSpan(
              text: 'To share this list with others open the options menu ',
              children: [
                WidgetSpan(child: Icon(Icons.more_vert)),
                TextSpan(text: ' above'),
              ],
            ),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}

class ChecklistAddActions extends ConsumerWidget {
  const ChecklistAddActions({
    required this.addPosition,
    required this.listId,
    super.key,
  });
  final ChecklistAddPosition addPosition;
  final String listId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton.icon(
              onPressed: () => showDialog(
                context: context,
                builder: (ctx) => ChecklistTextDialog(
                  dialogTitle: 'Add group',
                  fieldName: 'Group name',
                  onComplete: (value) => ref
                      .read(checklistEntryRepoProvider(listId).notifier)
                      .addGroup(value, addPosition),
                ),
              ),
              label: const Text('Add group'),
              icon: const Icon(Icons.category),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: OutlinedButton.icon(
              onPressed: () => showDialog(
                context: context,
                builder: (ctx) => ChecklistTextDialog(
                  dialogTitle: 'Add item',
                  fieldName: 'Item name',
                  onComplete: (value) => ref
                      .read(checklistEntryRepoProvider(listId).notifier)
                      .addItem(value, addPosition),
                ),
              ),
              label: const Text('Add item'),
              icon: const Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}

class ChecklistTextDialog extends StatefulWidget {
  const ChecklistTextDialog({
    required this.dialogTitle,
    required this.onComplete,
    this.fieldName,
    this.initialValue,
    super.key,
  });
  final String dialogTitle;
  final String? fieldName;
  final String? initialValue;
  final Function(String) onComplete;

  @override
  State<ChecklistTextDialog> createState() => _ChecklistTextDialogState();
}

class _ChecklistTextDialogState extends State<ChecklistTextDialog> {
  late final TextEditingController controller;
  String? error;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.initialValue);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.dialogTitle),
      content: TextField(
        autofocus: true,
        controller: controller,
        decoration: InputDecoration(
          labelText: widget.fieldName,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () => onSave(),
          child: const Text('Save'),
        ),
      ],
    );
  }

  void onSave() {
    final text = controller.text.trim();
    if (text.isEmpty) {
      setState(() => error = 'Please enter a value');
      return;
    }
    widget.onComplete(text);
    Navigator.pop(context);
  }
}
