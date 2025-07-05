import 'package:drift/drift.dart';

@DataClassName('ItemHistoryRow')
class ItemHistoryTable extends Table {
  TextColumn get id => text().withLength(max: 30)();
  TextColumn get name => text()();
  TextColumn get nameLower => text()();
  IntColumn get lastUsed => integer()();
  IntColumn get usageCount => integer()();
  TextColumn get categories => text()();

  @override
  String get tableName => 'ItemHistory';
}
