import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_plus/share_plus.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../analytics/crash_reporter.dart';
import '../../models/list_invite.dart';
import '../../models/list_summary.dart';
import '../../models/user.dart';
import '../../repositories/list_repo.dart';
import '../../repositories/list_sharing_repo.dart';

class ListSharingPage extends ConsumerStatefulWidget {
  const ListSharingPage({super.key, required this.listId});
  final String listId;

  @override
  ConsumerState<ListSharingPage> createState() => _ListSharingPageState();
}

class _ListSharingPageState extends ConsumerState<ListSharingPage> {
  bool linkCreationInProgress = false;

  @override
  Widget build(BuildContext context) {
    final list = ref.watch(listProvider(widget.listId));
    return Scaffold(
      appBar: AppBar(
        title: Text('Share ${list.valueOrNull?.name ?? ''}'),
      ),
      body: list.when(
        error: (error, trace) {
          ref.read(crashReporterProvider).report(error, trace);
          return const Center(child: Text('Failed to load list'));
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        data: (list) {
          if (list == null) {
            return Center(child: Text('List ${widget.listId} not found'));
          }

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 20),
                  SharingLinkTile(list: list),
                  const SizedBox(height: 24),
                  Text(
                    'List users',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  ...list.editors.map(
                    (user) => ListUserTile(user: user, isOwner: user.id == list.ownerId),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ListUserTile extends StatelessWidget {
  const ListUserTile({required this.user, required this.isOwner, super.key});
  final User user;
  final bool isOwner;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(user.name.isEmpty ? user.email : user.name),
      subtitle: Text(isOwner ? 'List owner' : ''),
      leading: const Icon(Icons.person),
    );
  }
}

class SharingLinkTile extends ConsumerStatefulWidget {
  const SharingLinkTile({required this.list, super.key});
  final ListSummary list;

  @override
  ConsumerState<SharingLinkTile> createState() => _SharingLinkTileState();
}

class _SharingLinkTileState extends ConsumerState<SharingLinkTile> {
  bool linkCreationInProgress = false;
  bool linkDeletionInProgress = false;

  @override
  Widget build(BuildContext context) {
    final invite = ref.watch(listSharingRepoProvider(widget.list.id));
    return Skeletonizer.zone(
      enabled: !invite.hasValue,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Checkbox(
                    value: _checkboxValue(invite),
                    onChanged: (value) {
                      // Ignore changes while link is being created or deleted
                      if (linkCreationInProgress || linkDeletionInProgress) {
                        return;
                      }
                      if (value!) {
                        _createSharingLink();
                      } else {
                        _deleteSharingLink(invite);
                      }
                    }),
                const Text(
                  'Enable my sharing link',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Container(
              height: MediaQuery.textScalerOf(context).scale(64),
              alignment: Alignment.center,
              child: _linkDisplay(invite),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: invite.valueOrNull != null
                        ? () => _copyToClipboard(context, invite.requireValue!.url)
                        : null,
                    child: const Row(
                      children: [
                        Icon(Icons.copy),
                        SizedBox(width: 12),
                        Text('Copy'),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: OutlinedButton(
                    onPressed:
                        invite.valueOrNull != null ? () => _shareLink(invite.requireValue!) : null,
                    child: const Row(
                      children: [
                        Icon(Icons.share),
                        SizedBox(width: 12),
                        Text('Share'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  bool _checkboxValue(AsyncValue<ListInvite?> invite) {
    // While link is being created, the checkbox should be checked
    if (linkCreationInProgress) {
      return true;
    }
    // While link is being deleted, the checkbox should be unchecked
    if (linkDeletionInProgress) {
      return false;
    }
    // While the invite is loading, the checkbox should be unchecked
    if (!invite.hasValue) {
      return false;
    }
    // If the invite exists, the checkbox should be checked
    return invite.requireValue != null;
  }

  Widget _linkDisplay(AsyncValue<ListInvite?> invite) {
    if (linkCreationInProgress) {
      return const SizedBox(
        height: 16,
        width: 16,
        child: CircularProgressIndicator(),
      );
    }
    // Display skeleton state while invite is loading
    if (!invite.hasValue) {
      return const Padding(
        padding: EdgeInsets.only(top: 4),
        child: Bone.multiText(
          lines: 2,
          textAlign: TextAlign.center,
        ),
      );
    }
    final inviteValue = invite.requireValue;
    if (inviteValue != null) {
      return SelectableText(
        inviteValue.url,
        textAlign: TextAlign.center,
        style: const TextStyle(decoration: TextDecoration.underline),
      );
    } else {
      return const Text(
        'Enable the sharing link to share this list with others',
        style: TextStyle(
          fontStyle: FontStyle.italic,
          fontSize: 12,
          color: Colors.grey,
        ),
      );
    }
  }

  void _createSharingLink() async {
    setState(() => linkCreationInProgress = true);
    try {
      await ref
          .read(listSharingRepoProvider(widget.list.id).notifier)
          .createSharingLinkForList(widget.list);
    } catch (e, stackTrace) {
      ref.read(crashReporterProvider).report(e, stackTrace);
    } finally {
      setState(() => linkCreationInProgress = false);
    }
  }

  void _deleteSharingLink(AsyncValue<ListInvite?> invite) {
    final inviteValue = invite.valueOrNull;
    if (inviteValue == null) {
      return;
    }
    setState(() => linkDeletionInProgress = true);
    try {
      ref.read(listSharingRepoProvider(widget.list.id).notifier).deleteSharingLink(inviteValue);
    } catch (e, stackTrace) {
      ref.read(crashReporterProvider).report(e, stackTrace);
    } finally {
      setState(() => linkDeletionInProgress = false);
    }
  }

  void _copyToClipboard(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text));
  }

  void _shareLink(ListInvite invite) {
    Share.share("I'd like to share this Quickshop shopping list with you: ${invite.url}");
  }
}
