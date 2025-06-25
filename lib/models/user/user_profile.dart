import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile.freezed.dart';

@freezed
class UserProfile with _$UserProfile {
  const UserProfile._();

  const factory UserProfile({
    required DateTime lastHistoryUpdate,
    required HiddenSuggestions hiddenSuggestions,
  }) = _UserProfile;
}

@freezed
class HiddenSuggestions with _$HiddenSuggestions {
  const HiddenSuggestions._();

  const factory HiddenSuggestions({
    required List<String> items,
    required List<String> categories,
  }) = _HiddenSuggestions;
}
