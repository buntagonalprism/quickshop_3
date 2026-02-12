// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lists_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ListsNotifier)
const listsProvider = ListsNotifierProvider._();

final class ListsNotifierProvider
    extends $StreamNotifierProvider<ListsNotifier, List<ListSummary>> {
  const ListsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'listsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$listsNotifierHash();

  @$internal
  @override
  ListsNotifier create() => ListsNotifier();
}

String _$listsNotifierHash() => r'fbd492e9b269591c73ec2142aba450d171dff941';

abstract class _$ListsNotifier extends $StreamNotifier<List<ListSummary>> {
  Stream<List<ListSummary>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<List<ListSummary>>, List<ListSummary>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<ListSummary>>, List<ListSummary>>,
              AsyncValue<List<ListSummary>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
