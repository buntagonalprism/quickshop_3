import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quickshop/application/checklists/checklist_entry_notifier.dart';
import 'package:quickshop/application/list_leave_in_progress_notifier.dart';
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

MockDocumentSnapshot headingSnapshot({
  required String id,
  int primary = 0,
  String secondary = '',
}) {
  return MockDocumentSnapshot(id, {
    'type': 'heading',
    'name': 'Heading $id',
    'sortKey': {'primary': primary, 'secondary': secondary}
  });
}

MockQuerySnapshot itemsSnapshot(List<UserSortKey> sortKeys) {
  return MockQuerySnapshot(sortKeys
      .asMap()
      .entries
      .map((e) => itemSnapshot(id: e.key.toString(), primary: e.value.primary, secondary: e.value.secondary))
      .toList());
}

UserSortKey sortKey(int primary, String secondary) => UserSortKey(primary: primary, secondary: secondary);

Map<String, dynamic> sortKeyJson(int primary, String secondary) => sortKey(primary, secondary).toJson();

void main() {
  const listId = '1234';
  final provider = checklistEntryProvider('1234');

  late FakeFirebaseAuth fakeAuth;
  late MockFirebaseFirestore mockFirestore;
  late ProviderContainer container;
  late MockCollectionReference itemsCollection;
  late StreamController<MockQuerySnapshot> itemsController;
  late MockDocumentReference listDoc;

  setUpAll(() {
    registerFallbackValue(MockDocumentReference());
  });

  setUp(() {
    fakeAuth = FakeFirebaseAuth(user: buildUser());
    mockFirestore = MockFirebaseFirestore();
    container = createContainer(overrides: [
      fakeAuth.providerOverride,
      firestoreProvider.overrideWith((ref) => mockFirestore),
    ]);
    itemsCollection = MockCollectionReference();
    when(() => mockFirestore.collection('lists/$listId/items')).thenReturn(itemsCollection);
    itemsController = StreamController.broadcast();
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

      container.read(listLeaveInProgressProvider.notifier).add(listId);
      await pumpEventQueue();
      repo = repoSubscription.read();
      expect(repo.isLoading, isTrue);
    });
  });

  group('Inserting entries ', () {
    const itemName = 'New item';
    const headingName = 'New heading';

    // Helper function to create the expected data for a new item
    Map<String, dynamic> newItemJson(int primary, String secondary) => {
          'type': 'item',
          'name': itemName,
          'completed': false,
          'sortKey': {'primary': primary, 'secondary': secondary}
        };

    // Helper function to create the expected data for a new heading
    Map<String, dynamic> newHeaderJson(int primary, String secondary) => {
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

      verify(() => batch.set(newEntryDoc, newItemJson(0, ''))).called(1);
      verify(() => batch.commit()).called(1);
    });

    test(
        'WHEN inserting a heading into an empty list '
        'THEN it should have primary sort index of 0', () async {
      container.testListen(provider);
      await itemsController.addAndPump(MockQuerySnapshot([]));
      container.read(provider.notifier).addHeading(headingName, ChecklistAddPosition.start);

      verify(() => batch.set(newEntryDoc, newHeaderJson(0, ''))).called(1);
      verify(() => batch.commit()).called(1);
    });

    test(
        'WHEN inserting items at beginning of list '
        'THEN they should have a primary sort index one less than the first item', () async {
      final items = itemsSnapshot([sortKey(-4, 'abcd'), sortKey(-3, 'efgh')]);
      container.testListen(provider);
      await itemsController.addAndPump(items);
      container.read(provider.notifier).addItem(itemName, ChecklistAddPosition.start);

      verify(() => batch.set(newEntryDoc, newItemJson(-5, ''))).called(1);
      verify(() => batch.commit()).called(1);
    });

    test(
        'WHEN inserting headings at beginning of list '
        'THEN they should have a primary sort index one less than the first item', () async {
      final items = itemsSnapshot([sortKey(-4, 'abcd'), sortKey(-3, 'efgh')]);
      container.testListen(provider);
      await itemsController.addAndPump(items);
      container.read(provider.notifier).addHeading(headingName, ChecklistAddPosition.start);

      verify(() => batch.set(newEntryDoc, newHeaderJson(-5, ''))).called(1);
      verify(() => batch.commit()).called(1);
    });

    test(
        'WHEN inserting items at end of list '
        'THEN they should have a primary sort index one greater than the last item', () async {
      final items = itemsSnapshot([sortKey(4, 'abcd'), sortKey(5, 'efgh')]);
      container.testListen(provider);
      await itemsController.addAndPump(items);
      container.read(provider.notifier).addItem(itemName, ChecklistAddPosition.end);

      verify(() => batch.set(newEntryDoc, newItemJson(6, ''))).called(1);
      verify(() => batch.commit()).called(1);
    });

    test(
        'WHEN inserting headings at end of list '
        'THEN they should have a primary sort index one greater than the last item', () async {
      final items = itemsSnapshot([sortKey(4, 'abcd'), sortKey(5, 'efgh')]);
      container.testListen(provider);
      await itemsController.addAndPump(items);
      container.read(provider.notifier).addHeading(headingName, ChecklistAddPosition.end);

      verify(() => batch.set(newEntryDoc, newHeaderJson(6, ''))).called(1);
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

      verify(() => batch.set(newEntryDoc, newItemJson(3, ''))).called(1);
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

        verify(() => batch.set(newEntryDoc, newHeaderJson(3, ''))).called(1);
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

      verify(() => batch.set(newEntryDoc, newItemJson(2, '2222'))).called(1);
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

      verify(() => batch.set(newEntryDoc, newHeaderJson(2, '2222'))).called(1);
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

      verify(() => batch.update(entryDoc, {'sortKey': sortKeyJson(-4, '')})).called(1);
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

      verify(() => batch.update(entryDoc, {'sortKey': sortKeyJson(1, '')})).called(1);
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

      verify(() => batch.update(entryDoc, {'sortKey': sortKeyJson(2, '')})).called(1);
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

      verify(() => batch.update(entryDoc, {'sortKey': sortKeyJson(4, '2222')})).called(1);
    });
  });

  group('Handling duplicate sort keys ', () {
    late MockBatch batch;

    setUp(() {
      batch = MockBatch();
      when(() => mockFirestore.batch()).thenReturn(batch);
    });

    List<String> buildDocIds(int count) => List.generate(count, (index) => 'doc$index');

    List<MockDocumentReference> buildAndStubDocRefs(List<String> ids) => ids.map((id) {
          final ref = MockDocumentReference();
          when(() => itemsCollection.doc(id)).thenReturn(ref);
          when(() => mockFirestore.doc('lists/$listId/items/$id')).thenReturn(ref);
          return ref;
        }).toList();

    List<MockDocumentSnapshot> buildDuplicateSortKeyItems(List<String> ids, int primary, String secondary) =>
        ids.map((id) => itemSnapshot(id: id, primary: primary, secondary: secondary)).toList();

    // A mocktail argument matcher that matches an object which has a 'sortKey' property, which has
    // a value of an object with the given primary and secondary values.
    Map<String, dynamic> sortKeyJsonMatcher(int primary, String secondary) => any<Map<String, dynamic>>(
          that: containsPair('sortKey', {'primary': primary, 'secondary': secondary}),
        );

    test(
        'WHEN inserting an item between two entries with duplicate sort keys '
        'THEN all entries should be given unique sort keys that preserve the existing sort order', () async {
      final docIds = buildDocIds(4);
      final docRefs = buildAndStubDocRefs(docIds);
      final items = MockQuerySnapshot(buildDuplicateSortKeyItems(docIds, 1, 'abcd'));
      final newDocRef = MockDocumentReference();
      when(() => itemsCollection.doc()).thenReturn(newDocRef);

      container.testListen(provider);
      await itemsController.addAndPump(items);
      final entries = container.read(provider).requireValue;
      container.read(provider.notifier).addItemAfter('New item', entries[0]);

      // Expected sort keys taken from the UserSortable tests
      verify(() => batch.update(docRefs[0], {'sortKey': sortKeyJson(1, 'abcd-5zzz')}));
      verify(() => batch.set(newDocRef, sortKeyJsonMatcher(1, 'abcd-bzzy')));
      verify(() => batch.update(docRefs[1], {'sortKey': sortKeyJson(1, 'abcd-hzzx')}));
      verify(() => batch.update(docRefs[2], {'sortKey': sortKeyJson(1, 'abcd-nzzw')}));
      verify(() => batch.update(docRefs[3], {'sortKey': sortKeyJson(1, 'abcd-tzzv')}));
    });

    test(
        'WHEN inserting a heading between two entries with duplicate sort keys '
        'THEN all entries should be given unique sort keys that preserve the existing sort order', () async {
      final docIds = buildDocIds(4);
      final docRefs = buildAndStubDocRefs(docIds);
      final items = MockQuerySnapshot(buildDuplicateSortKeyItems(docIds, -1, ''));
      final newDocRef = MockDocumentReference();
      when(() => itemsCollection.doc()).thenReturn(newDocRef);

      container.testListen(provider);
      await itemsController.addAndPump(items);
      final entries = container.read(provider).requireValue;
      container.read(provider.notifier).addHeadingAfter('New heading', entries[2]);

      // Expected sort keys taken from the UserSortable tests
      verify(() => batch.update(docRefs[0], {'sortKey': sortKeyJson(-1, '5zzz')}));
      verify(() => batch.update(docRefs[1], {'sortKey': sortKeyJson(-1, 'bzzy')}));
      verify(() => batch.update(docRefs[2], {'sortKey': sortKeyJson(-1, 'hzzx')}));
      verify(() => batch.set(newDocRef, sortKeyJsonMatcher(-1, 'nzzw')));
      verify(() => batch.update(docRefs[3], {'sortKey': sortKeyJson(-1, 'tzzv')}));
    });

    test(
        'WHEN moving an item between entries with duplicate sort keys '
        'THEN all entries should be given unique sort keys that preserve the existing sort order', () async {
      final docIds = buildDocIds(4);
      final docRefs = buildAndStubDocRefs(docIds);
      const moveDocId = 'moveDoc';
      final items = MockQuerySnapshot([
        ...buildDuplicateSortKeyItems(docIds, 3, '1234'),
        itemSnapshot(id: moveDocId, primary: 12, secondary: ''),
      ]);
      final moveDocRef = MockDocumentReference();
      when(() => mockFirestore.doc('lists/$listId/items/$moveDocId')).thenReturn(moveDocRef);

      container.testListen(provider);
      await itemsController.addAndPump(items);
      final entries = container.read(provider).requireValue;
      container.read(provider.notifier).moveEntry(entries[4], 2);

      // Expected sort keys taken from the UserSortable tests
      verify(() => batch.update(docRefs[0], {'sortKey': sortKeyJson(3, '1234-5zzz')}));
      verify(() => batch.update(docRefs[1], {'sortKey': sortKeyJson(3, '1234-bzzy')}));
      verify(() => batch.update(moveDocRef, {'sortKey': sortKeyJson(3, '1234-hzzx')}));
      verify(() => batch.update(docRefs[2], {'sortKey': sortKeyJson(3, '1234-nzzw')}));
      verify(() => batch.update(docRefs[3], {'sortKey': sortKeyJson(3, '1234-tzzv')}));
    });
  });

  group('Batch operations ', () {
    late MockBatch batch;

    setUp(() {
      batch = MockBatch();
      when(() => mockFirestore.batch()).thenReturn(batch);
    });

    List<MockDocumentReference> buildAndStubDocRefs(List<MockDocumentSnapshot> docs) => docs.map((doc) {
          final ref = MockDocumentReference();
          final docId = doc.id;
          when(() => itemsCollection.doc(docId)).thenReturn(ref);
          when(() => mockFirestore.doc('lists/$listId/items/$docId')).thenReturn(ref);
          return ref;
        }).toList();

    test(
        'WHEN unchecking all items '
        'THEN all checked items should be unchecked', () async {
      final entries = [
        itemSnapshot(id: '1', primary: 1, completed: true),
        itemSnapshot(id: '2', primary: 2, completed: false),
        itemSnapshot(id: '3', primary: 3, completed: true),
        itemSnapshot(id: '4', primary: 4, completed: false),
        headingSnapshot(id: '5', primary: 5),
        itemSnapshot(id: '6', primary: 6, completed: true),
      ];
      final docRefs = buildAndStubDocRefs(entries);

      container.testListen(provider);
      await itemsController.addAndPump(MockQuerySnapshot(entries));
      container.read(provider.notifier).uncheckAll();

      // The batch should update only the checked items to be unchecked
      verify(() => batch.update(docRefs[0], {'completed': false})).called(1);
      verify(() => batch.update(docRefs[2], {'completed': false})).called(1);
      verify(() => batch.update(docRefs[5], {'completed': false})).called(1);
      verifyNever(() => batch.update(docRefs[1], any()));
      verifyNever(() => batch.update(docRefs[3], any()));
      verifyNever(() => batch.update(docRefs[4], any()));
    });

    test(
        'WHEN removing all checked items '
        'THEN checked items should be removed '
        'AND headings with no unchecked items should be removed', () async {
      final entries = [
        itemSnapshot(id: '1', primary: 1, completed: true),
        headingSnapshot(id: '2', primary: 2), // Only this heading should stay
        itemSnapshot(id: '3', primary: 3, completed: false), // This item should stay
        itemSnapshot(id: '4', primary: 4, completed: true),
        headingSnapshot(id: '5', primary: 5),
        itemSnapshot(id: '6', primary: 6, completed: true),
        itemSnapshot(id: '7', primary: 7, completed: true),
        headingSnapshot(id: '8', primary: 8),
        headingSnapshot(id: '9', primary: 9),
      ];
      final docRefs = buildAndStubDocRefs(entries);

      container.testListen(provider);
      await itemsController.addAndPump(MockQuerySnapshot(entries));
      container.read(provider.notifier).removeCheckedItems();

      // The batch should delete the checked items and headings with no unchecked items
      verify(() => batch.delete(docRefs[0])).called(1);
      verify(() => batch.delete(docRefs[3])).called(1);
      verify(() => batch.delete(docRefs[4])).called(1);
      verify(() => batch.delete(docRefs[5])).called(1);
      verify(() => batch.delete(docRefs[6])).called(1);
      verify(() => batch.delete(docRefs[7])).called(1);
      verify(() => batch.delete(docRefs[8])).called(1);
      verifyNever(() => batch.delete(docRefs[1]));
      verifyNever(() => batch.delete(docRefs[2]));
    });
  });
}
