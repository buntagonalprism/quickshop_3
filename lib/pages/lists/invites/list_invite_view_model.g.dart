// GENERATED CODE - DO NOT MODIFY BY HAND

// coverage:ignore-file
// dart format off

part of 'list_invite_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// The status of the invite with [inviteId], or null if there is no such invite.

@ProviderFor(inviteStatus)
final inviteStatusProvider = InviteStatusFamily._();

/// The status of the invite with [inviteId], or null if there is no such invite.

final class InviteStatusProvider
    extends
        $FunctionalProvider<
          AsyncValue<InviteStatus?>,
          AsyncValue<InviteStatus?>,
          AsyncValue<InviteStatus?>
        >
    with $Provider<AsyncValue<InviteStatus?>> {
  /// The status of the invite with [inviteId], or null if there is no such invite.
  InviteStatusProvider._({
    required InviteStatusFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'inviteStatusProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$inviteStatusHash();

  @override
  String toString() {
    return r'inviteStatusProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<AsyncValue<InviteStatus?>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AsyncValue<InviteStatus?> create(Ref ref) {
    final argument = this.argument as String;
    return inviteStatus(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<InviteStatus?> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<InviteStatus?>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is InviteStatusProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$inviteStatusHash() => r'6ef9ef354eef921153f240cbff17bd5bb7731f32';

/// The status of the invite with [inviteId], or null if there is no such invite.

final class InviteStatusFamily extends $Family
    with $FunctionalFamilyOverride<AsyncValue<InviteStatus?>, String> {
  InviteStatusFamily._()
    : super(
        retry: null,
        name: r'inviteStatusProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// The status of the invite with [inviteId], or null if there is no such invite.

  InviteStatusProvider call(String inviteId) =>
      InviteStatusProvider._(argument: inviteId, from: this);

  @override
  String toString() => r'inviteStatusProvider';
}
