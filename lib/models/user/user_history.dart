import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_history.freezed.dart';

@freezed
class UserHistory with _$UserHistory {
  const UserHistory._();

  const factory UserHistory({
    required String userId,
    required DateTime lastHistoryUpdate,
    required HiddenSuggestions hiddenSuggestions,
  }) = _UserHistory;
}

@freezed
class HiddenSuggestions with _$HiddenSuggestions {
  const HiddenSuggestions._();

  const factory HiddenSuggestions({
    required List<String> items,
    required List<String> categories,
  }) = _HiddenSuggestions;
}
