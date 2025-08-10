import 'package:drift/drift.dart';

@DataClassName('ItemSuggestionsRow')
class ItemSuggestionsTable extends Table {
  TextColumn get id => text().withLength(max: 30)();
  TextColumn get name => text()();
  TextColumn get nameLower => text()();
  TextColumn get categories => text()();
  IntColumn get popularity => integer().withDefault(const Constant(0))();

  @override
  String get tableName => 'ItemSuggestions';
}
