// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suggestions_dao.dart';

// ignore_for_file: type=lint
mixin _$SuggestionsDaoMixin on DatabaseAccessor<AppDatabase> {
  $HiddenSuggestionsTableTable get hiddenSuggestionsTable =>
      attachedDatabase.hiddenSuggestionsTable;
  $ItemSuggestionsTableTable get itemSuggestionsTable =>
      attachedDatabase.itemSuggestionsTable;
  $CategorySuggestionsTableTable get categorySuggestionsTable =>
      attachedDatabase.categorySuggestionsTable;
  SuggestionsDaoManager get managers => SuggestionsDaoManager(this);
}

class SuggestionsDaoManager {
  final _$SuggestionsDaoMixin _db;
  SuggestionsDaoManager(this._db);
  $$HiddenSuggestionsTableTableTableManager get hiddenSuggestionsTable =>
      $$HiddenSuggestionsTableTableTableManager(
        _db.attachedDatabase,
        _db.hiddenSuggestionsTable,
      );
  $$ItemSuggestionsTableTableTableManager get itemSuggestionsTable =>
      $$ItemSuggestionsTableTableTableManager(
        _db.attachedDatabase,
        _db.itemSuggestionsTable,
      );
  $$CategorySuggestionsTableTableTableManager get categorySuggestionsTable =>
      $$CategorySuggestionsTableTableTableManager(
        _db.attachedDatabase,
        _db.categorySuggestionsTable,
      );
}
