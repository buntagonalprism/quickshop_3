import 'package:flutter/material.dart';

class ConfirmationDialogContent {
  final String title;
  final String message;
  final String confirmationAction;
  final String cancelButton;

  const ConfirmationDialogContent({
    required this.title,
    required this.message,
    required this.confirmationAction,
    this.cancelButton = 'Cancel',
  });
}

class ConfirmationDialog extends StatelessWidget {
  final ConfirmationDialogContent content;

  const ConfirmationDialog._(this.content);

  static Future<bool> show(BuildContext context, ConfirmationDialogContent content) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => ConfirmationDialog._(content),
    );
    return result ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(content.title),
      content: Text(content.message),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(false);
          },
          child: Text(content.cancelButton),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(true);
          },
          child: Text(content.confirmationAction),
        ),
      ],
    );
  }
}
