import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/checklist_entry.dart';
import '../../../models/list_summary.dart';
import '../../../repositories/checklist_entry_repo.dart';
import 'checklist_text_edit_dialog.dart';

class ChecklistEditingVieww extends StatefulWidget {
  const ChecklistEditingVieww({
    super.key,
    required this.items,
    required this.list,
  });

  final List<ChecklistEntry> items;
  final ListSummary list;

  @override
  State<ChecklistEditingVieww> createState() => _ChecklistEditingViewwState();
}

enum AutoScrollDirection {
  none,
  up,
  down,
}

class _ChecklistEditingViewwState extends State<ChecklistEditingVieww> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Stack(
        children: [
          ListView.builder(
            itemCount: widget.items.length + 2,
            itemBuilder: (context, index) {
              if (index == 0) {
                return ChecklistAddActions(
                    listId: widget.list.id, addPosition: ChecklistAddPosition.start);
              }
              if (index == widget.items.length + 1) {
                return ChecklistAddActions(
                    listId: widget.list.id, addPosition: ChecklistAddPosition.end);
              }
              final entry = widget.items[index - 1];
              return entry.when(
                item: (item) => ChecklistItemTileEditing(
                  item: item,
                  listId: widget.list.id,
                ),
                heading: (header) => ChecklistHeadingTileEditing(
                  heading: header,
                  listId: widget.list.id,
                ),
              );
            },
          ),
        ],
      );
    });
  }
}

class ChecklistItemTileEditing extends ConsumerWidget {
  const ChecklistItemTileEditing({
    required this.listId,
    required this.item,
    super.key,
  });
  final String listId;
  final ChecklistItem item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      visualDensity: VisualDensity.compact,
      title: Text(
        item.name,
        style: item.completed ? const TextStyle(decoration: TextDecoration.lineThrough) : null,
      ),
      trailing: const Icon(Icons.drag_handle),
      onTap: () => showDialog(
        context: context,
        builder: (ctx) => ChecklistTextEditDialog(
          dialogTitle: 'Edit',
          initialValue: item.name,
          onComplete: (value) {
            if (value != item.name) {
              ref.read(checklistEntryRepoProvider(listId).notifier).editItem(item, value);
            }
          },
        ),
      ),
    );
  }
}

class ChecklistHeadingTileEditing extends ConsumerWidget {
  const ChecklistHeadingTileEditing({
    required this.listId,
    required this.heading,
    super.key,
  });
  final String listId;
  final ChecklistHeading heading;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      visualDensity: VisualDensity.compact,
      title: Text(heading.name, style: const TextStyle(fontWeight: FontWeight.bold)),
      onTap: () => showDialog(
        context: context,
        builder: (ctx) => ChecklistTextEditDialog(
          dialogTitle: 'Edit',
          initialValue: heading.name,
          onComplete: (value) {
            if (value != heading.name) {
              ref.read(checklistEntryRepoProvider(listId).notifier).editGroup(heading, value);
            }
          },
        ),
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
                builder: (ctx) => ChecklistTextEditDialog(
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
                builder: (ctx) => ChecklistTextEditDialog(
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
