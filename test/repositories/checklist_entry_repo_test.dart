import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quickshop/models/checklist_entry.dart';
import 'package:quickshop/models/user_sortable.dart';
import 'package:quickshop/repositories/checklist_entry_repo.dart';
import 'package:quickshop/repositories/list_leave_in_progress_repo.dart';
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

MockDocumentSnapshot itemSnapshot({
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

MockQuerySnapshot itemsSnapshot(List<UserSortKey> sortKeys) {
  return MockQuerySnapshot(sortKeys
      .asMap()
      .entries
      .map((e) => itemSnapshot(
          id: e.key.toString(), primary: e.value.primary, secondary: e.value.secondary))
      .toList());
}

UserSortKey sortKey(int primary, String secondary) =>
    UserSortKey(primary: primary, secondary: secondary);

void main() {
  const listId = '1234';
  final provider = checklistEntryRepoProvider('1234');

  late FakeFirebaseAuth fakeAuth;
  late MockFirebaseFirestore mockFirestore;
  late ProviderContainer container;
  late MockCollectionReference itemsCollection;
  late StreamController<MockQuerySnapshot> itemsController;
  late MockDocumentReference listDoc;

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
    listDoc = MockDocumentReference();
    when(() => mockFirestore.doc('lists/$listId')).thenReturn(listDoc);
  });

  tearDown(() {
    itemsController.close();
  });

  group('Loading entries ', () {
    test(
        'WHEN repository is first created '
        'THEN it should load the entries from Firestore', () {
      final repo = container.read(provider);

      verify(() => itemsCollection.snapshots()).called(1);
      expect(repo.isLoading, isTrue);
    });

    test(
        'WHEN the items collection is empty '
        'THEN the repo should return an empty list', () async {
      final repoSubscription = container.testListen(provider);

      await itemsController.addAndPump(MockQuerySnapshot([]));
      final repo = repoSubscription.read();
      expect(repo.hasValue, isTrue);
      expect(repo.requireValue, isEmpty);
    });

    test(
        'WHEN the items collection has entries '
        'THEN the repo should return the entries', () async {
      final repoSubscription = container.testListen(provider);

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

    test(
        'WHEN the items collection has an error'
        'THEN the repo should return an error', () async {
      final repoSubscription = container.testListen(provider);

      await itemsController.addAndPump(MockQuerySnapshot([]));
      var repo = repoSubscription.read();
      expect(repo.hasError, isFalse);

      itemsController.addError(Exception('Test error'));
      await pumpEventQueue();
      repo = repoSubscription.read();
      expect(repo.hasError, isTrue);
    });

    test(
        'WHEN the user has just left the list '
        'THEN the repo should enter a loading state', () async {
      final repoSubscription = container.testListen(provider);

      final data = [
        MockDocumentSnapshot('1', {
          'type': 'item',
          'name': 'Item 1',
          'completed': false,
          'sortKey': {'primary': 0, 'secondary': ''}
        })
      ];
      await itemsController.addAndPump(MockQuerySnapshot(data));
      var repo = repoSubscription.read();
      expect(repo.hasValue, isTrue);
      expect(repo.isLoading, isFalse);
      expect(repo.requireValue, hasLength(1));

      container.read(listLeaveInProgressRepoProvider.notifier).add(listId);
      await pumpEventQueue();
      repo = repoSubscription.read();
      expect(repo.isLoading, isTrue);
    });
  });

  group('Inserting entries ', () {
    const itemName = 'New item';
    const headingName = 'New heading';

    // Helper function to create the expected data for a new item
    Map<String, dynamic> newItemData(int primary, String secondary) => {
          'type': 'item',
          'name': itemName,
          'completed': false,
          'sortKey': {'primary': primary, 'secondary': secondary}
        };

    // Helper function to create the expected data for a new heading
    Map<String, dynamic> newHeaderData(int primary, String secondary) => {
          'type': 'heading',
          'name': headingName,
          'sortKey': {'primary': primary, 'secondary': secondary}
        };

    late MockBatch batch;
    late MockDocumentReference newEntryDoc;

    setUp(() {
      batch = MockBatch();
      when(() => mockFirestore.batch()).thenReturn(batch);
      newEntryDoc = MockDocumentReference();
      when(() => itemsCollection.doc()).thenReturn(newEntryDoc);
    });

    test(
        'WHEN inserting an item into an empty list '
        'THEN it should have primary sort index of 0', () async {
      container.testListen(provider);
      await itemsController.addAndPump(MockQuerySnapshot([]));
      container.read(provider.notifier).addItem(itemName, ChecklistAddPosition.start);

      verify(() => batch.set(newEntryDoc, newItemData(0, ''))).called(1);
      verify(() => batch.commit()).called(1);
    });

    test(
        'WHEN inserting a heading into an empty list '
        'THEN it should have primary sort index of 0', () async {
      container.testListen(provider);
      await itemsController.addAndPump(MockQuerySnapshot([]));
      container.read(provider.notifier).addHeading(headingName, ChecklistAddPosition.start);

      verify(() => batch.set(newEntryDoc, newHeaderData(0, ''))).called(1);
      verify(() => batch.commit()).called(1);
    });

    test(
        'WHEN inserting items at beginning of list '
        'THEN they should have a primary sort index one less than the first item', () async {
      final items = itemsSnapshot([sortKey(-4, 'abcd'), sortKey(-3, 'efgh')]);
      container.testListen(provider);
      await itemsController.addAndPump(items);
      container.read(provider.notifier).addItem(itemName, ChecklistAddPosition.start);

      verify(() => batch.set(newEntryDoc, newItemData(-5, ''))).called(1);
      verify(() => batch.commit()).called(1);
    });

    test(
        'WHEN inserting headings at beginning of list '
        'THEN they should have a primary sort index one less than the first item', () async {
      final items = itemsSnapshot([sortKey(-4, 'abcd'), sortKey(-3, 'efgh')]);
      container.testListen(provider);
      await itemsController.addAndPump(items);
      container.read(provider.notifier).addHeading(headingName, ChecklistAddPosition.start);

      verify(() => batch.set(newEntryDoc, newHeaderData(-5, ''))).called(1);
      verify(() => batch.commit()).called(1);
    });

    test(
        'WHEN inserting items at end of list '
        'THEN they should have a primary sort index one greater than the last item', () async {
      final items = itemsSnapshot([sortKey(4, 'abcd'), sortKey(5, 'efgh')]);
      container.testListen(provider);
      await itemsController.addAndPump(items);
      container.read(provider.notifier).addItem(itemName, ChecklistAddPosition.end);

      verify(() => batch.set(newEntryDoc, newItemData(6, ''))).called(1);
      verify(() => batch.commit()).called(1);
    });

    test(
        'WHEN inserting headings at end of list '
        'THEN they should have a primary sort index one greater than the last item', () async {
      final items = itemsSnapshot([sortKey(4, 'abcd'), sortKey(5, 'efgh')]);
      container.testListen(provider);
      await itemsController.addAndPump(items);
      container.read(provider.notifier).addHeading(headingName, ChecklistAddPosition.end);

      verify(() => batch.set(newEntryDoc, newHeaderData(6, ''))).called(1);
      verify(() => batch.commit()).called(1);
    });

    test(
        'WHEN inserting items after another entry '
        'AND there is a primary sort key gap of two or more '
        'THEN inserted item should have a primary sort key between the two items', () async {
      final items = itemsSnapshot([sortKey(2, 'abcd'), sortKey(4, 'efgh')]);
      container.testListen(provider);
      await itemsController.addAndPump(items);
      final entries = container.read(provider).requireValue;
      container.read(provider.notifier).addItemAfter(itemName, entries[0]);

      verify(() => batch.set(newEntryDoc, newItemData(3, ''))).called(1);
      verify(() => batch.commit()).called(1);
    });

    test(
      'WHEN inserting headings after another entry '
      'AND there is a primary sort key gap of two or more '
      'THEN inserted heading should have a primary sort key between the two items',
      () async {
        final items = itemsSnapshot([sortKey(2, 'abcd'), sortKey(4, 'efgh')]);
        container.testListen(provider);
        await itemsController.addAndPump(items);
        final entries = container.read(provider).requireValue;
        container.read(provider.notifier).addHeadingAfter(headingName, entries[0]);

        verify(() => batch.set(newEntryDoc, newHeaderData(3, ''))).called(1);
        verify(() => batch.commit()).called(1);
      },
    );

    test(
        'WHEN inserting items after another entry '
        'AND there is no primary sort key gap '
        'THEN the inserted item should have the median secondary sort key', () async {
      final items = itemsSnapshot([sortKey(2, '1111'), sortKey(2, '3333')]);
      container.testListen(provider);
      await itemsController.addAndPump(items);
      final entries = container.read(provider).requireValue;
      container.read(provider.notifier).addItemAfter(itemName, entries[0]);

      verify(() => batch.set(newEntryDoc, newItemData(2, '2222'))).called(1);
      verify(() => batch.commit()).called(1);
    });

    test(
        'WHEN inserting headings after another entry '
        'AND there is no primary sort key gap '
        'THEN the inserted heading should have the median secondary sort key', () async {
      final items = itemsSnapshot([sortKey(2, '1111'), sortKey(2, '3333')]);
      container.testListen(provider);
      await itemsController.addAndPump(items);
      final entries = container.read(provider).requireValue;
      container.read(provider.notifier).addHeadingAfter(headingName, entries[0]);

      verify(() => batch.set(newEntryDoc, newHeaderData(2, '2222'))).called(1);
      verify(() => batch.commit()).called(1);
    });
  });

  group('Moving entries ', () {
    late MockBatch batch;
    late MockDocumentReference entryDoc;

    setUp(() {
      batch = MockBatch();
      when(() => mockFirestore.batch()).thenReturn(batch);
      entryDoc = MockDocumentReference();
    });

    test(
        'WHEN moving an entry to the start of the list '
        'THEN it is given a primary sort key one less than the first item', () async {
      final items = itemsSnapshot([sortKey(-3, ''), sortKey(-2, ''), sortKey(0, '')]);
      container.testListen(provider);
      await itemsController.addAndPump(items);
      final entries = container.read(provider).requireValue;
      final entryPath = 'lists/$listId/items/${items.docs[2].id}';
      when(() => mockFirestore.doc(entryPath)).thenReturn(entryDoc);

      container.read(provider.notifier).moveEntry(entries[2], 0);

      final expectedSortKey = const UserSortKey(primary: -4, secondary: '').toJson();
      verify(() => batch.update(entryDoc, {'sortKey': expectedSortKey})).called(1);
    });

    test(
        'WHEN moving an entry to the end of the list '
        'THEN it is given a primary sort key one greater than the last item', () async {
      final items = itemsSnapshot([sortKey(-3, ''), sortKey(-2, ''), sortKey(0, '')]);
      container.testListen(provider);
      await itemsController.addAndPump(items);
      final entries = container.read(provider).requireValue;
      final entryPath = 'lists/$listId/items/${items.docs[0].id}';
      when(() => mockFirestore.doc(entryPath)).thenReturn(entryDoc);

      container.read(provider.notifier).moveEntry(entries[0], 2);

      final expectedSortKey = const UserSortKey(primary: 1, secondary: '').toJson();
      verify(() => batch.update(entryDoc, {'sortKey': expectedSortKey})).called(1);
    });

    test(
        'WHEN moving an entry between other entries '
        'AND there is a primary gap '
        'THEN it is given primary sort key between the other entries', () async {
      final items = itemsSnapshot([
        sortKey(1, '1111'),
        sortKey(3, '3333'),
        sortKey(5, ''),
      ]);
      container.testListen(provider);
      await itemsController.addAndPump(items);
      final entries = container.read(provider).requireValue;
      final entryPath = 'lists/$listId/items/${items.docs[2].id}';
      when(() => mockFirestore.doc(entryPath)).thenReturn(entryDoc);

      container.read(provider.notifier).moveEntry(entries[2], 1);

      final expectedSortKey = const UserSortKey(primary: 2, secondary: '').toJson();
      verify(() => batch.update(entryDoc, {'sortKey': expectedSortKey})).called(1);
    });

    test(
        'WHEN moving an entry between other entries '
        'AND there is no primary gap '
        'THEN it is given secondary sort key between the other entries', () async {
      final items = itemsSnapshot([
        sortKey(4, '1111'),
        sortKey(4, '3333'),
        sortKey(5, ''),
      ]);
      container.testListen(provider);
      await itemsController.addAndPump(items);
      final entries = container.read(provider).requireValue;
      final entryPath = 'lists/$listId/items/${items.docs[2].id}';
      when(() => mockFirestore.doc(entryPath)).thenReturn(entryDoc);

      container.read(provider.notifier).moveEntry(entries[2], 1);

      final expectedSortKey = const UserSortKey(primary: 4, secondary: '2222').toJson();
      verify(() => batch.update(entryDoc, {'sortKey': expectedSortKey})).called(1);
    });
  });
}
