import 'package:drift/drift.dart';

@DataClassName('LoadProgressRow')
class LoadProgressTable extends Table {
  IntColumn get type => integer()();
  IntColumn get retrievedUntil => integer()();

  @override
  String get tableName => 'LoadProgress';

  @override
  Set<Column> get primaryKey => {type};
}

enum LoadProgressType {
  itemSuggestion(1),
  categorySuggestion(2),
  itemHistory(3),
  categoryHistory(4);

  final int value;
  const LoadProgressType(this.value);
}
