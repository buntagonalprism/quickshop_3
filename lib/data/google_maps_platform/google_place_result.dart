import 'package:freezed_annotation/freezed_annotation.dart';

part 'google_place_result.freezed.dart';

@freezed
abstract class GooglePlaceResult with _$GooglePlaceResult {
  const factory GooglePlaceResult({
    required String placeId,
    required String name,
    required String address,
  }) = _GooglePlaceResult;
}
