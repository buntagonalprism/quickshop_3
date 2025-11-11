// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delay_provider_dispose_test.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// A simplistic representation of an upstream data source. keepAlive is set to true because:
/// - When upstream data changes, all keepalive links are removed from the downstream provider
/// - If the downstream does not have any current listeners it will not be rebuilt
/// - If the downstream is not rebuilt, the upstream will have no listeners
/// - Without keepAlive, if the upstream has no listeners, it will be disposed of and the state lost
///
/// When new listeners attach to a *proper* upstream data source, the data source would be able
/// to fetch the state again from scratch or load it from a database cache like Firestore's internal
/// cache. To avoid implementing such behaviour in these tests we use keepAlive to prevent the state
/// being lost when there are no listeners. In our application code, keeping alive too many data
/// sources could lead to memory leaks, so it is important to use this feature judiciously.
///
/// Each test is still able to access an independent value of this provider, thanks to the use of a
/// [ProviderContainer] which scopes all providers to the test.

@ProviderFor(upstream)
const upstreamProvider = UpstreamProvider._();

/// A simplistic representation of an upstream data source. keepAlive is set to true because:
/// - When upstream data changes, all keepalive links are removed from the downstream provider
/// - If the downstream does not have any current listeners it will not be rebuilt
/// - If the downstream is not rebuilt, the upstream will have no listeners
/// - Without keepAlive, if the upstream has no listeners, it will be disposed of and the state lost
///
/// When new listeners attach to a *proper* upstream data source, the data source would be able
/// to fetch the state again from scratch or load it from a database cache like Firestore's internal
/// cache. To avoid implementing such behaviour in these tests we use keepAlive to prevent the state
/// being lost when there are no listeners. In our application code, keeping alive too many data
/// sources could lead to memory leaks, so it is important to use this feature judiciously.
///
/// Each test is still able to access an independent value of this provider, thanks to the use of a
/// [ProviderContainer] which scopes all providers to the test.

final class UpstreamProvider
    extends $FunctionalProvider<AsyncValue<int>, int, Stream<int>>
    with $FutureModifier<int>, $StreamProvider<int> {
  /// A simplistic representation of an upstream data source. keepAlive is set to true because:
  /// - When upstream data changes, all keepalive links are removed from the downstream provider
  /// - If the downstream does not have any current listeners it will not be rebuilt
  /// - If the downstream is not rebuilt, the upstream will have no listeners
  /// - Without keepAlive, if the upstream has no listeners, it will be disposed of and the state lost
  ///
  /// When new listeners attach to a *proper* upstream data source, the data source would be able
  /// to fetch the state again from scratch or load it from a database cache like Firestore's internal
  /// cache. To avoid implementing such behaviour in these tests we use keepAlive to prevent the state
  /// being lost when there are no listeners. In our application code, keeping alive too many data
  /// sources could lead to memory leaks, so it is important to use this feature judiciously.
  ///
  /// Each test is still able to access an independent value of this provider, thanks to the use of a
  /// [ProviderContainer] which scopes all providers to the test.
  const UpstreamProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'upstreamProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$upstreamHash();

  @$internal
  @override
  $StreamProviderElement<int> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<int> create(Ref ref) {
    return upstream(ref);
  }
}

String _$upstreamHash() => r'3d1046e2d3f9a4dc479a0115258d2e87059de9c3';

@ProviderFor(delayDispose)
const delayDisposeProvider = DelayDisposeProvider._();

final class DelayDisposeProvider extends $FunctionalProvider<int, int, int>
    with $Provider<int> {
  const DelayDisposeProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'delayDisposeProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$delayDisposeHash();

  @$internal
  @override
  $ProviderElement<int> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  int create(Ref ref) {
    return delayDispose(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$delayDisposeHash() => r'b55024709670558d1609760954602e837a5bbf3e';
