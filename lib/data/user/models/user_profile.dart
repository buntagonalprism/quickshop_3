import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile.freezed.dart';

@freezed
abstract class UserProfile with _$UserProfile {
  const UserProfile._();

  const factory UserProfile({
    required String userId,
    DateTime? lastHistoryUpdate,
    int? hiddenSuggestionsVersion,
    List<String>? completedTutorials,
  }) = _UserProfile;
}
