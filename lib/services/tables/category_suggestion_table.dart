import 'package:drift/drift.dart';

@DataClassName('CategorySuggestionsRow')
class CategorySuggestionsTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 100)();
  TextColumn get token => text().withLength(min: 1, max: 100)();

  @override
  String get tableName => 'CategorySuggestions';
}
