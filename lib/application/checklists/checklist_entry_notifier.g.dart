// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checklist_entry_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ChecklistEntryNotifier)
const checklistEntryProvider = ChecklistEntryNotifierFamily._();

final class ChecklistEntryNotifierProvider extends $StreamNotifierProvider<
    ChecklistEntryNotifier, List<ChecklistEntry>> {
  const ChecklistEntryNotifierProvider._(
      {required ChecklistEntryNotifierFamily super.from,
      required String super.argument})
      : super(
          retry: null,
          name: r'checklistEntryProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$checklistEntryNotifierHash();

  @override
  String toString() {
    return r'checklistEntryProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ChecklistEntryNotifier create() => ChecklistEntryNotifier();

  @override
  bool operator ==(Object other) {
    return other is ChecklistEntryNotifierProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$checklistEntryNotifierHash() =>
    r'5a414fc9584097262a7f8ed1a75d88edf8af3689';

final class ChecklistEntryNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
            ChecklistEntryNotifier,
            AsyncValue<List<ChecklistEntry>>,
            List<ChecklistEntry>,
            Stream<List<ChecklistEntry>>,
            String> {
  const ChecklistEntryNotifierFamily._()
      : super(
          retry: null,
          name: r'checklistEntryProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  ChecklistEntryNotifierProvider call(
    String listId,
  ) =>
      ChecklistEntryNotifierProvider._(argument: listId, from: this);

  @override
  String toString() => r'checklistEntryProvider';
}

abstract class _$ChecklistEntryNotifier
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
