import 'package:freezed_annotation/freezed_annotation.dart';

part 'loyalty_card.freezed.dart';

@freezed
abstract class LoyaltyCard with _$LoyaltyCard {
  const LoyaltyCard._();

  const factory LoyaltyCard({
    required String name,
    required int barcode,
    int? color,
  }) = _LoyaltyCard;
}
