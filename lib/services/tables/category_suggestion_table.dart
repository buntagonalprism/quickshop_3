import 'package:drift/drift.dart';

@DataClassName('CategorySuggestionsRow')
class CategorySuggestionsTable extends Table {
  TextColumn get id => text().withLength(max: 30)();
  TextColumn get name => text()();
  TextColumn get nameLower => text()();

  @override
  String get tableName => 'CategorySuggestions';
}
