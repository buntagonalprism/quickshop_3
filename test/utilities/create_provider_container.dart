import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod/riverpod.dart';

/// A testing utility which creates a [ProviderContainer] and automatically
/// disposes it at the end of the test.
ProviderContainer createContainer({
  ProviderContainer? parent,
  List<Override> overrides = const [],
  List<ProviderObserver>? observers,
}) {
  // Create a ProviderContainer, and optionally allow specifying parameters.
  final container = ProviderContainer(
    parent: parent,
    overrides: overrides,
    observers: observers,
  );

  // When the test ends, dispose the container.
  addTearDown(container.dispose);

  return container;
}

extension TestListenExtension on ProviderContainer {
  /// A slightly nicer syntax for listening to a provider in unit tests, where we don't want to
  /// supply a listener function but simply want to keep the provider alive during the test.
  ProviderSubscription<T> testListen<T>(ProviderListenable<T> provider) {
    return listen(provider, (_, __) {});
  }
}
