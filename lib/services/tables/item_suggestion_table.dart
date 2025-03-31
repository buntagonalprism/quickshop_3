import 'package:drift/drift.dart';

@DataClassName('ItemSuggestionsRow')
class ItemSuggestionsTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 100)();
  TextColumn get token => text().withLength(min: 1, max: 100)();

  @override
  String get tableName => 'ItemSuggestions';
}
