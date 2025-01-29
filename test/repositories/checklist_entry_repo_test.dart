import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quickshop/models/checklist_entry.dart';
import 'package:quickshop/models/user_sortable.dart';
import 'package:quickshop/repositories/checklist_entry_repo.dart';
import 'package:quickshop/services/firestore.dart';
import 'package:riverpod/riverpod.dart';

import '../fakes/fake_firebase_auth.dart';
import '../mocks/mock_firestore.dart';
import '../utilities/create_provider_container.dart';

extension StreamControllerPumpExtension on StreamController {
  /// Add an item to the stream and pump the event queue so that all listeners are notified.
  Future<void> addAndPump<T>(T? value) {
    add(value);
    return pumpEventQueue();
  }
}

MockDocumentSnapshot buildItemDoc({
  required String id,
  int primary = 0,
  String secondary = '',
  bool completed = false,
}) {
  return MockDocumentSnapshot(id, {
    'type': 'item',
    'name': 'Item $id',
    'completed': completed,
    'sortKey': {'primary': primary, 'secondary': secondary}
  });
}

void main() {
  const listId = '1234';

  late FakeFirebaseAuth fakeAuth;
  late MockFirebaseFirestore mockFirestore;
  late ProviderContainer container;
  late MockCollectionReference itemsCollection;
  late StreamController<MockQuerySnapshot> itemsController;

  setUp(() {
    fakeAuth = FakeFirebaseAuth(user: buildUser());
    mockFirestore = MockFirebaseFirestore();
    container = createContainer(overrides: [
      fakeAuth.providerOverride,
      firestoreProvider.overrideWith((ref) => mockFirestore),
    ]);
    itemsCollection = MockCollectionReference();
    when(() => mockFirestore.collection('lists/$listId/items')).thenReturn(itemsCollection);
    itemsController = StreamController();
    when(() => itemsCollection.snapshots()).thenAnswer((_) => itemsController.stream);
  });

  tearDown(() {
    itemsController.close();
  });

  group('Loading entries ', () {
    test(
        'WHEN repository is first created '
        'THEN it should load the entries from Firestore', () {
      final repo = container.read(checklistEntryRepoProvider(listId));

      verify(() => itemsCollection.snapshots()).called(1);
      expect(repo.isLoading, isTrue);
    });

    test(
        'WHEN the items collection is empty '
        'THEN the repo should return an empty list', () async {
      final repoSubscription = container.testListen(checklistEntryRepoProvider(listId));

      await itemsController.addAndPump(MockQuerySnapshot([]));
      final repo = repoSubscription.read();
      expect(repo.hasValue, isTrue);
      expect(repo.requireValue, isEmpty);
    });

    test(
        'WHEN the items collection has entries'
        'THEN the repo should return the entries', () async {
      final repoSubscription = container.testListen(checklistEntryRepoProvider(listId));

      final data = <MockDocumentSnapshot>[
        MockDocumentSnapshot('1', {
          'type': 'item',
          'name': 'Item 1',
          'completed': false,
          'sortKey': {'primary': 0, 'secondary': ''}
        }),
        MockDocumentSnapshot('2', {
          'type': 'item',
          'name': 'Item 2',
          'completed': true,
          'sortKey': {'primary': 1, 'secondary': 'abcd'}
        }),
        MockDocumentSnapshot('3', {
          'type': 'heading',
          'name': 'Heading 1',
          'sortKey': {'primary': 2, 'secondary': '1234'}
        }),
      ];

      await itemsController.addAndPump(MockQuerySnapshot(data));
      final repo = repoSubscription.read();
      expect(repo.hasValue, isTrue);
      expect(repo.requireValue, [
        const ChecklistItem(
          id: '1',
          name: 'Item 1',
          completed: false,
          sortKey: UserSortKey(primary: 0, secondary: ''),
        ).asEntry,
        const ChecklistItem(
          id: '2',
          name: 'Item 2',
          completed: true,
          sortKey: UserSortKey(primary: 1, secondary: 'abcd'),
        ).asEntry,
        const ChecklistHeading(
          id: '3',
          name: 'Heading 1',
          sortKey: UserSortKey(primary: 2, secondary: '1234'),
        ).asEntry,
      ]);
    });
  });

  // group('Inserting entries by position ', () {
  //   test(
  //       'WHEN inserting an item into an empty list '
  //       'THEN it should have primary sort index of 0', () {
  //     final repo = container.read(checklistEntryRepoProvider('1234').notifier);

  //     // final repo
  //   });

  //   test(
  //       'WHEN inserting an item at the start of the list '
  //       'THEN it should have primary sort index one less than first item',
  //       () {});
  // });
}
