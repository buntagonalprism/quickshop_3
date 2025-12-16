// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hidden_suggestions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HiddenSuggestions _$HiddenSuggestionsFromJson(Map<String, dynamic> json) =>
    _HiddenSuggestions(
      locale: json['locale'] as String,
      version: (json['version'] as num).toInt(),
      lastUpdated: DateTime.parse(json['lastUpdated'] as String),
      items: (json['items'] as List<dynamic>).map((e) => e as String).toList(),
      categories: (json['categories'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$HiddenSuggestionsToJson(_HiddenSuggestions instance) =>
    <String, dynamic>{
      'locale': instance.locale,
      'version': instance.version,
      'lastUpdated': instance.lastUpdated.toIso8601String(),
      'items': instance.items,
      'categories': instance.categories,
    };
