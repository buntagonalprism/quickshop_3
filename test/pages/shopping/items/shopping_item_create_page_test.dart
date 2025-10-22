import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quickshop/models/shopping/autocomplete/shopping_category_autocomplete.dart';
import 'package:quickshop/models/shopping/autocomplete/shopping_item_autocomplete.dart';
import 'package:quickshop/models/shopping/shopping_item.dart';
import 'package:quickshop/pages/lists/shopping/items/category_selector.dart';
import 'package:quickshop/pages/lists/shopping/items/shopping_item_create_page.dart';
import 'package:quickshop/pages/lists/shopping/items/shopping_item_create_view_model.dart';
import 'package:quickshop/repositories/shopping/autocomplete/shopping_category_autocomplete_repo.dart';
import 'package:quickshop/repositories/shopping/autocomplete/shopping_item_autocomplete_repo.dart';
import 'package:quickshop/repositories/shopping/shopping_items_repo.dart';
import 'package:quickshop/router.dart';
import 'package:quickshop/services/firebase_auth.dart';
import 'package:quickshop/services/shared_preferences.dart';

import '../../../fakes/fake_firebase_auth.dart';
import '../../../fakes/fake_shared_preferences.dart';
import '../../../utilities/answerer.dart';

class MockItemAutocompleteRepo extends Mock implements ShoppingItemAutocompleteRepo {}

class MockCategoryAutocompleteRepo extends Mock implements ShoppingCategoryAutocompleteRepo {}

class MockShoppingListItemsRepo extends Mock implements ShoppingListItemsRepo {}

class MockRouter extends Mock implements GoRouter {}

typedef _Keys = ShoppingItemCreatePageKeys;
typedef _Strings = ShoppingItemCreatePageStrings;

void main() {
  final listId = 'test-list-id';

  late MockItemAutocompleteRepo itemAutocompleteRepo;
  late MockCategoryAutocompleteRepo categoryAutocompleteRepo;

  late MockShoppingListItemsRepo itemsRepo;
  late MockRouter router;
  late FakeSharedPreferences prefs;
  late FakeFirebaseAuth auth;

  setUp(() {
    itemAutocompleteRepo = MockItemAutocompleteRepo();
    categoryAutocompleteRepo = MockCategoryAutocompleteRepo();
    itemsRepo = MockShoppingListItemsRepo();
    router = MockRouter();
    prefs = FakeSharedPreferences();
    auth = FakeFirebaseAuth(user: buildUser());
  });

  final doneButtonFinder = find.byKey(_Keys.doneButton);
  final addMoreButtonFinder = find.byKey(_Keys.addMoreButton);
  final itemInputFinder = find.byKey(_Keys.itemInputField);
  final categoryInputFieldFinder = find.descendant(of: find.byType(CategorySelector), matching: find.byType(TextField));

  Future<void> pumpScreen(WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: ProviderScope(
        overrides: [
          shoppingItemAutocompleteRepoProvider(listId).overrideWithValue(itemAutocompleteRepo),
          shoppingCategoryAutocompleteRepoProvider(listId).overrideWithValue(categoryAutocompleteRepo),
          shoppingListItemsRepoProvider(listId).overrideWithValue(itemsRepo),
          routerProvider.overrideWithValue(router),
          sharedPrefsProvider.overrideWithValue(prefs),
          firebaseAuthProvider.overrideWithValue(auth),
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
      await tester.tap(doneButtonFinder);
      await tester.pump();
      expect(find.text(ShoppingItemCreateViewModel.itemError), findsOneWidget);
    });

    testWidgets(
        'GIVEN item error displayed after tapping done '
        'WHEN entering item name '
        'THEN error disappears', (WidgetTester tester) async {
      await pumpScreen(tester);
      await tester.tap(doneButtonFinder);
      await tester.pump();
      expect(find.text(ShoppingItemCreateViewModel.itemError), findsOneWidget);
      await tester.enterText(itemInputFinder, 'Test Item');
      await tester.pump();
      expect(find.text(ShoppingItemCreateViewModel.itemError), findsNothing);
    });

    testWidgets(
        'GIVEN no item name is entered '
        'WHEN tapping add more '
        'THEN show error', (WidgetTester tester) async {
      await pumpScreen(tester);
      await tester.tap(addMoreButtonFinder);
      await tester.pump();
      expect(find.text(ShoppingItemCreateViewModel.itemError), findsOneWidget);
    });

    testWidgets(
        'GIVEN item error displayed after tapping add more '
        'WHEN entering item name '
        'THEN error disappears', (WidgetTester tester) async {
      await pumpScreen(tester);
      await tester.tap(addMoreButtonFinder);
      await tester.pump();
      expect(find.text(ShoppingItemCreateViewModel.itemError), findsOneWidget);
      await tester.enterText(itemInputFinder, 'Test Item');
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
      answer(() => itemAutocompleteRepo.getAutocomplete(any())).withLoading();
      await tester.enterText(itemInputFinder, 'Milk');
      await tester.pump();
      expect(find.byType(ItemAutocompletePlaceholder), findsNothing);
      expect(find.byType(ItemAutocompleteLoading), findsOneWidget);
    });

    testWidgets(
        'GIVEN user has entered text '
        'WHEN there is an error loading autocomplete items '
        'THEN error view is shown', (WidgetTester tester) async {
      await pumpScreen(tester);
      await tester.enterText(itemInputFinder, 'Milk');
      await tester.pumpAndSettle();
      expect(find.byType(ItemAutocompletePlaceholder), findsNothing);
      expect(find.byType(ItemAutocompleteError), findsOneWidget);
    });

    testWidgets(
        'GIVEN user has entered text '
        'WHEN there are no matching autocomplete items '
        'THEN empty results view shown', (WidgetTester tester) async {
      await pumpScreen(tester);
      answer(() => itemAutocompleteRepo.getAutocomplete(any())).withValue([]);
      await tester.enterText(itemInputFinder, 'No match');
      await tester.pumpAndSettle();
      expect(find.byType(ItemAutocompletePlaceholder), findsNothing);
      expect(find.byType(ItemAutocompleteEmpty), findsOneWidget);
    });

    testWidgets(
        'GIVEN user has entered text '
        'WHEN there are matching autocomplete items '
        'THEN results are shown', (WidgetTester tester) async {
      await pumpScreen(tester);

      answer(() => itemAutocompleteRepo.getAutocomplete('milk')).withValue([
        buildItemAutocomplete('Skim Milk', 'Dairy'),
        buildItemAutocomplete('Full fat Milk', 'Dairy'),
        buildItemAutocomplete('Milk', 'Dairy'),
      ]);

      await tester.enterText(itemInputFinder, 'Milk');
      await tester.pumpAndSettle();
      expect(find.byType(ItemAutocompletePlaceholder), findsNothing);
      expect(find.byType(ItemAutocompleteEntry), findsNWidgets(3));
      expect(find.itemAutocompleteEntry('Milk'), findsOneWidget);
      expect(find.itemAutocompleteEntry('Full fat Milk'), findsOneWidget);
      expect(find.itemAutocompleteEntry('Skim Milk'), findsOneWidget);
    });
  });

  group('Adding items from autocomplete suggestions', () {
    testWidgets(
        'GIVEN autocomplete items are shown '
        'WHEN tapping autocomplete item '
        'THEN item is added to list and screen popped', (WidgetTester tester) async {
      await pumpScreen(tester);

      final autocomplete = buildItemAutocomplete('Milk', 'Dairy');
      answer(() => itemAutocompleteRepo.getAutocomplete('milk')).withValue([autocomplete]);
      answer(() => itemsRepo.addAutocomplete(autocomplete)).withValue(buildShoppingItem('Milk', 'Dairy'));

      await tester.enterText(itemInputFinder, 'Milk');
      await tester.pumpAndSettle();

      await tester.tap(find.itemAutocompleteEntry('Milk'));
      await tester.pumpAndSettle();

      verify(() => itemsRepo.addAutocomplete(autocomplete)).called(1);
      verify(() => router.pop()).called(1);
      expect(find.text(_Strings.addedToList('Milk')), findsOneWidget);
    });

    testWidgets(
        'GIVEN autocomplete items are shown '
        'WHEN tapping plus button on autocomplete item '
        'THEN item is added to list and page is reset for next item', (WidgetTester tester) async {
      await pumpScreen(tester);

      final autocomplete = buildItemAutocomplete('Milk', 'Dairy');
      answer(() => itemAutocompleteRepo.getAutocomplete('milk')).withValue([autocomplete]);
      answer(() => itemsRepo.addAutocomplete(autocomplete)).withValue(buildShoppingItem('Milk', 'Dairy'));

      await tester.enterText(itemInputFinder, 'Milk');
      await tester.pumpAndSettle();

      await tester.tap(find.itemAutocompletePlusButton('Milk'));
      await tester.pumpAndSettle();

      verify(() => itemsRepo.addAutocomplete(autocomplete)).called(1);
      verifyNever(() => router.pop());
      expect(find.text(_Strings.addedToList('Milk')), findsOneWidget);
      expect(getTextFieldText(tester), isEmpty);
    });

    testWidgets(
        'GIVEN an exact match autocomplete item is shown '
        'WHEN tapping done button '
        'THEN exact match item is added to list and screen is popped', (WidgetTester tester) async {
      await pumpScreen(tester);

      final exactMatch = buildItemAutocomplete('Milk', 'Dairy');
      answer(() => itemAutocompleteRepo.getAutocomplete('milk')).withValue([
        exactMatch,
        buildItemAutocomplete('Skim Milk', 'Dairy'),
        buildItemAutocomplete('Full fat Milk', 'Dairy'),
      ]);
      answer(() => itemsRepo.addItemByName(exactMatch.displayName)).withValue(
        AddItemResult.success(buildShoppingItem('Milk', 'Dairy')),
      );

      await tester.enterText(itemInputFinder, exactMatch.displayName);
      await tester.pumpAndSettle();

      await tester.tap(doneButtonFinder);
      await tester.pumpAndSettle();

      verify(() => itemsRepo.addItemByName(exactMatch.displayName)).called(1);
      verify(() => router.pop()).called(1);
      expect(find.text(_Strings.addedToList('Milk')), findsOneWidget);
    });

    testWidgets(
        'GIVEN an exact match autocomplete item is shown '
        'WHEN tapping add more button '
        'THEN exact match item is added to list and screen is reset', (WidgetTester tester) async {
      await pumpScreen(tester);

      final exactMatch = buildItemAutocomplete('Milk', 'Dairy');
      answer(() => itemAutocompleteRepo.getAutocomplete('milk')).withValue([
        exactMatch,
        buildItemAutocomplete('Skim Milk', 'Dairy'),
        buildItemAutocomplete('Full fat Milk', 'Dairy'),
      ]);
      answer(() => itemsRepo.addItemByName(exactMatch.displayName))
          .withValue(AddItemResult.success(buildShoppingItem('Milk', 'Dairy')));

      await tester.enterText(itemInputFinder, exactMatch.displayName);
      await tester.pumpAndSettle();

      await tester.tap(addMoreButtonFinder);
      await tester.pumpAndSettle();

      verify(() => itemsRepo.addItemByName(exactMatch.displayName)).called(1);
      verifyNever(() => router.pop());
      expect(find.text(_Strings.addedToList('Milk')), findsOneWidget);
      expect(getTextFieldText(tester), isEmpty);
    });
  });

  group('Items already on list', () {
    testWidgets(
        'GIVEN item name exactly matches item already on list '
        'WHEN tapping done '
        'THEN already on list snackbar error is shown', (WidgetTester tester) async {
      await pumpScreen(tester);

      final autocomplete = buildItemAutocomplete('Milk', 'Dairy', source: ShoppingItemAutocompleteSource.list);
      answer(() => itemAutocompleteRepo.getAutocomplete('milk')).withValue([autocomplete]);
      answer(() => itemsRepo.addItemByName('Milk')).withValue(AddItemResult.alreadyOnList('Milk'));

      await tester.enterText(find.byType(TextField), 'Milk');
      await tester.pumpAndSettle();

      await tester.tap(doneButtonFinder);
      await tester.pumpAndSettle();

      expect(find.text(_Strings.itemOnList('Milk')), findsOneWidget);
    });

    testWidgets(
        'GIVEN item name exactly matches item already on list '
        'WHEN tapping add more '
        'THEN already on list snackbar error is shown', (WidgetTester tester) async {
      await pumpScreen(tester);

      final autocomplete = buildItemAutocomplete('Milk', 'Dairy', source: ShoppingItemAutocompleteSource.list);
      answer(() => itemAutocompleteRepo.getAutocomplete('milk')).withValue([autocomplete]);
      answer(() => itemsRepo.addItemByName('Milk')).withValue(AddItemResult.alreadyOnList('Milk'));

      await tester.enterText(find.byType(TextField), 'Milk');
      await tester.pumpAndSettle();

      await tester.tap(addMoreButtonFinder);
      await tester.pumpAndSettle();

      expect(find.text(_Strings.itemOnList('Milk')), findsOneWidget);
    });

    testWidgets(
        'GIVEN item name exactly matches item already on list '
        'WHEN tapping Edit button on item '
        'THEN opens item edit page', (WidgetTester tester) async {
      await pumpScreen(tester);

      final autocomplete = buildItemAutocomplete('Milk', 'Dairy', source: ShoppingItemAutocompleteSource.list);
      answer(() => itemAutocompleteRepo.getAutocomplete('milk')).withValue([autocomplete]);

      await tester.enterText(itemInputFinder, 'Milk');
      await tester.pumpAndSettle();

      await tester.tap(find.text('Edit'));
      await tester.pump();

      verify(() => router.go(Routes.shoppingListEditItem(listId, autocomplete.sourceId).path)).called(1);
    });
  });

  group('Category required for item', () {
    testWidgets(
        'GIVEN item name with no exact autocomplete match '
        'WHEN tapping done '
        'THEN category input view is shown', (WidgetTester tester) async {
      await pumpScreen(tester);

      answer(() => itemAutocompleteRepo.getAutocomplete('Unknown Item')).withValue([]);
      answer(() => itemsRepo.addItemByName('Unknown Item')).withValue(const AddItemResult.categoryRequired());

      await tester.enterText(itemInputFinder, 'Unknown Item');
      await tester.pumpAndSettle();

      await tester.tap(doneButtonFinder);
      await tester.pumpAndSettle();

      expect(find.byType(ShoppingItemCategorySelectView), findsOneWidget);
      expect(find.byType(ShoppingItemSearchView), findsNothing);
    });

    testWidgets(
        'GIVEN item name with no exact autocomplete match '
        'WHEN tapping add more '
        'THEN category input view is shown', (WidgetTester tester) async {
      await pumpScreen(tester);

      answer(() => itemAutocompleteRepo.getAutocomplete('Unknown Item')).withValue([]);
      answer(() => itemsRepo.addItemByName('Unknown Item')).withValue(const AddItemResult.categoryRequired());

      await tester.enterText(itemInputFinder, 'Unknown Item');
      await tester.pumpAndSettle();

      await tester.tap(addMoreButtonFinder);
      await tester.pumpAndSettle();

      expect(find.byType(ShoppingItemCategorySelectView), findsOneWidget);
      expect(find.byType(ShoppingItemSearchView), findsNothing);
    });
  });

  group('Category input view error handling', () {
    Future<void> proceedToCategoryView(WidgetTester tester) async {
      await pumpScreen(tester);

      answer(() => itemAutocompleteRepo.getAutocomplete('Unknown Item')).withValue([]);
      answer(() => itemsRepo.addItemByName('Unknown Item')).withValue(const AddItemResult.categoryRequired());

      await tester.enterText(itemInputFinder, 'Unknown Item');
      await tester.pumpAndSettle();

      await tester.tap(doneButtonFinder);
      await tester.pumpAndSettle();

      expect(find.byType(ShoppingItemCategorySelectView), findsOneWidget);
    }

    testWidgets(
        'GIVEN category input view is shown '
        'WHEN tapping done without inputting a category '
        'THEN show error', (WidgetTester tester) async {
      await proceedToCategoryView(tester);

      await tester.tap(doneButtonFinder);
      await tester.pumpAndSettle();

      expect(find.text(_Strings.categoryRequired), findsOneWidget);
    });

    testWidgets(
        'GIVEN category input view is shown '
        'WHEN tapping add more without inputting a category '
        'THEN show error', (WidgetTester tester) async {
      await proceedToCategoryView(tester);

      await tester.tap(addMoreButtonFinder);
      await tester.pumpAndSettle();

      expect(find.text(_Strings.categoryRequired), findsOneWidget);
    });

    testWidgets(
        'GIVEN category input error is shown '
        'WHEN entering a category '
        'THEN error is removed', (WidgetTester tester) async {
      await proceedToCategoryView(tester);

      await tester.tap(addMoreButtonFinder);
      await tester.pumpAndSettle();

      expect(find.text(_Strings.categoryRequired), findsOneWidget);

      answer(() => categoryAutocompleteRepo.getAutocomplete('Dairy')).withValue([buildCategoryAutocomplete('Dairy')]);
      await tester.enterText(categoryInputFieldFinder, 'Dairy');
      await tester.pumpAndSettle();

      await tester.tap(find.categoryAutocompleteEntry('Dairy'));
      await tester.pumpAndSettle();

      expect(find.text(_Strings.categoryRequired), findsNothing);

      await tester.tap(find.selectedCategoryRemoveButton('Dairy'));
      await tester.pumpAndSettle();

      expect(find.text(_Strings.categoryRequired), findsOneWidget);
    });
  });
}

extension _FinderExtensions on CommonFinders {
  Finder itemAutocompleteEntry(String text) {
    return find.descendant(
      of: find.byType(ItemAutocompleteEntry),
      matching: find.text(text),
    );
  }

  Finder itemAutocompletePlusButton(String text) {
    return find.descendant(
      of: find.ancestor(
        of: find.text(text),
        matching: find.byType(ItemAutocompleteEntry),
      ),
      matching: find.byIcon(Icons.add),
    );
  }

  Finder categoryAutocompleteEntry(String text) {
    return find.descendant(
      of: find.byType(CategoryAutocompleteTile),
      matching: find.text(text),
    );
  }

  Finder selectedCategoryRemoveButton(String text) {
    return find.descendant(
      of: find.ancestor(
        of: find.text(text),
        matching: find.byType(Chip),
      ),
      matching: find.byIcon(Icons.cancel),
    );
  }
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

ShoppingCategoryAutocomplete buildCategoryAutocomplete(
  String name, {
  ShoppingCategoryAutocompleteSource source = ShoppingCategoryAutocompleteSource.suggested,
}) {
  return ShoppingCategoryAutocomplete(
    source: source,
    sourceId: name.toLowerCase().replaceAll(' ', '-'),
    name: name,
  );
}

ShoppingItem buildShoppingItem(
  String name,
  String categories, {
  String? quantity,
}) {
  final id = name.toLowerCase().replaceAll(' ', '-');
  return ShoppingItem(
    id: id,
    path: 'lists/test-list-id/items/$id',
    product: name,
    quantity: quantity ?? '',
    categories: categories.split(','),
    addedByUserId: 'test-user-id',
    lastModifiedByUserId: 'test-user-id',
    lastModifiedAt: DateTime.now(),
    completed: false,
  );
}

String? getTextFieldText(WidgetTester tester, [Finder? textFieldFinder]) {
  final textField = tester.widget<TextField>(textFieldFinder ?? find.byType(TextField));
  return textField.controller?.text;
}
