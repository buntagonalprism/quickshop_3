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
    return Padding(
      padding: EdgeInsets.fromLTRB(8, 4, 8, group.items.isEmpty ? 4 : 0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border(
            left: const BorderSide(),
            right: const BorderSide(),
            top: const BorderSide(),
            bottom: group.items.isEmpty ? const BorderSide() : BorderSide.none,
          ),
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(4),
            topRight: const Radius.circular(4),
            bottomLeft: group.items.isEmpty ? const Radius.circular(4) : Radius.zero,
            bottomRight: group.items.isEmpty ? const Radius.circular(4) : Radius.zero,
          ),
        ),
        child: ListTile(
          visualDensity: VisualDensity.compact,
          title: Text(group.name, style: const TextStyle(fontWeight: FontWeight.bold)),
        ),
      ),
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
      padding: EdgeInsets.fromLTRB(8, 0, 8, isLast ? 4 : 0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border(
            left: const BorderSide(),
            right: const BorderSide(),
            bottom: isLast ? const BorderSide() : BorderSide.none,
          ),
          borderRadius: isLast
              ? const BorderRadius.only(
                  bottomLeft: Radius.circular(4),
                  bottomRight: Radius.circular(4),
                )
              : null,
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
