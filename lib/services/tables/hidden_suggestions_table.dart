import 'package:drift/drift.dart';

@DataClassName('HiddenSuggestionsRow')
class HiddenSuggestionsTable extends Table {
  TextColumn get id => text().withLength(max: 30)();
  TextColumn get type => text()();
  TextColumn get locale => text()();

  @override
  String get tableName => 'HiddenSuggestions';
}

enum SuggestionType {
  item('item'),
  category('category');

  final String value;
  const SuggestionType(this.value);
}
