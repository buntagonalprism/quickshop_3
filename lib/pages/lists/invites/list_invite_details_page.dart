import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_plus/share_plus.dart';

import '../../../application/lists_notifier.dart';
import '../../../models/list_invite.dart';
import '../../../models/list_summary.dart';
import '../../../router.dart';
import '../../../services/http_result.dart';
import '../../../widgets/button_progress_indicator.dart';
import '../../../widgets/http_error_dialog.dart';
import 'list_invite_view_model.dart';

class ListInviteDetailsPage extends ConsumerWidget {
  const ListInviteDetailsPage({super.key, required this.inviteId});
  final String inviteId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(listInviteStateProvider(inviteId));
    return Scaffold(
      appBar: AppBar(
        title: const Text('List invitation'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: state.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: () => const Center(
            child: Text(
              'Invitation could not be loaded. Please check your network connection.',
              textAlign: TextAlign.center,
            ),
          ),
          notFound: () => const Center(child: Text('Invitation not found. It may have been deleted.')),
          isOwner: (invite) => _IsOwnerView(invite: invite),
          pending: (invite) => _PendingInvitationView(invite: invite),
          accepted: (invite) => _InvitationAcceptedView(invite: invite),
        ),
      ),
    );
  }
}

class _InvitationAcceptedView extends ConsumerWidget {
  const _InvitationAcceptedView({required this.invite});
  final ListInvite invite;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        children: [
          Text.rich(
            TextSpan(
              text: 'Invitation accepted for ${invite.listType.displayName} ',
              children: [
                TextSpan(
                  text: invite.listName,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              switch (invite.listType) {
                case ListType.shoppingList:
                  ref.read(routerProvider).replace(Routes.shoppingListDetail(invite.listId).path);
                  break;
                case ListType.checklist:
                  ref.read(routerProvider).replace(Routes.checklistDetail(invite.listId).path);
                  break;
              }
            },
            child: const Text('Open list'),
          ),
        ],
      ),
    );
  }
}

class _IsOwnerView extends StatelessWidget {
  const _IsOwnerView({required this.invite});
  final ListInvite invite;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text.rich(
            TextSpan(
              text: 'This is your personal invite link for sharing the ${invite.listType.displayName} ',
              children: <TextSpan>[
                TextSpan(
                  text: invite.listName,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          SelectableText(
            invite.url,
            textAlign: TextAlign.center,
            style: const TextStyle(decoration: TextDecoration.underline),
          ),
          const SizedBox(height: 24),
          OutlinedButton(
            onPressed: () => _shareLink(invite),
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
    );
  }

  void _shareLink(ListInvite invite) {
    SharePlus.instance.share(ShareParams(
      text: "I'd like to share this Quickshop shopping list with you: ${invite.url}",
    ));
  }
}

class _PendingInvitationView extends ConsumerStatefulWidget {
  const _PendingInvitationView({required this.invite});
  final ListInvite invite;

  @override
  ConsumerState<_PendingInvitationView> createState() => _PendingInvitationViewState();
}

class _PendingInvitationViewState extends ConsumerState<_PendingInvitationView> {
  bool _acceptInProgress = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text.rich(
            TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: widget.invite.inviterName,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: ' has invited you to share their ${widget.invite.listType.displayName} ',
                ),
                TextSpan(
                  text: widget.invite.listName,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    ref.read(routerProvider).pop();
                  },
                  child: const Text('Ignore'),
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: ElevatedButton(
                  onPressed: _acceptInProgress ? null : _acceptListInvitation,
                  child: _acceptInProgress ? const ButtonProgressIndicator() : const Text('Accept'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _acceptListInvitation() async {
    setState(() => _acceptInProgress = true);
    final result = await ref.read(listsProvider.notifier).acceptListInvite(widget.invite);
    if (mounted) {
      if (result is HttpResultError) {
        final error = result.error;
        showHttpErrorDialog(context, error);
      }
    }
    setState(() => _acceptInProgress = false);
  }
}
