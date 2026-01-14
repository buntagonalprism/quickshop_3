import 'package:drift/drift.dart';

import '../app_database.dart';
import '../tables/hidden_suggestions_table.dart';

part 'hidden_suggestions_dao.g.dart';

@DriftAccessor(tables: [HiddenSuggestionsTable])
class HiddenSuggestionsDao extends DatabaseAccessor<AppDatabase> with _$HiddenSuggestionsDaoMixin {
  HiddenSuggestionsDao(super.db);

  Future<void> replaceAll(List<HiddenSuggestionsRow> rows) async {
    await batch((batch) {
      batch.deleteAll(hiddenSuggestionsTable);
      batch.insertAll(hiddenSuggestionsTable, rows, mode: InsertMode.insert);
    });
  }

  Future<void> insert(HiddenSuggestionsRow row) async {
    await into(hiddenSuggestionsTable).insert(row, mode: InsertMode.insertOrReplace);
  }
}
