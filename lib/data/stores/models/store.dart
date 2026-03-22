import 'package:freezed_annotation/freezed_annotation.dart';

import '../../common/models/coordinates.dart';
import '../../user/models/user_auth.dart';
import 'loyalty_card.dart';
import 'store_location.dart';

part 'store.freezed.dart';

@freezed
abstract class Store with _$Store {
  const Store._();

  const factory Store({
    required String id,
    required String storeName,

    /// The ID of the user who created the store
    required String ownerId,

    /// List of user IDs who can edit the store, including the owner
    required List<String> editorIds,

    /// List of user details of users who can edit the store, including the owner
    required List<UserAuth> editors,

    /// Optional geographic coordinates of the store, used to suggest nearby stores
    Coordinates? coordinates,

    /// Optional loyalty card details for the store, to be shown at the end of shopping
    LoyaltyCard? loyaltyCard,

    /// List of distinct locations within the store
    required List<StoreLocation> locations,
  }) = _Store;
}
