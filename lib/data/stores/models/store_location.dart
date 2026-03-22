import 'package:freezed_annotation/freezed_annotation.dart';

import '../../common/models/has_id.dart';
import '../../common/models/user_sortable.dart';

part 'store_location.freezed.dart';

@freezed
abstract class StoreLocation with _$StoreLocation implements UserSortable, HasId {
  const StoreLocation._();

  const factory StoreLocation({
    required String id,

    /// Name of the store location, e.g. "Aisle 12", "Back wall", "Deli"
    required String name,

    /// The sort key tracks the order in which store locations should be
    /// visited when the user is shopping in this store.
    required UserSortKey sortKey,

    /// Product categories which can be found in this store location
    required List<String> categories,
  }) = _StoreLocation;

  @override
  String get sortFallback => name;
}
