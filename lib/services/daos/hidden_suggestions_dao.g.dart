// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hidden_suggestions_dao.dart';

// ignore_for_file: type=lint
mixin _$HiddenSuggestionsDaoMixin on DatabaseAccessor<AppDatabase> {
  $HiddenSuggestionsTableTable get hiddenSuggestionsTable =>
      attachedDatabase.hiddenSuggestionsTable;
  HiddenSuggestionsDaoManager get managers => HiddenSuggestionsDaoManager(this);
}

class HiddenSuggestionsDaoManager {
  final _$HiddenSuggestionsDaoMixin _db;
  HiddenSuggestionsDaoManager(this._db);
  $$HiddenSuggestionsTableTableTableManager get hiddenSuggestionsTable =>
      $$HiddenSuggestionsTableTableTableManager(
        _db.attachedDatabase,
        _db.hiddenSuggestionsTable,
      );
}
