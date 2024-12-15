import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../analytics/crash_reporter.dart';
import '../../models/list_summary.dart';
import '../../repositories/list_repo.dart';
import '../../repositories/user_repo.dart';
import '../../router.dart';
import '../home/profile_icon.dart';

class ListsPage extends ConsumerWidget {
  const ListsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My lists'),
        leading: const ProfileIcon(),
      ),
      body: Builder(builder: (context) {
        final listsValue = ref.watch(listRepoProvider);
        if (listsValue.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (listsValue.hasError) {
          ref.read(crashReporterProvider).reportAsyncError(listsValue);
          return const Center(
            child: Text('Failed to load lists'),
          );
        }
        final lists = listsValue.requireValue;
        return ListView.builder(
          itemCount: lists.length,
          itemBuilder: (context, index) {
            final listSummary = lists[index];
            return ListSummaryTile(listSummary: listSummary);
          },
        );
      }),
      floatingActionButton: Consumer(builder: (context, ref, _) {
        return FloatingActionButton.extended(
          label: const Text('New list'),
          icon: const Icon(Icons.list),
          onPressed: () => ref.read(routerProvider).push(Routes.newList),
        );
      }),
    );
  }
}

class ListSummaryTile extends ConsumerWidget {
  const ListSummaryTile({required this.listSummary, super.key});
  final ListSummary listSummary;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Theme.of(context).dividerColor),
        ),
        child: ListTile(
          leading: const Icon(Icons.shopping_cart),
          title: Row(
            children: [
              Expanded(child: Text(listSummary.name)),
              const SizedBox(width: 8),
              Text(formatLastModified(ref), style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
          onTap: () => ref.read(routerProvider).push(Routes.listDetail(listSummary.id)),
          subtitle: Row(
            children: [
              Text('${listSummary.itemCount} item${listSummary.itemCount == 1 ? '' : 's'}'),
              const Spacer(),
              if (listSummary.editors.length > 1) const Icon(Icons.people, size: 16),
            ],
          ),
        ),
      ),
    );
  }

  String formatLastModified(WidgetRef ref) {
    final user = ref.watch(userRepoProvider);
    final lastModifiedMs = listSummary.lastModified[user?.id];
    if (lastModifiedMs == null) {
      return '';
    }
    final modified = DateTime.fromMillisecondsSinceEpoch(lastModifiedMs);
    if (isToday(modified)) {
      return DateFormat.jm().format(modified);
    }
    return DateFormat('d MMM').format(modified);
  }

  bool isToday(DateTime time) {
    final now = DateTime.now();
    return now.day == time.day && now.month == time.month && now.year == time.year;
  }
}
