// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'functions_http_client.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(functionsHttpClient)
const functionsHttpClientProvider = FunctionsHttpClientProvider._();

final class FunctionsHttpClientProvider
    extends
        $FunctionalProvider<
          FunctionsHttpClient,
          FunctionsHttpClient,
          FunctionsHttpClient
        >
    with $Provider<FunctionsHttpClient> {
  const FunctionsHttpClientProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'functionsHttpClientProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$functionsHttpClientHash();

  @$internal
  @override
  $ProviderElement<FunctionsHttpClient> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  FunctionsHttpClient create(Ref ref) {
    return functionsHttpClient(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FunctionsHttpClient value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FunctionsHttpClient>(value),
    );
  }
}

String _$functionsHttpClientHash() =>
    r'b7e4825fb3136f6f9c1d0c48c01fa049db6aa832';
