import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile.freezed.dart';

@freezed
abstract class UserProfile with _$UserProfile {
  const UserProfile._();

  const factory UserProfile({
    required String userId,
    required DateTime lastHistoryUpdate,
    required int lastHiddenSuggestionsVersion,
  }) = _UserHistory;
}
