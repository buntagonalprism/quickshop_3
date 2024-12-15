// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delay_provider_dispose_test.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$upstreamHash() => r'3d1046e2d3f9a4dc479a0115258d2e87059de9c3';

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
///
/// Copied from [upstream].
@ProviderFor(upstream)
final upstreamProvider = StreamProvider<int>.internal(
  upstream,
  name: r'upstreamProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$upstreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UpstreamRef = StreamProviderRef<int>;
String _$delayDisposeHash() => r'08780462aa203cea2d63c4dfa53d264511f51ddc';

/// See also [delayDispose].
@ProviderFor(delayDispose)
final delayDisposeProvider = AutoDisposeProvider<int>.internal(
  delayDispose,
  name: r'delayDisposeProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$delayDisposeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef DelayDisposeRef = AutoDisposeProviderRef<int>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
