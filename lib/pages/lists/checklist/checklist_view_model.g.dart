// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checklist_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(checklistViewModel)
const checklistViewModelProvider = ChecklistViewModelFamily._();

final class ChecklistViewModelProvider extends $FunctionalProvider<
    ChecklistViewModel,
    ChecklistViewModel,
    ChecklistViewModel> with $Provider<ChecklistViewModel> {
  const ChecklistViewModelProvider._(
      {required ChecklistViewModelFamily super.from,
      required String super.argument})
      : super(
          retry: null,
          name: r'checklistViewModelProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$checklistViewModelHash();

  @override
  String toString() {
    return r'checklistViewModelProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<ChecklistViewModel> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ChecklistViewModel create(Ref ref) {
    final argument = this.argument as String;
    return checklistViewModel(
      ref,
      argument,
    );
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ChecklistViewModel value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ChecklistViewModel>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ChecklistViewModelProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$checklistViewModelHash() =>
    r'9d3dd0fd13257e4422d8560aa17b6827569211fa';

final class ChecklistViewModelFamily extends $Family
    with $FunctionalFamilyOverride<ChecklistViewModel, String> {
  const ChecklistViewModelFamily._()
      : super(
          retry: null,
          name: r'checklistViewModelProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  ChecklistViewModelProvider call(
    String listId,
  ) =>
      ChecklistViewModelProvider._(argument: listId, from: this);

  @override
  String toString() => r'checklistViewModelProvider';
}
