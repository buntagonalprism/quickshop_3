// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_leave_in_progress_store.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$listLeaveInProgressStoreHash() =>
    r'6b391de0d2d5c076e16644d99f4cb4abe0275654';

/// A repository that stores the list IDs of lists that are in progress of being left. This allows
/// other repositories to unsubscribe from Firestore before the list is actually left, avoiding
/// the permission-denied error that would otherwise occur once the user no longer has permission
/// to read the list.
///
/// Copied from [ListLeaveInProgressStore].
@ProviderFor(ListLeaveInProgressStore)
final listLeaveInProgressStoreProvider =
    AutoDisposeNotifierProvider<ListLeaveInProgressStore, Set<ListId>>.internal(
  ListLeaveInProgressStore.new,
  name: r'listLeaveInProgressStoreProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$listLeaveInProgressStoreHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ListLeaveInProgressStore = AutoDisposeNotifier<Set<ListId>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
