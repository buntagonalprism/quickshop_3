import 'package:drift/drift.dart' hide isNull;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quickshop/data/app_database.dart';
import 'package:quickshop/data/app_database_provider.dart';
import 'package:quickshop/data/common/database/load_progress_table.dart';
import 'package:quickshop/data/shopping/suggestions/repositories/shopping_item_suggestion_repo.dart';
import 'package:quickshop/services/firestore.dart';
import 'package:quickshop/services/user_prefs_service.dart';
import 'package:riverpod/riverpod.dart';

import '../../../fakes/fake_prefs_services.dart';
import '../../../mocks/mock_firestore.dart';
import '../../../utilities/create_provider_container.dart';

void main() {
  late AppDatabase database;
  late MockFirebaseFirestore firestore;
  late FakeUserPrefsService userPrefs;
  late ProviderContainer container;

  final updated = DateTime.fromMillisecondsSinceEpoch(1000);

  setUp(() {
    database = AppDatabase(
      QueryExecutorConfig(DatabaseConnection(NativeDatabase.memory(), closeStreamsSynchronously: true)),
    );
    firestore = MockFirebaseFirestore();
    userPrefs = FakeUserPrefsService();
    container = createContainer(
      overrides: [
        appDatabaseProvider.overrideWithValue(database),
        firestoreProvider.overrideWithValue(firestore),
        userPrefsServiceProvider.overrideWithValue(userPrefs),
      ],
    );
  });

  tearDown(() => database.close());

  ShoppingItemSuggestionRepo repo() => container.read(shoppingItemSuggestionRepoProvider);

  ItemSuggestionsRow row(String name) {
    return ItemSuggestionsRow(
      id: name,
      name: name,
      nameLower: name.toLowerCase(),
      category: 'Category',
      popularity: 1,
      hidden: false,
    );
  }

  test('Does not query Firestore when the database is already up to date', () async {
    await userPrefs.setString('itemSuggestionsLangCode', 'en');
    await database.loadProgressDao.save(LoadProgressType.itemSuggestion, updated);

    await repo().download('en', updated);

    verifyNever(() => firestore.collection(any()));
  });

  test('Clears suggestions for a different language', () async {
    await userPrefs.setString('itemSuggestionsLangCode', 'fr');
    await database.suggestionsDao.insertItems([row('Lait')]);
    await database.loadProgressDao.save(LoadProgressType.itemSuggestion, updated);

    await repo().download('en', DateTime.fromMillisecondsSinceEpoch(0));

    expect(await database.select(database.itemSuggestionsTable).get(), isEmpty);
    expect(await database.loadProgressDao.get(LoadProgressType.itemSuggestion), isNull);
    expect(userPrefs.getString('itemSuggestionsLangCode'), 'en');
  });
}
