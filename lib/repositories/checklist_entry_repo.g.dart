// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checklist_entry_repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ChecklistEntryRepo)
const checklistEntryRepoProvider = ChecklistEntryRepoFamily._();

final class ChecklistEntryRepoProvider
    extends $StreamNotifierProvider<ChecklistEntryRepo, List<ChecklistEntry>> {
  const ChecklistEntryRepoProvider._(
      {required ChecklistEntryRepoFamily super.from,
      required String super.argument})
      : super(
          retry: null,
          name: r'checklistEntryRepoProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$checklistEntryRepoHash();

  @override
  String toString() {
    return r'checklistEntryRepoProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ChecklistEntryRepo create() => ChecklistEntryRepo();

  @override
  bool operator ==(Object other) {
    return other is ChecklistEntryRepoProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$checklistEntryRepoHash() =>
    r'8472dd5864e6b525fea508e5f64872233d5af7ea';

final class ChecklistEntryRepoFamily extends $Family
    with
        $ClassFamilyOverride<
            ChecklistEntryRepo,
            AsyncValue<List<ChecklistEntry>>,
            List<ChecklistEntry>,
            Stream<List<ChecklistEntry>>,
            String> {
  const ChecklistEntryRepoFamily._()
      : super(
          retry: null,
          name: r'checklistEntryRepoProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  ChecklistEntryRepoProvider call(
    String listId,
  ) =>
      ChecklistEntryRepoProvider._(argument: listId, from: this);

  @override
  String toString() => r'checklistEntryRepoProvider';
}

abstract class _$ChecklistEntryRepo
    extends $StreamNotifier<List<ChecklistEntry>> {
  late final _$args = ref.$arg as String;
  String get listId => _$args;

  Stream<List<ChecklistEntry>> build(
    String listId,
  );
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(
      _$args,
    );
    final ref = this.ref
        as $Ref<AsyncValue<List<ChecklistEntry>>, List<ChecklistEntry>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<List<ChecklistEntry>>, List<ChecklistEntry>>,
        AsyncValue<List<ChecklistEntry>>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
