import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/http_result.dart';
import 'http_error_dialog.dart';

class HttpRequestConfirmationDialog extends ConsumerStatefulWidget {
  final String confirmationTitle;
  final String confirmationMessage;
  final String confirmationAction;
  final String cancelAction;
  final String requestInProgressMessage;
  final Future<HttpResult> Function() onConfirm;
  final void Function(HttpResultSuccess) onSuccess;

  const HttpRequestConfirmationDialog({
    super.key,
    required this.confirmationTitle,
    required this.confirmationMessage,
    required this.confirmationAction,
    this.cancelAction = 'Cancel',
    required this.requestInProgressMessage,
    required this.onConfirm,
    required this.onSuccess,
  });

  @override
  ConsumerState<HttpRequestConfirmationDialog> createState() => _LeaveListConfirmationDialogState();
}

class _LeaveListConfirmationDialogState extends ConsumerState<HttpRequestConfirmationDialog> {
  bool hasConfirmed = false;
  HttpError? error;

  @override
  Widget build(BuildContext context) {
    if (error != null) {
      return HttpErrorDialog(error: error!);
    }
    if (!hasConfirmed) {
      return AlertDialog(
        title: Text(widget.confirmationTitle),
        content: Text(widget.confirmationMessage),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(widget.cancelAction),
          ),
          TextButton(onPressed: onConfirm, child: Text(widget.confirmationAction)),
        ],
      );
    }
    return AlertDialog(
      title: Row(
        children: [
          const SizedBox(height: 20, width: 20, child: CircularProgressIndicator()),
          const SizedBox(width: 16),
          Expanded(child: Text(widget.requestInProgressMessage, style: Theme.of(context).textTheme.bodyLarge)),
        ],
      ),
    );
  }

  void onConfirm() async {
    setState(() {
      hasConfirmed = true;
    });
    final result = await widget.onConfirm();

    result.when(
      success: (_, _, _) {
        widget.onSuccess(result as HttpResultSuccess);
      },
      error: (_, e) {
        setState(() {
          error = e;
        });
      },
    );
  }
}
