// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(list)
const listProvider = ListFamily._();

final class ListProvider
    extends
        $FunctionalProvider<
          AsyncValue<ListSummary?>,
          AsyncValue<ListSummary?>,
          AsyncValue<ListSummary?>
        >
    with $Provider<AsyncValue<ListSummary?>> {
  const ListProvider._({
    required ListFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'listProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$listHash();

  @override
  String toString() {
    return r'listProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<AsyncValue<ListSummary?>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AsyncValue<ListSummary?> create(Ref ref) {
    final argument = this.argument as String;
    return list(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<ListSummary?> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<ListSummary?>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ListProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$listHash() => r'ec8fc89a3c6fcba1b400f05cbc136b8ec4c74ec9';

final class ListFamily extends $Family
    with $FunctionalFamilyOverride<AsyncValue<ListSummary?>, String> {
  const ListFamily._()
    : super(
        retry: null,
        name: r'listProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ListProvider call(String listId) =>
      ListProvider._(argument: listId, from: this);

  @override
  String toString() => r'listProvider';
}
