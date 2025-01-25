import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/checklist_entry.dart';
import '../../../repositories/checklist_entry_repo.dart';
import 'checklist_view_model.dart';

class ChecklistPageEntryTile extends StatelessWidget {
  const ChecklistPageEntryTile({
    required this.listId,
    required this.entry,
    super.key,
  });
  final String listId;
  final ChecklistPageEntry entry;

  @override
  Widget build(BuildContext context) {
    return entry.when(
      ungroupedItem: (item) => ChecklistItemTile(
        item: item,
        listId: listId,
      ),
      header: (header) => ChecklistGroupTile(
        group: header,
      ),
      groupedItem: (item, group, isLast) => ChecklistGroupedItemTile(
        item: item,
        isLast: isLast,
        listId: listId,
      ),
    );
  }
}

class ChecklistItemTile extends ConsumerWidget {
  const ChecklistItemTile({
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
      onTap: () => toggleItemCompleted(ref),
      title: Text(
        item.name,
        style: item.completed ? const TextStyle(decoration: TextDecoration.lineThrough) : null,
      ),
      trailing: Checkbox(
        value: item.completed,
        onChanged: (value) => toggleItemCompleted(ref),
      ),
    );
  }

  void toggleItemCompleted(WidgetRef ref) {
    ref.read(checklistEntryRepoProvider(listId).notifier).toggleItem(item);
  }
}

class ChecklistGroupTile extends StatelessWidget {
  const ChecklistGroupTile({
    required this.group,
    super.key,
  });
  final ChecklistGroup group;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      visualDensity: VisualDensity.compact,
      title: Text(group.name, style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}

class ChecklistGroupedItemTile extends ConsumerWidget {
  const ChecklistGroupedItemTile({
    required this.listId,
    required this.item,
    required this.isLast,
    super.key,
  });
  final String listId;
  final ChecklistItem item;
  final bool isLast;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: DecoratedBox(
        decoration: const BoxDecoration(
          border: Border(
            left: BorderSide(),
            right: BorderSide(),
          ),
        ),
        child: ListTile(
          onTap: () => toggleItemCompleted(ref),
          visualDensity: VisualDensity.compact,
          title: Text(
            item.name,
            style: item.completed ? const TextStyle(decoration: TextDecoration.lineThrough) : null,
          ),
          trailing: Checkbox(
            value: item.completed,
            onChanged: (_) => toggleItemCompleted(ref),
          ),
        ),
      ),
    );
  }

  void toggleItemCompleted(WidgetRef ref) {
    ref.read(checklistEntryRepoProvider(listId).notifier).toggleItem(item);
  }
}
