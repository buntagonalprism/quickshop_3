// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checklist_entry_repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(checklistEntryRepo)
const checklistEntryRepoProvider = ChecklistEntryRepoFamily._();

final class ChecklistEntryRepoProvider extends $FunctionalProvider<
    ChecklistEntryRepo,
    ChecklistEntryRepo,
    ChecklistEntryRepo> with $Provider<ChecklistEntryRepo> {
  const ChecklistEntryRepoProvider._(
      {required ChecklistEntryRepoFamily super.from,
      required String super.argument})
      : super(
          retry: null,
          name: r'checklistEntryRepoProvider',
          isAutoDispose: false,
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
  $ProviderElement<ChecklistEntryRepo> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ChecklistEntryRepo create(Ref ref) {
    final argument = this.argument as String;
    return checklistEntryRepo(
      ref,
      argument,
    );
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ChecklistEntryRepo value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ChecklistEntryRepo>(value),
    );
  }

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
    r'259e9726985c28679a07cf19818d10a2b486f272';

final class ChecklistEntryRepoFamily extends $Family
    with $FunctionalFamilyOverride<ChecklistEntryRepo, String> {
  const ChecklistEntryRepoFamily._()
      : super(
          retry: null,
          name: r'checklistEntryRepoProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: false,
        );

  ChecklistEntryRepoProvider call(
    String listId,
  ) =>
      ChecklistEntryRepoProvider._(argument: listId, from: this);

  @override
  String toString() => r'checklistEntryRepoProvider';
}
