import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drift/drift.dart' hide Query;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quickshop/data/app_database.dart';
import 'package:quickshop/data/app_database_provider.dart';
import 'package:quickshop/data/common/database/load_progress_table.dart';
import 'package:quickshop/data/shopping/history/repositories/shopping_item_history_repo.dart';
import 'package:quickshop/data/user/models/user_auth.dart';
import 'package:quickshop/services/auth_service.dart';
import 'package:quickshop/services/firestore.dart';
import 'package:riverpod/riverpod.dart';

import '../../../mocks/mock_firestore.dart';
import '../../../utilities/create_provider_container.dart';

// ignore: subtype_of_sealed_class
class MockQuery extends Mock implements Query<Map<String, dynamic>> {}

void main() {
  late Map<String, AppDatabase> databases;
  late MockFirebaseFirestore firestore;
  late Map<String, MockCollectionReference> historyCollections;
  late ProviderContainer container;
  late String userId;

  final lastUsed = DateTime.fromMillisecondsSinceEpoch(1000);

  setUp(() {
    databases = {
      for (final id in ['user-a', 'user-b'])
        id: AppDatabase(
          QueryExecutorConfig(DatabaseConnection(NativeDatabase.memory(), closeStreamsSynchronously: true)),
        ),
    };
    firestore = MockFirebaseFirestore();
    final users = MockCollectionReference();
    when(() => firestore.collection('users')).thenReturn(users);
    historyCollections = {};
    for (final id in databases.keys) {
      final userDoc = MockDocumentReference();
      final history = MockCollectionReference();
      final query = MockQuery();
      final emptyResults = MockQuerySnapshot([]);
      when(() => emptyResults.size).thenReturn(0);
      when(() => users.doc(id)).thenReturn(userDoc);
      when(() => userDoc.collection('itemHistory')).thenReturn(history);
      when(() => history.where(any(), isGreaterThan: any(named: 'isGreaterThan'))).thenReturn(query);
      when(() => query.orderBy(any())).thenReturn(query);
      when(() => query.limit(any())).thenReturn(query);
      when(() => query.get()).thenAnswer((_) async => emptyResults);
      historyCollections[id] = history;
    }
    userId = 'user-a';
    container = createContainer(
      overrides: [
        firestoreProvider.overrideWithValue(firestore),
        userAuthProvider.overrideWith((ref) => UserAuth(id: userId, name: userId, email: '$userId@example.com')),
        appDatabaseProvider.overrideWith((ref) => databases[ref.watch(userAuthProvider)!.id]!),
      ],
    );
  });

  tearDown(() async {
    for (final database in databases.values) {
      await database.close();
    }
  });

  Future<void> signInAs(String id) async {
    userId = id;
    container.invalidate(userAuthProvider);
    await pumpEventQueue();
  }

  test("Each user's history is fetched from their own download progress", () async {
    await databases['user-a']!.loadProgressDao.save(LoadProgressType.itemHistory, lastUsed);
    final repo = container.read(shoppingItemHistoryRepoProvider);
    final newUpdate = lastUsed.add(const Duration(seconds: 1));

    repo.onUserHistoryUpdated(newUpdate);
    await pumpEventQueue();
    await signInAs('user-b');
    repo.onUserHistoryUpdated(newUpdate);
    await pumpEventQueue();

    verify(() => historyCollections['user-a']!.where('lastUsed', isGreaterThan: 1000)).called(1);
    verify(() => historyCollections['user-b']!.where('lastUsed', isGreaterThan: 0)).called(1);
  });
}
