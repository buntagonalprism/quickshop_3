import 'package:flutter/material.dart';

import '../services/http_result.dart';

void showHttpErrorDialog(BuildContext context, HttpError error) {
  showDialog(
    context: context,
    builder: (context) {
      return HttpErrorDialog(error: error);
    },
  );
}

class HttpErrorDialog extends StatelessWidget {
  const HttpErrorDialog({required this.error, super.key});
  final HttpError error;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(error.title),
      content: Text(error.message),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Ok'),
        ),
      ],
    );
  }
}

extension HttpErrorMessages on HttpError {
  String get title => _errorTitle(this);
  String get message => _errorMessage(this);
}

String _errorTitle(HttpError error) {
  return error.when(
    timeout: () => 'Request timed out',
    connectionFailed: (_) => 'Connection failed',
    retryLater: (_, __) => 'Server unavailable',
    unknownError: (_, __) => 'Request failed',
  );
}

String _errorMessage(HttpError error) {
  return error.when(
    timeout: () =>
        'The request did not complete in the expected time. Please check your network connection and try again.',
    connectionFailed: (_) => 'Please check your network connection and try again.',
    retryLater: (_, __) =>
        'The server cannot currently handle the request at this time. Please try again later.',
    unknownError: (_, __) => 'An unexpected error occured and the request could not be completed.',
  );
}
