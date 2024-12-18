// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_leave_in_progress_repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$listLeaveInProgressRepoHash() =>
    r'a428c64bb1d65513f63d275169ef9766c65c8c34';

/// A repository that stores the list IDs of lists that are in progress of being left. This allows
/// other repositories to unsubscribe from Firestore before the list is actually left, avoiding
/// the permission-denied error that would otherwise occur once the user no longer has permission
/// to read the list.
///
/// Copied from [ListLeaveInProgressRepo].
@ProviderFor(ListLeaveInProgressRepo)
final listLeaveInProgressRepoProvider =
    AutoDisposeNotifierProvider<ListLeaveInProgressRepo, Set<ListId>>.internal(
  ListLeaveInProgressRepo.new,
  name: r'listLeaveInProgressRepoProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$listLeaveInProgressRepoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ListLeaveInProgressRepo = AutoDisposeNotifier<Set<ListId>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
