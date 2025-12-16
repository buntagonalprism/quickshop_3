import 'package:freezed_annotation/freezed_annotation.dart';

part 'hidden_suggestions.freezed.dart';
part 'hidden_suggestions.g.dart';

@freezed
abstract class HiddenSuggestions with _$HiddenSuggestions {
  const HiddenSuggestions._();

  const factory HiddenSuggestions({
    required String locale,
    required int version,
    required DateTime lastUpdated,
    required List<String> items,
    required List<String> categories,
  }) = _HiddenSuggestions;

  factory HiddenSuggestions.fromJson(Map<String, dynamic> json) => _$HiddenSuggestionsFromJson(json);

  static HiddenSuggestions empty(String locale) {
    return HiddenSuggestions(
      locale: locale,
      version: 0,
      lastUpdated: DateTime.fromMillisecondsSinceEpoch(0),
      items: [],
      categories: [],
    );
  }
}
