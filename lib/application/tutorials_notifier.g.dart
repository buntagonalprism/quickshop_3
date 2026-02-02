// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tutorials_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TutorialsNotifier)
const tutorialsProvider = TutorialsNotifierProvider._();

final class TutorialsNotifierProvider
    extends $NotifierProvider<TutorialsNotifier, Set<Tutorial>> {
  const TutorialsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tutorialsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tutorialsNotifierHash();

  @$internal
  @override
  TutorialsNotifier create() => TutorialsNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Set<Tutorial> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Set<Tutorial>>(value),
    );
  }
}

String _$tutorialsNotifierHash() => r'5280459e0e22c8c4bf82d5b5d9fc1a46f7039b43';

abstract class _$TutorialsNotifier extends $Notifier<Set<Tutorial>> {
  Set<Tutorial> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<Set<Tutorial>, Set<Tutorial>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Set<Tutorial>, Set<Tutorial>>,
              Set<Tutorial>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
