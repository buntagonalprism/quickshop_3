import 'package:drift/drift.dart';

/// This table is used to store arbitrary key-value data in a fashion similar
/// to SharedPreferences, but by putting them in the database it means the data
/// is accessible via SQL queries, and will be reset if the database is cleared
/// - which is useful when the preferences track things like the state of data
/// in the database itself, e.g. load progress values.
@DataClassName('DbPreferencesRow')
class DbPreferencesTable extends Table {
  TextColumn get key => text()();
  TextColumn get value => text()();

  @override
  String get tableName => 'DbPreferences';

  @override
  Set<Column> get primaryKey => {key};
}

enum DbPreferenceKey {
  processedHiddenSuggestionsVersion('processedHiddenSuggestionsVersion')
  ;

  final String value;
  const DbPreferenceKey(this.value);
}
