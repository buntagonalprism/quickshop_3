import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../../analytics/crash_reporter.dart';
import '../../data/lists/application/lists_notifier.dart';
import '../../data/lists/models/list_summary.dart';
import '../../router.dart';
import '../../services/auth_service.dart';
import '../../widgets/center_scrollable_column.dart';
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
      body: Builder(
        builder: (context) {
          final listsValue = ref.watch(listsProvider);
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
          if (lists.isEmpty) {
            return const ListsEmptyView();
          }
          return ListView.builder(
            itemCount: lists.length + 1,
            itemBuilder: (context, index) {
              // Add a spacer at the bottom so that we can overscroll the list, preventing the FAB
              // from covering the last list item
              if (index == lists.length) {
                return const SizedBox(height: 80);
              }
              final listSummary = lists[index];
              return ListSummaryTile(listSummary: listSummary);
            },
          );
        },
      ),
      floatingActionButton: Consumer(
        builder: (context, ref, _) {
          return FloatingActionButton.extended(
            label: const Text('New list'),
            icon: SvgPicture.asset('assets/images/new_list_icon.svg', height: 20, width: 20),
            onPressed: () => ref.read(routerProvider).push(Routes.newList.path),
          );
        },
      ),
    );
  }
}

class ListsEmptyView extends StatelessWidget {
  const ListsEmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: CenterScrollableColumn(
        children: [
          SvgPicture.asset('assets/images/lists_tab_icon.svg', height: 150, width: 120),
          const SizedBox(height: 16),
          Text(
            'Here you will find your QuickShop shopping lists and checklists',
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            'You can create as many lists as you like, and you can share them with friends and family',
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text.rich(
            TextSpan(
              text: 'Use the ',
              children: [
                WidgetSpan(
                  child: SvgPicture.asset('assets/images/new_list_icon.svg', height: 20, width: 20),
                ),
                const TextSpan(text: ' button below to get started'),
              ],
            ),
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
        ],
      ),
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
          leading: ListSummaryIcon(listSummary: listSummary),
          title: Row(
            children: [
              Expanded(child: Text(listSummary.name)),
              const SizedBox(width: 8),
              Text(formatLastModified(ref), style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
          onTap: () {
            switch (listSummary.listType) {
              case ListType.shoppingList:
                ref.read(routerProvider).push(Routes.shoppingListDetail(listSummary.id).path);
                break;
              case ListType.checklist:
                ref.read(routerProvider).push(Routes.checklistDetail(listSummary.id).path);
                break;
            }
          },
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
    final user = ref.watch(userAuthProvider);
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

class ListSummaryIcon extends StatelessWidget {
  const ListSummaryIcon({
    required this.listSummary,
    super.key,
  });
  final ListSummary listSummary;

  @override
  Widget build(BuildContext context) {
    return switch (listSummary.listType) {
      ListType.shoppingList => Image.asset(
        'assets/logo/logo_grey_small.png',
        height: 26,
        width: 26,
        color: Theme.of(context).iconTheme.color,
      ),
      ListType.checklist => const Padding(
        padding: EdgeInsets.all(1),
        child: Icon(Icons.check_box_outlined, size: 24),
      ),
    };
  }
}
