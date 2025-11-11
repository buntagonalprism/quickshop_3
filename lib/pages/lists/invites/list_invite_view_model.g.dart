// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_invite_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(listInviteState)
const listInviteStateProvider = ListInviteStateFamily._();

final class ListInviteStateProvider extends $FunctionalProvider<
    ListInviteViewModel,
    ListInviteViewModel,
    ListInviteViewModel> with $Provider<ListInviteViewModel> {
  const ListInviteStateProvider._(
      {required ListInviteStateFamily super.from,
      required String super.argument})
      : super(
          retry: null,
          name: r'listInviteStateProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$listInviteStateHash();

  @override
  String toString() {
    return r'listInviteStateProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<ListInviteViewModel> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ListInviteViewModel create(Ref ref) {
    final argument = this.argument as String;
    return listInviteState(
      ref,
      argument,
    );
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ListInviteViewModel value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ListInviteViewModel>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ListInviteStateProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$listInviteStateHash() => r'99ee351aca09378cd13a828f96d5e830c80a672e';

final class ListInviteStateFamily extends $Family
    with $FunctionalFamilyOverride<ListInviteViewModel, String> {
  const ListInviteStateFamily._()
      : super(
          retry: null,
          name: r'listInviteStateProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  ListInviteStateProvider call(
    String inviteId,
  ) =>
      ListInviteStateProvider._(argument: inviteId, from: this);

  @override
  String toString() => r'listInviteStateProvider';
}
