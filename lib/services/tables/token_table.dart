import 'package:drift/drift.dart';

@DataClassName('TokenRow')
class TokenTable extends Table {
  IntColumn get type => integer()();
  TextColumn get stringId => text().nullable()();
  IntColumn get intId => integer().nullable()();
  TextColumn get token => text()();

  @override
  String get tableName => 'Tokens';

  @override
  Set<Column> get primaryKey => {type, stringId, intId, token};
}

enum TokenType {
  itemSuggestion(1),
  categorySuggestion(2),
  itemHistory(3),
  categoryHistory(4);

  final int value;
  const TokenType(this.value);
}
