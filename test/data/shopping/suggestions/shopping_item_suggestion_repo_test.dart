import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quickshop/data/app_database.dart';
import 'package:quickshop/data/app_database_provider.dart';
import 'package:quickshop/data/shopping/suggestions/repositories/shopping_item_suggestion_repo.dart';
import 'package:quickshop/services/auth_service.dart';
import 'package:quickshop/services/firestore.dart';
import 'package:quickshop/services/shared_preferences.dart';

import '../../../fakes/fake_shared_preferences.dart';
import '../../../mocks/mock_firestore.dart';
import '../../../utilities/create_provider_container.dart';

void main() {
  late MockFirebaseFirestore firestore;
  late MockCollectionReference suggestions;
  late AppDatabase database;
  String? userId;

  setUp(() {
    firestore = MockFirebaseFirestore();
    suggestions = MockCollectionReference();
    final summaryDoc = MockDocumentReference();
    when(() => firestore.collection('suggestions')).thenReturn(suggestions);
    when(() => suggestions.doc('items')).thenReturn(summaryDoc);
    when(() => summaryDoc.snapshots()).thenAnswer((_) => const Stream.empty());
    database = AppDatabase(
      QueryExecutorConfig(DatabaseConnection(NativeDatabase.memory(), closeStreamsSynchronously: true)),
    );
    userId = null;
  });

  tearDown(() => database.close());

  test('Suggestions are only synced once a user signs in', () async {
    final container = createContainer(
      overrides: [
        firestoreProvider.overrideWithValue(firestore),
        appDatabaseProvider.overrideWithValue(database),
        sharedPrefsProvider.overrideWithValue(FakeSharedPreferences()),
        userIdProvider.overrideWith((ref) => userId),
      ],
    );

    container.testListen(shoppingItemSuggestionRepoProvider);
    await pumpEventQueue();
    verifyNever(() => firestore.collection('suggestions'));

    userId = 'user-a';
    container.invalidate(userIdProvider);
    container.read(shoppingItemSuggestionRepoProvider);
    await pumpEventQueue();
    verify(() => suggestions.doc('items')).called(1);

    userId = 'user-b';
    container.invalidate(userIdProvider);
    container.read(shoppingItemSuggestionRepoProvider);
    await pumpEventQueue();
    verify(() => suggestions.doc('items')).called(1);
  });
}
