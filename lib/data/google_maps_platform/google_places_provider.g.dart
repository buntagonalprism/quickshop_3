// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'google_places_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(googlePlacesAutocomplete)
const googlePlacesAutocompleteProvider = GooglePlacesAutocompleteFamily._();

final class GooglePlacesAutocompleteProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<GooglePlaceResult>>,
          List<GooglePlaceResult>,
          FutureOr<List<GooglePlaceResult>>
        >
    with
        $FutureModifier<List<GooglePlaceResult>>,
        $FutureProvider<List<GooglePlaceResult>> {
  const GooglePlacesAutocompleteProvider._({
    required GooglePlacesAutocompleteFamily super.from,
    required (String, {Coordinates? location}) super.argument,
  }) : super(
         retry: null,
         name: r'googlePlacesAutocompleteProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$googlePlacesAutocompleteHash();

  @override
  String toString() {
    return r'googlePlacesAutocompleteProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<List<GooglePlaceResult>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<GooglePlaceResult>> create(Ref ref) {
    final argument = this.argument as (String, {Coordinates? location});
    return googlePlacesAutocomplete(
      ref,
      argument.$1,
      location: argument.location,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is GooglePlacesAutocompleteProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$googlePlacesAutocompleteHash() =>
    r'cae6a8ce6d6a10975dc9dd5914316bf61a22f78e';

final class GooglePlacesAutocompleteFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<List<GooglePlaceResult>>,
          (String, {Coordinates? location})
        > {
  const GooglePlacesAutocompleteFamily._()
    : super(
        retry: null,
        name: r'googlePlacesAutocompleteProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GooglePlacesAutocompleteProvider call(
    String query, {
    Coordinates? location,
  }) => GooglePlacesAutocompleteProvider._(
    argument: (query, location: location),
    from: this,
  );

  @override
  String toString() => r'googlePlacesAutocompleteProvider';
}

@ProviderFor(googlePlaceCoordinates)
const googlePlaceCoordinatesProvider = GooglePlaceCoordinatesFamily._();

final class GooglePlaceCoordinatesProvider
    extends
        $FunctionalProvider<
          AsyncValue<Coordinates?>,
          Coordinates?,
          FutureOr<Coordinates?>
        >
    with $FutureModifier<Coordinates?>, $FutureProvider<Coordinates?> {
  const GooglePlaceCoordinatesProvider._({
    required GooglePlaceCoordinatesFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'googlePlaceCoordinatesProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$googlePlaceCoordinatesHash();

  @override
  String toString() {
    return r'googlePlaceCoordinatesProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Coordinates?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<Coordinates?> create(Ref ref) {
    final argument = this.argument as String;
    return googlePlaceCoordinates(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is GooglePlaceCoordinatesProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$googlePlaceCoordinatesHash() =>
    r'f6e87e50054af642ec65d082111d5f2ec76ff79a';

final class GooglePlaceCoordinatesFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Coordinates?>, String> {
  const GooglePlaceCoordinatesFamily._()
    : super(
        retry: null,
        name: r'googlePlaceCoordinatesProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GooglePlaceCoordinatesProvider call(String placeId) =>
      GooglePlaceCoordinatesProvider._(argument: placeId, from: this);

  @override
  String toString() => r'googlePlaceCoordinatesProvider';
}
