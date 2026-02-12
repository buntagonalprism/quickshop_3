import 'package:drift/drift.dart';

@DataClassName('CategoryHistoryRow')
class CategoryHistoryTable extends Table {
  TextColumn get id => text().withLength(max: 30)();
  TextColumn get name => text()();
  TextColumn get nameLower => text()();
  IntColumn get lastUsed => integer()();
  IntColumn get usageCount => integer()();

  @override
  String get tableName => 'CategoryHistory';

  @override
  Set<Column> get primaryKey => {id};
}
