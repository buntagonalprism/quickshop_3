import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_plus/share_plus.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../analytics/crash_reporter.dart';
import '../../../data/lists/application/list_invite_providers.dart';
import '../../../data/lists/application/list_provider.dart';
import '../../../data/lists/models/list_invite.dart';
import '../../../data/lists/models/list_summary.dart';
import '../../../data/user/models/user_auth.dart';
import '../../../data/lists/repositories/list_invite_repo.dart';

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
        title: Text('Share ${list.value?.name ?? ''}'),
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
  final UserAuth user;
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
    final invite = ref.watch(userListInviteByListIdProvider(widget.list.id));
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
                  },
                ),
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
            OutlinedButton(
              onPressed: invite.value != null ? () => _shareLink(invite.requireValue!) : null,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.share),
                  SizedBox(width: 12),
                  Text('Share'),
                ],
              ),
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
      await ref.read(listInviteRepoProvider).createSharingLinkForList(widget.list);
    } catch (error, trace) {
      ref.read(crashReporterProvider).report(error, trace);
    } finally {
      setState(() => linkCreationInProgress = false);
    }
  }

  void _deleteSharingLink(AsyncValue<ListInvite?> invite) {
    final inviteValue = invite.value;
    if (inviteValue == null) {
      return;
    }
    setState(() => linkDeletionInProgress = true);
    try {
      ref.read(listInviteRepoProvider).deleteSharingLink(inviteValue);
    } catch (error, trace) {
      ref.read(crashReporterProvider).report(error, trace);
    } finally {
      setState(() => linkDeletionInProgress = false);
    }
  }

  /// Sending a HTTP URL via a Facebook message is broken on Android if the link is the only content
  /// in the message. A preview of the page is generated which does nothing when tapped. The
  /// workaround is to include the URL as part of a message. The non-clickable preview will still be
  /// generated, but the link within the message text is clickable.
  ///
  /// The [ListSharingPage] originally had a "Copy" button that would copy the link text to
  /// clipboard; this button was removed because of the chance that the user would paste the link
  /// into a Facebook message and trigger the issue. The "Share" button includes the following
  /// message to workaround the issue.
  void _shareLink(ListInvite invite) {
    SharePlus.instance.share(
      ShareParams(
        text: "I'd like to share this Quickshop shopping list with you: ${invite.url}",
      ),
    );
  }
}
