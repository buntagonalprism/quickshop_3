// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_suggestion_dao.dart';

// ignore_for_file: type=lint
mixin _$ItemSuggestionDaoMixin on DatabaseAccessor<AppDatabase> {
  $ItemSuggestionsTableTable get itemSuggestionsTable =>
      attachedDatabase.itemSuggestionsTable;
  ItemSuggestionDaoManager get managers => ItemSuggestionDaoManager(this);
}

class ItemSuggestionDaoManager {
  final _$ItemSuggestionDaoMixin _db;
  ItemSuggestionDaoManager(this._db);
  $$ItemSuggestionsTableTableTableManager get itemSuggestionsTable =>
      $$ItemSuggestionsTableTableTableManager(
        _db.attachedDatabase,
        _db.itemSuggestionsTable,
      );
}
