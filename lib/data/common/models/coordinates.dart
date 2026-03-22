import 'package:freezed_annotation/freezed_annotation.dart';

part 'coordinates.freezed.dart';

@freezed
abstract class Coordinates with _$Coordinates {
  const Coordinates._();

  const factory Coordinates({
    required double latitude,
    required double longitude,
  }) = _Coordinates;
}
