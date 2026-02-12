// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_leave_in_progress_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// A repository that stores the list IDs of lists that are in progress of being left. This allows
/// other repositories to unsubscribe from Firestore before the list is actually left, avoiding
/// the permission-denied error that would otherwise occur once the user no longer has permission
/// to read the list.

@ProviderFor(ListLeaveInProgressNotifier)
const listLeaveInProgressProvider = ListLeaveInProgressNotifierProvider._();

/// A repository that stores the list IDs of lists that are in progress of being left. This allows
/// other repositories to unsubscribe from Firestore before the list is actually left, avoiding
/// the permission-denied error that would otherwise occur once the user no longer has permission
/// to read the list.
final class ListLeaveInProgressNotifierProvider
    extends $NotifierProvider<ListLeaveInProgressNotifier, Set<ListId>> {
  /// A repository that stores the list IDs of lists that are in progress of being left. This allows
  /// other repositories to unsubscribe from Firestore before the list is actually left, avoiding
  /// the permission-denied error that would otherwise occur once the user no longer has permission
  /// to read the list.
  const ListLeaveInProgressNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'listLeaveInProgressProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$listLeaveInProgressNotifierHash();

  @$internal
  @override
  ListLeaveInProgressNotifier create() => ListLeaveInProgressNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Set<ListId> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Set<ListId>>(value),
    );
  }
}

String _$listLeaveInProgressNotifierHash() =>
    r'cc87231e4a6a30bc7539e48992f709cd1e3624a4';

/// A repository that stores the list IDs of lists that are in progress of being left. This allows
/// other repositories to unsubscribe from Firestore before the list is actually left, avoiding
/// the permission-denied error that would otherwise occur once the user no longer has permission
/// to read the list.

abstract class _$ListLeaveInProgressNotifier extends $Notifier<Set<ListId>> {
  Set<ListId> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<Set<ListId>, Set<ListId>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Set<ListId>, Set<ListId>>,
              Set<ListId>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
