// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_invite_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Load a list invite by its id.
///
/// Will return null if the invite does not exist.

@ProviderFor(listInviteById)
const listInviteByIdProvider = ListInviteByIdFamily._();

/// Load a list invite by its id.
///
/// Will return null if the invite does not exist.

final class ListInviteByIdProvider
    extends
        $FunctionalProvider<
          AsyncValue<ListInvite?>,
          ListInvite?,
          Stream<ListInvite?>
        >
    with $FutureModifier<ListInvite?>, $StreamProvider<ListInvite?> {
  /// Load a list invite by its id.
  ///
  /// Will return null if the invite does not exist.
  const ListInviteByIdProvider._({
    required ListInviteByIdFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'listInviteByIdProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$listInviteByIdHash();

  @override
  String toString() {
    return r'listInviteByIdProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<ListInvite?> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<ListInvite?> create(Ref ref) {
    final argument = this.argument as String;
    return listInviteById(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ListInviteByIdProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$listInviteByIdHash() => r'c2abf08b6388e864c7d6a153a44981095218306c';

/// Load a list invite by its id.
///
/// Will return null if the invite does not exist.

final class ListInviteByIdFamily extends $Family
    with $FunctionalFamilyOverride<Stream<ListInvite?>, String> {
  const ListInviteByIdFamily._()
    : super(
        retry: null,
        name: r'listInviteByIdProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Load a list invite by its id.
  ///
  /// Will return null if the invite does not exist.

  ListInviteByIdProvider call(String inviteId) =>
      ListInviteByIdProvider._(argument: inviteId, from: this);

  @override
  String toString() => r'listInviteByIdProvider';
}

/// Load the currently authenticated user's personal list invite for sharing a given list.
///
/// Will return null if the user has not created a sharing link for the list.

@ProviderFor(userListInviteByListId)
const userListInviteByListIdProvider = UserListInviteByListIdFamily._();

/// Load the currently authenticated user's personal list invite for sharing a given list.
///
/// Will return null if the user has not created a sharing link for the list.

final class UserListInviteByListIdProvider
    extends
        $FunctionalProvider<
          AsyncValue<ListInvite?>,
          ListInvite?,
          Stream<ListInvite?>
        >
    with $FutureModifier<ListInvite?>, $StreamProvider<ListInvite?> {
  /// Load the currently authenticated user's personal list invite for sharing a given list.
  ///
  /// Will return null if the user has not created a sharing link for the list.
  const UserListInviteByListIdProvider._({
    required UserListInviteByListIdFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'userListInviteByListIdProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$userListInviteByListIdHash();

  @override
  String toString() {
    return r'userListInviteByListIdProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<ListInvite?> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<ListInvite?> create(Ref ref) {
    final argument = this.argument as String;
    return userListInviteByListId(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is UserListInviteByListIdProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$userListInviteByListIdHash() =>
    r'adeef75ec7b7b1da00af40761b1e3105a75b314a';

/// Load the currently authenticated user's personal list invite for sharing a given list.
///
/// Will return null if the user has not created a sharing link for the list.

final class UserListInviteByListIdFamily extends $Family
    with $FunctionalFamilyOverride<Stream<ListInvite?>, String> {
  const UserListInviteByListIdFamily._()
    : super(
        retry: null,
        name: r'userListInviteByListIdProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Load the currently authenticated user's personal list invite for sharing a given list.
  ///
  /// Will return null if the user has not created a sharing link for the list.

  UserListInviteByListIdProvider call(String listId) =>
      UserListInviteByListIdProvider._(argument: listId, from: this);

  @override
  String toString() => r'userListInviteByListIdProvider';
}
