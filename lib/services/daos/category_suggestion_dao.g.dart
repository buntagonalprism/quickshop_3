// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_suggestion_dao.dart';

// ignore_for_file: type=lint
mixin _$CategorySuggestionDaoMixin on DatabaseAccessor<AppDatabase> {
  $CategorySuggestionsTableTable get categorySuggestionsTable =>
      attachedDatabase.categorySuggestionsTable;
  CategorySuggestionDaoManager get managers =>
      CategorySuggestionDaoManager(this);
}

class CategorySuggestionDaoManager {
  final _$CategorySuggestionDaoMixin _db;
  CategorySuggestionDaoManager(this._db);
  $$CategorySuggestionsTableTableTableManager get categorySuggestionsTable =>
      $$CategorySuggestionsTableTableTableManager(
        _db.attachedDatabase,
        _db.categorySuggestionsTable,
      );
}
