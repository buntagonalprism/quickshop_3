import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../common/models/coordinates.dart';
import 'google_maps_platform_config.dart';
import 'google_place_result.dart';

part 'google_places_provider.g.dart';

const _baseUrl = 'places.googleapis.com';

Map<String, String> _headers() => {
  'Content-Type': 'application/json',
  'X-Goog-Api-Key': GoogleMapsPlatformConfig.apiKey,
};

@riverpod
Future<List<GooglePlaceResult>> googlePlacesAutocomplete(
  Ref ref,
  String query, {
  Coordinates? location,
}) async {
  if (query.trim().isEmpty) return [];

  final body = <String, dynamic>{
    'input': query,
    'includedPrimaryTypes': ['establishment'],
  };
  if (location != null) {
    body['locationBias'] = {
      'circle': {
        'center': {'latitude': location.latitude, 'longitude': location.longitude},
        'radius': 2000.0,
      },
    };
  }

  final response = await http.post(
    Uri.https(_baseUrl, '/v1/places:autocomplete'),
    headers: {
      ..._headers(),
      'X-Goog-FieldMask': 'suggestions.placePrediction.placeId,suggestions.placePrediction.structuredFormat',
    },
    body: json.encode(body),
  );

  if (response.statusCode != 200) {
    throw Exception('Places API HTTP error: ${response.statusCode}');
  }

  final data = json.decode(response.body) as Map<String, dynamic>;
  final suggestions = data['suggestions'] as List<dynamic>? ?? [];

  return suggestions.map((s) {
    final prediction = s['placePrediction'] as Map<String, dynamic>;
    final sf = prediction['structuredFormat'] as Map<String, dynamic>;
    return GooglePlaceResult(
      placeId: prediction['placeId'] as String,
      name: (sf['mainText'] as Map<String, dynamic>)['text'] as String,
      address: ((sf['secondaryText'] as Map<String, dynamic>?))?['text'] as String? ?? '',
    );
  }).toList();
}

@riverpod
Future<Coordinates?> googlePlaceCoordinates(Ref ref, String placeId) async {
  final response = await http.get(
    Uri.https(_baseUrl, '/v1/places/$placeId'),
    headers: {
      ..._headers(),
      'X-Goog-FieldMask': 'location',
    },
  );

  if (response.statusCode != 200) return null;

  final data = json.decode(response.body) as Map<String, dynamic>;
  final location = data['location'] as Map<String, dynamic>?;
  if (location == null) return null;

  return Coordinates(
    latitude: (location['latitude'] as num).toDouble(),
    longitude: (location['longitude'] as num).toDouble(),
  );
}
