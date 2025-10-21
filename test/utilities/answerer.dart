import 'dart:async';

import 'package:mocktail/mocktail.dart';

Answerer<T> answer<T>(Future<T> Function() fn) {
  return Answerer<T>(fn);
}

/// Helper class for answering (returning a value from) mocked methods with Mocktail.
///
/// The methods provided with this class save a dozen or so characters on each line
/// when setting up common responses, and also avoid the need to remember whether to use
/// [thenAnswer] or [thenReturn].
class Answerer<T> {
  final FutureOr<T> Function() _fn;
  Answerer(this._fn);

  void withValue(T value) {
    if (_fn is Future<T> Function()) {
      when(_fn).thenAnswer((_) => Future.value(value));
    } else {
      when(_fn).thenReturn(value);
    }
  }

  void withLoading() {
    if (_fn is Future<T> Function()) {
      when(_fn).thenAnswer((_) => Completer<T>().future);
    } else {
      throw UnsupportedError('Loading state is only supported for methods that return a future');
    }
  }

  void withError(Object error) {
    if (_fn is Future<T> Function()) {
      when(_fn).thenAnswer((_) => Future<T>.error(error));
    } else {
      when(_fn).thenThrow(error);
    }
  }

  void byInvocation(Future<T> Function(Invocation) fn) {
    when(_fn).thenAnswer(fn);
  }
}
