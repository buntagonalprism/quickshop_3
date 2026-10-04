// GENERATED CODE - DO NOT MODIFY BY HAND

// coverage:ignore-file
// dart format off

part of 'checklist_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// The checklist with [listId] and its entries, or null if there is no such checklist.

@ProviderFor(checklist)
final checklistProvider = ChecklistFamily._();

/// The checklist with [listId] and its entries, or null if there is no such checklist.

final class ChecklistProvider
    extends
        $FunctionalProvider<
          AsyncValue<Checklist?>,
          AsyncValue<Checklist?>,
          AsyncValue<Checklist?>
        >
    with $Provider<AsyncValue<Checklist?>> {
  /// The checklist with [listId] and its entries, or null if there is no such checklist.
  ChecklistProvider._({
    required ChecklistFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'checklistProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$checklistHash();

  @override
  String toString() {
    return r'checklistProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<AsyncValue<Checklist?>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AsyncValue<Checklist?> create(Ref ref) {
    final argument = this.argument as String;
    return checklist(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<Checklist?> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<Checklist?>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ChecklistProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$checklistHash() => r'3a9e5d868d03afa0258b60c67b90df341bfb22e9';

/// The checklist with [listId] and its entries, or null if there is no such checklist.

final class ChecklistFamily extends $Family
    with $FunctionalFamilyOverride<AsyncValue<Checklist?>, String> {
  ChecklistFamily._()
    : super(
        retry: null,
        name: r'checklistProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// The checklist with [listId] and its entries, or null if there is no such checklist.

  ChecklistProvider call(String listId) =>
      ChecklistProvider._(argument: listId, from: this);

  @override
  String toString() => r'checklistProvider';
}
