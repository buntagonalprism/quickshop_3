import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quickshop/models/shopping/autocomplete/shopping_item_autocomplete.dart';
import 'package:quickshop/models/shopping/shopping_item.dart';
import 'package:quickshop/pages/lists/shopping/items/shopping_item_create_page.dart';
import 'package:quickshop/pages/lists/shopping/items/shopping_item_create_view_model.dart';
import 'package:quickshop/repositories/shopping/autocomplete/shopping_item_autocomplete_repo.dart';
import 'package:quickshop/repositories/shopping/shopping_items_repo.dart';
import 'package:quickshop/router.dart';
import 'package:quickshop/services/firebase_auth.dart';
import 'package:quickshop/services/shared_preferences.dart';

import '../../../fakes/fake_firebase_auth.dart';
import '../../../fakes/fake_shared_preferences.dart';

class MockItemAutocompleteRepo extends Mock implements ShoppingItemAutocompleteRepo {}

class MockRouter extends Mock implements GoRouter {}

void main() {
  final listId = 'test-list-id';

  late MockItemAutocompleteRepo itemAutocompleteRepo;
  late MockRouter router;
  late FakeSharedPreferences prefs;
  late FakeFirebaseAuth auth;
  late StreamController<List<ShoppingItem>> listItemsController;

  setUp(() {
    itemAutocompleteRepo = MockItemAutocompleteRepo();
    router = MockRouter();
    prefs = FakeSharedPreferences();
    auth = FakeFirebaseAuth(user: buildUser());
    listItemsController = StreamController<List<ShoppingItem>>.broadcast();
  });

  Future<void> pumpScreen(WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: ProviderScope(
        overrides: [
          shoppingItemAutocompleteRepoProvider(listId).overrideWithValue(itemAutocompleteRepo),
          routerProvider.overrideWithValue(router),
          sharedPrefsProvider.overrideWithValue(prefs),
          firebaseAuthProvider.overrideWithValue(auth),
          shoppingListItemsProvider(listId).overrideWith((_) => listItemsController.stream),
        ],
        child: ShoppingItemCreatePage(listId: listId),
      ),
    ));
  }

  group('Item name error handling', () {
    testWidgets(
        'GIVEN no item name is entered '
        'WHEN tapping done '
        'THEN show error', (WidgetTester tester) async {
      await pumpScreen(tester);
      await tester.tap(find.text('Done'));
      await tester.pump();
      expect(find.text(ShoppingItemCreateViewModel.itemError), findsOneWidget);
    });

    testWidgets(
        'GIVEN item error displayed after tapping done '
        'WHEN entering item name '
        'THEN error disappears', (WidgetTester tester) async {
      await pumpScreen(tester);
      await tester.tap(find.text('Done'));
      await tester.pump();
      expect(find.text(ShoppingItemCreateViewModel.itemError), findsOneWidget);
      await tester.enterText(find.byType(TextField), 'Test Item');
      await tester.pump();
      expect(find.text(ShoppingItemCreateViewModel.itemError), findsNothing);
    });

    testWidgets(
        'GIVEN no item name is entered '
        'WHEN tapping add more '
        'THEN show error', (WidgetTester tester) async {
      await pumpScreen(tester);
      await tester.tap(find.text('Add more'));
      await tester.pump();
      expect(find.text(ShoppingItemCreateViewModel.itemError), findsOneWidget);
    });

    testWidgets(
        'GIVEN item error displayed after tapping add more '
        'WHEN entering item name '
        'THEN error disappears', (WidgetTester tester) async {
      await pumpScreen(tester);
      await tester.tap(find.text('Add more'));
      await tester.pump();
      expect(find.text(ShoppingItemCreateViewModel.itemError), findsOneWidget);
      await tester.enterText(find.byType(TextField), 'Test Item');
      await tester.pump();
      expect(find.text(ShoppingItemCreateViewModel.itemError), findsNothing);
    });
  });

  group('Autocomplete item search results display', () {
    testWidgets(
        'GIVEN user has not yet entered any text '
        'THEN item create page instructions are shown', (WidgetTester tester) async {
      await pumpScreen(tester);
      expect(find.byType(ItemAutocompletePlaceholder), findsOneWidget);
    });

    testWidgets(
        'GIVEN user has entered text '
        'WHEN autocomplete items are loading '
        'THEN loading indicator is shown', (WidgetTester tester) async {
      await pumpScreen(tester);
      answerLoading(() => itemAutocompleteRepo.getAutocomplete(any()));
      await tester.enterText(find.byType(TextField), 'Milk');
      await tester.pump();
      expect(find.byType(ItemAutocompletePlaceholder), findsNothing);
      expect(find.byType(ItemAutocompleteLoading), findsOneWidget);
    });

    testWidgets(
        'GIVEN user has entered text '
        'WHEN there is an error loading autocomplete items '
        'THEN error view is shown', (WidgetTester tester) async {
      await pumpScreen(tester);
      await tester.enterText(find.byType(TextField), 'Milk');
      await tester.pumpAndSettle();
      expect(find.byType(ItemAutocompletePlaceholder), findsNothing);
      expect(find.byType(ItemAutocompleteError), findsOneWidget);
    });

    testWidgets(
        'GIVEN user has entered text '
        'WHEN there are no matching autocomplete items '
        'THEN empty results view shown', (WidgetTester tester) async {
      await pumpScreen(tester);
      answerEmptyList(() => itemAutocompleteRepo.getAutocomplete(any()));
      await tester.enterText(find.byType(TextField), 'No match');
      await tester.pumpAndSettle();
      expect(find.byType(ItemAutocompletePlaceholder), findsNothing);
      expect(find.byType(ItemAutocompleteEmpty), findsOneWidget);
    });

    testWidgets(
        'GIVEN user has entered text '
        'WHEN there are matching autocomplete items '
        'THEN results are shown', (WidgetTester tester) async {
      await pumpScreen(tester);

      answerValue(() => itemAutocompleteRepo.getAutocomplete('milk'), [
        buildItemAutocomplete('Skim Milk', 'Dairy'),
        buildItemAutocomplete('Full fat Milk', 'Dairy'),
        buildItemAutocomplete('Milk', 'Dairy'),
      ]);
      listItemsController.add([]);

      await tester.enterText(find.byType(TextField), 'Milk');
      await tester.pumpAndSettle();
      expect(find.byType(ItemAutocompletePlaceholder), findsNothing);
      expect(find.byType(ItemAutocompleteEntry), findsNWidgets(3));
      expect(findAutocompleteEntry('Milk'), findsOneWidget);
      expect(findAutocompleteEntry('Full fat Milk'), findsOneWidget);
      expect(findAutocompleteEntry('Skim Milk'), findsOneWidget);
    });
  });
}

Finder findAutocompleteEntry(String text) {
  return find.descendant(
    of: find.byType(ItemAutocompleteEntry),
    matching: find.text(text),
  );
}

ShoppingItemAutocomplete buildItemAutocomplete(
  String name,
  String categories, {
  String? quantity,
  ShoppingItemAutocompleteSource source = ShoppingItemAutocompleteSource.suggested,
}) {
  return ShoppingItemAutocomplete(
    source: source,
    sourceId: name.toLowerCase().replaceAll(' ', '-'),
    product: name,
    categories: categories.split(','),
    quantity: quantity ?? '',
  );
}

void answerLoading<T>(Future<T> Function() fn) {
  when(fn).thenAnswer((_) => Completer<T>().future);
}

void answerError<T>(Future<T> Function() fn, Object error) {
  when(fn).thenAnswer((_) => Future<T>.error(error));
}

void answerValue<T>(Future<T> Function() fn, T value) {
  when(fn).thenAnswer((_) => Future<T>.value(value));
}

void answerEmptyList<T>(Future<List<T>> Function() fn) {
  when(fn).thenAnswer((_) => Future<List<T>>.value(<T>[]));
}
