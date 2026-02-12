import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quickshop/data/firestore_transaction.dart';
import 'package:quickshop/data/lists/application/lists_notifier.dart';
import 'package:quickshop/data/lists/models/list_summary.dart';
import 'package:quickshop/data/lists/repositories/list_repo.dart';
import 'package:quickshop/data/settings/application/tutorials_notifier.dart';
import 'package:quickshop/data/shopping/autocomplete/application/shopping_category_autocomplete_use_case.dart';
import 'package:quickshop/data/shopping/autocomplete/application/shopping_item_autocomplete_use_case.dart';
import 'package:quickshop/data/shopping/autocomplete/models/shopping_category_autocomplete.dart';
import 'package:quickshop/data/shopping/autocomplete/models/shopping_item_autocomplete.dart';
import 'package:quickshop/data/shopping/items/models/shopping_item.dart';
import 'package:quickshop/data/shopping/items/models/shopping_item_raw_data.dart';
import 'package:quickshop/data/shopping/items/repositories/shopping_items_repo.dart';
import 'package:quickshop/data/user/models/user_profile.dart';
import 'package:quickshop/data/user/repositories/user_profile_repo.dart';
import 'package:quickshop/pages/lists/shopping/items/category_selector.dart';
import 'package:quickshop/pages/lists/shopping/items/models/shopping_item_errors.dart';
import 'package:quickshop/pages/lists/shopping/items/shopping_item_create_page.dart';
import 'package:quickshop/pages/lists/shopping/items/shopping_item_create_view_model.dart';
import 'package:quickshop/pages/lists/shopping/items/shopping_item_view.dart';
import 'package:quickshop/router.dart';
import 'package:quickshop/services/firebase_auth.dart';
import 'package:quickshop/services/shared_preferences.dart';

import '../../../fakes/fake_firebase_auth.dart';
import '../../../fakes/fake_list_items_transaction.dart';
import '../../../fakes/fake_shared_preferences.dart';
import '../../../utilities/answerer.dart';

class MockItemAutocompleteRepo extends Mock implements ShoppingItemAutocompleteUseCase {}

class MockCategoryAutocompleteRepo extends Mock implements ShoppingCategoryAutocompleteUseCase {}

class MockShoppingListItemsRepo extends Mock implements ShoppingListItemsRepo {}

class MockUserProfileRepo extends Mock implements UserProfileRepo {}

class MockListRepo extends Mock implements ListRepo {}

class MockRouter extends Mock implements GoRouter {}

typedef _Keys = ShoppingItemCreatePageKeys;
typedef _Strings = ShoppingItemCreatePageStrings;

void main() {
  registerFallbackValue(FakeListItemsTransaction());
  registerFallbackValue(buildItemRawData(p: '', q: '', c: ''));

  final listId = 'test-list-id';
  final list = ListSummary(
    id: listId,
    name: 'TestList',
    ownerId: 'user123',
    editorIds: [],
    editors: [],
    itemCount: 0,
    lastModified: {'user123': DateTime.now().millisecondsSinceEpoch},
    listType: ListType.shoppingList,
  );

  late MockItemAutocompleteRepo itemAutocompleteRepo;
  late MockCategoryAutocompleteRepo categoryAutocompleteRepo;
  late MockShoppingListItemsRepo itemsRepo;
  late MockListRepo listRepo;
  late MockUserProfileRepo userProfileRepo;
  late MockRouter router;
  late FakeSharedPreferences prefs;
  late FakeFirebaseAuth auth;

  setUp(() {
    itemAutocompleteRepo = MockItemAutocompleteRepo();
    categoryAutocompleteRepo = MockCategoryAutocompleteRepo();
    itemsRepo = MockShoppingListItemsRepo();
    when(() => itemsRepo.itemsStream).thenAnswer((_) => const Stream.empty());
    listRepo = MockListRepo();
    when(() => listRepo.getAllLists()).thenAnswer((_) => Stream.value([list]));
    userProfileRepo = MockUserProfileRepo();
    when(() => userProfileRepo.getProfile()).thenAnswer((_) => Stream.value(UserProfile(userId: 'test-user-id')));
    when(() => userProfileRepo.setTutorialCompleted(any())).thenAnswer((_) => Future.value());
    router = MockRouter();
    prefs = FakeSharedPreferences();
    auth = FakeFirebaseAuth(user: buildUser());
  });

  final doneButtonFinder = find.byKey(_Keys.doneButton);
  final addMoreButtonFinder = find.byKey(_Keys.addMoreButton);
  final itemInputFinder = find.byKey(_Keys.itemInputField);
  final categoryInputFieldFinder = find.descendant(of: find.byType(CategorySelector), matching: find.byType(TextField));

  Future<void> pumpScreen(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ProviderScope(
          overrides: [
            shoppingItemAutocompleteUseCaseProvider(listId).overrideWithValue(itemAutocompleteRepo),
            shoppingCategoryAutocompleteUseCaseProvider(listId).overrideWithValue(categoryAutocompleteRepo),
            shoppingListItemsRepoProvider(listId).overrideWithValue(itemsRepo),
            listRepoProvider.overrideWithValue(listRepo),
            routerProvider.overrideWithValue(router),
            sharedPrefsProvider.overrideWithValue(prefs),
            firebaseAuthProvider.overrideWithValue(auth),
            userProfileRepoProvider.overrideWithValue(userProfileRepo),
            firestoreTransactionProvider.overrideWithValue(() => FakeListItemsTransaction()),
          ],
          child: Consumer(
            builder: (context, ref, _) {
              // Adding a shopping item triggers a side effect of updating the list item
              // count via the lists notifier. We need to ensure the lists notifier is in a
              // valid state (i.e. has loaded the lists) to avoid state errors.
              ref.watch(listsProvider);

              // The user profile is used to determine whether to show the category selection
              // tutorial, so likewise we need to ensure this provider is eagerly loaded (like
              // it is in the real app by the _EagerInitProviders widget).
              ref.watch(userProfileProvider);
              return ShoppingItemCreatePage(listId: listId);
            },
          ),
        ),
      ),
    );
  }

  Future<void> proceedToCategoryView(WidgetTester tester, String itemName) async {
    await pumpScreen(tester);

    answer(() => itemAutocompleteRepo.getAutocomplete(itemName.toLowerCase())).withValue([]);

    await tester.enterText(itemInputFinder, itemName);
    await tester.pumpAndSettle();

    await tester.tap(doneButtonFinder);
    await tester.pumpAndSettle();

    expect(find.byType(ShoppingItemCategorySelectView), findsOneWidget);
  }

  Future<void> inputCategory(WidgetTester tester, String categoryName) async {
    when(() => categoryAutocompleteRepo.getAutocomplete(any())).thenAnswer((_) {
      return Future.value([buildCategoryAutocomplete(categoryName)]);
    });
    await tester.enterText(categoryInputFieldFinder, categoryName);
    await tester.pumpAndSettle();
  }

  Future<void> selectCategory(WidgetTester tester, String categoryName, {bool addMore = false}) async {
    await inputCategory(tester, categoryName);

    final tapTarget = addMore
        ? find.categoryAutocompletePlusButton(categoryName)
        : find.categoryAutocompleteEntry(categoryName);
    await tester.tap(tapTarget);
    await tester.pumpAndSettle();
  }

  group('Item name error handling', () {
    testWidgets('GIVEN no item name is entered '
        'WHEN tapping done '
        'THEN show error', (WidgetTester tester) async {
      await pumpScreen(tester);
      await tester.tap(doneButtonFinder);
      await tester.pump();
      expect(find.text(ShoppingItemCreateViewModel.itemError), findsOneWidget);
    });

    testWidgets('GIVEN item error displayed after tapping done '
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

    testWidgets('GIVEN no item name is entered '
        'WHEN tapping add more '
        'THEN show error', (WidgetTester tester) async {
      await pumpScreen(tester);
      await tester.tap(addMoreButtonFinder);
      await tester.pump();
      expect(find.text(ShoppingItemCreateViewModel.itemError), findsOneWidget);
    });

    testWidgets('GIVEN item error displayed after tapping add more '
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
    testWidgets('GIVEN user has not yet entered any text '
        'THEN item create page instructions are shown', (WidgetTester tester) async {
      await pumpScreen(tester);
      expect(find.byType(ItemAutocompletePlaceholder), findsOneWidget);
    });

    testWidgets('GIVEN user has entered text '
        'WHEN autocomplete items are loading '
        'THEN loading indicator is shown', (WidgetTester tester) async {
      await pumpScreen(tester);
      answer(() => itemAutocompleteRepo.getAutocomplete(any())).withLoading();
      await tester.enterText(itemInputFinder, 'Milk');
      await tester.pump();
      expect(find.byType(ItemAutocompletePlaceholder), findsNothing);
      expect(find.byType(ItemAutocompleteLoading), findsOneWidget);
    });

    testWidgets('GIVEN user has entered text '
        'WHEN there is an error loading autocomplete items '
        'THEN error view is shown', (WidgetTester tester) async {
      await pumpScreen(tester);
      await tester.enterText(itemInputFinder, 'Milk');
      await tester.pumpAndSettle();
      expect(find.byType(ItemAutocompletePlaceholder), findsNothing);
      expect(find.byType(ItemAutocompleteError), findsOneWidget);
    });

    testWidgets('GIVEN user has entered text '
        'WHEN there are no matching autocomplete items '
        'THEN empty results view shown', (WidgetTester tester) async {
      await pumpScreen(tester);
      answer(() => itemAutocompleteRepo.getAutocomplete(any())).withValue([]);
      await tester.enterText(itemInputFinder, 'No match');
      await tester.pumpAndSettle();
      expect(find.byType(ItemAutocompletePlaceholder), findsNothing);
      expect(find.byType(ItemAutocompleteEmpty), findsOneWidget);
    });

    testWidgets('GIVEN user has entered text '
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
    testWidgets('GIVEN autocomplete items are shown '
        'WHEN tapping autocomplete item '
        'THEN item is added to list and screen popped', (WidgetTester tester) async {
      await pumpScreen(tester);

      final autocomplete = buildItemAutocomplete('Milk', 'Dairy');
      answer(() => itemAutocompleteRepo.getAutocomplete('milk')).withValue([autocomplete]);
      ShoppingItem addFn() => itemsRepo.addItem(any(), buildItemRawData(p: 'Milk', q: '', c: 'Dairy'));
      when(addFn).thenReturn(buildShoppingItem('Milk', 'Dairy'));

      await tester.enterText(itemInputFinder, 'Milk');
      await tester.pumpAndSettle();

      await tester.tap(find.itemAutocompleteEntry('Milk'));
      await tester.pumpAndSettle();

      verify(addFn).called(1);
      verify(() => router.pop()).called(1);
      expect(find.text(_Strings.addedToList('Milk')), findsOneWidget);
    });

    testWidgets('GIVEN autocomplete items are shown '
        'WHEN tapping plus button on autocomplete item '
        'THEN item is added to list and page is reset for next item', (WidgetTester tester) async {
      await pumpScreen(tester);

      final autocomplete = buildItemAutocomplete('Milk', 'Dairy');
      answer(() => itemAutocompleteRepo.getAutocomplete('milk')).withValue([autocomplete]);
      ShoppingItem addFn() => itemsRepo.addItem(any(), buildItemRawData(p: 'Milk', q: '', c: 'Dairy'));
      when(addFn).thenReturn(buildShoppingItem('Milk', 'Dairy'));

      await tester.enterText(itemInputFinder, 'Milk');
      await tester.pumpAndSettle();

      await tester.tap(find.itemAutocompletePlusButton('Milk'));
      await tester.pumpAndSettle();

      verify(addFn).called(1);
      verifyNever(() => router.pop());
      expect(find.text(_Strings.addedToList('Milk')), findsOneWidget);
      expect(getTextFieldText(tester), isEmpty);
    });

    testWidgets('GIVEN an exact match autocomplete item is shown '
        'WHEN tapping done button '
        'THEN exact match item is added to list and screen is popped', (WidgetTester tester) async {
      await pumpScreen(tester);

      final exactMatch = buildItemAutocomplete('Milk', 'Dairy');
      answer(() => itemAutocompleteRepo.getAutocomplete('milk')).withValue([
        exactMatch,
        buildItemAutocomplete('Skim Milk', 'Dairy'),
        buildItemAutocomplete('Full fat Milk', 'Dairy'),
      ]);
      ShoppingItem addFn() => itemsRepo.addItem(any(), buildItemRawData(p: 'Milk', q: '', c: 'Dairy'));
      when(addFn).thenReturn(buildShoppingItem('Milk', 'Dairy'));

      await tester.enterText(itemInputFinder, exactMatch.displayName);
      await tester.pumpAndSettle();

      await tester.tap(doneButtonFinder);
      await tester.pumpAndSettle();

      verify(addFn).called(1);
      verify(() => router.pop()).called(1);
      expect(find.text(_Strings.addedToList('Milk')), findsOneWidget);
    });

    testWidgets('GIVEN an exact match autocomplete item is shown '
        'WHEN tapping add more button '
        'THEN exact match item is added to list and screen is reset', (WidgetTester tester) async {
      await pumpScreen(tester);

      final exactMatch = buildItemAutocomplete('Milk', 'Dairy');
      answer(() => itemAutocompleteRepo.getAutocomplete('milk')).withValue([
        exactMatch,
        buildItemAutocomplete('Skim Milk', 'Dairy'),
        buildItemAutocomplete('Full fat Milk', 'Dairy'),
      ]);
      ShoppingItem addFn() => itemsRepo.addItem(any(), buildItemRawData(p: exactMatch.displayName, q: '', c: 'Dairy'));
      when(addFn).thenReturn(buildShoppingItem('Milk', 'Dairy'));

      await tester.enterText(itemInputFinder, exactMatch.displayName);
      await tester.pumpAndSettle();

      await tester.tap(addMoreButtonFinder);
      await tester.pumpAndSettle();

      verify(addFn).called(1);
      verifyNever(() => router.pop());
      expect(find.text(_Strings.addedToList('Milk')), findsOneWidget);
      expect(getTextFieldText(tester), isEmpty);
    });
  });

  group('Items already on list', () {
    testWidgets('GIVEN item name exactly matches item already on list '
        'WHEN tapping done '
        'THEN already on list snackbar error is shown', (WidgetTester tester) async {
      await pumpScreen(tester);

      final autocomplete = buildItemAutocomplete('Milk', 'Dairy', source: ShoppingItemAutocompleteSource.list);
      answer(() => itemAutocompleteRepo.getAutocomplete('milk')).withValue([autocomplete]);

      await tester.enterText(find.byType(TextField), 'Milk');
      await tester.pumpAndSettle();

      await tester.tap(doneButtonFinder);
      await tester.pumpAndSettle();

      expect(find.text(_Strings.itemOnList('Milk')), findsOneWidget);
    });

    testWidgets('GIVEN item name exactly matches item already on list '
        'WHEN tapping add more '
        'THEN already on list snackbar error is shown', (WidgetTester tester) async {
      await pumpScreen(tester);

      final autocomplete = buildItemAutocomplete('Milk', 'Dairy', source: ShoppingItemAutocompleteSource.list);
      answer(() => itemAutocompleteRepo.getAutocomplete('milk')).withValue([autocomplete]);

      await tester.enterText(find.byType(TextField), 'Milk');
      await tester.pumpAndSettle();

      await tester.tap(addMoreButtonFinder);
      await tester.pumpAndSettle();

      expect(find.text(_Strings.itemOnList('Milk')), findsOneWidget);
    });

    testWidgets('GIVEN item name exactly matches item already on list '
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
    testWidgets('GIVEN item name with no exact autocomplete match '
        'WHEN tapping done '
        'THEN category input view is shown', (WidgetTester tester) async {
      await pumpScreen(tester);

      answer(() => itemAutocompleteRepo.getAutocomplete('unknown item')).withValue([]);

      await tester.enterText(itemInputFinder, 'Unknown Item');
      await tester.pumpAndSettle();

      await tester.tap(doneButtonFinder);
      await tester.pumpAndSettle();

      expect(find.byType(ShoppingItemCategorySelectView), findsOneWidget);
      expect(find.byType(ShoppingItemSearchView), findsNothing);
    });

    testWidgets('GIVEN item name with no exact autocomplete match '
        'WHEN tapping add more '
        'THEN category input view is shown', (WidgetTester tester) async {
      await pumpScreen(tester);

      answer(() => itemAutocompleteRepo.getAutocomplete('unknown item')).withValue([]);

      await tester.enterText(itemInputFinder, 'Unknown Item');
      await tester.pumpAndSettle();

      await tester.tap(addMoreButtonFinder);
      await tester.pumpAndSettle();

      expect(find.byType(ShoppingItemCategorySelectView), findsOneWidget);
      expect(find.byType(ShoppingItemSearchView), findsNothing);
    });
  });

  group('Category input tutorial', () {
    final tutorialName = Tutorial.categorySelection.name;

    testWidgets('GIVEN category input tutorial has not been seen before '
        'THEN the tutorial is shown when opening category input page', (WidgetTester tester) async {
      final userWithoutTutorial = UserProfile(userId: 'test-user-id', completedTutorials: []);
      when(() => userProfileRepo.getProfile()).thenAnswer((_) => Stream.value(userWithoutTutorial));
      await proceedToCategoryView(tester, 'milk');
      expect(find.text(CategorySelector.tooltipTitle), findsOneWidget);
      expect(find.text(CategorySelector.tooltipMessage), findsOneWidget);
      await tester.tap(find.text('OK'));
      verify(() => userProfileRepo.setTutorialCompleted(tutorialName)).called(1);
    });

    testWidgets('GIVEN category input tutorial has been seen before '
        'THEN the tutorial is not shown when opening category input page', (WidgetTester tester) async {
      final userWithTutorial = UserProfile(userId: 'test-user-id', completedTutorials: [tutorialName]);
      when(() => userProfileRepo.getProfile()).thenAnswer((_) => Stream.value(userWithTutorial));
      await proceedToCategoryView(tester, 'milk');
      expect(find.text(CategorySelector.tooltipTitle), findsNothing);
      expect(find.text(CategorySelector.tooltipMessage), findsNothing);
      verifyNever(() => userProfileRepo.setTutorialCompleted(tutorialName));
    });
  });

  group('Category input view error handling', () {
    final userWithTutorial = UserProfile(userId: 'test-user-id', completedTutorials: [Tutorial.categorySelection.name]);
    setUp(() {
      when(() => userProfileRepo.getProfile()).thenAnswer((_) => Stream.value(userWithTutorial));
    });

    Future<void> proceedToCategoryView(WidgetTester tester) async {
      await pumpScreen(tester);

      answer(() => itemAutocompleteRepo.getAutocomplete('unknown item')).withValue([]);

      await tester.enterText(itemInputFinder, 'Unknown Item');
      await tester.pumpAndSettle();

      await tester.tap(doneButtonFinder);
      await tester.pumpAndSettle();

      expect(find.byType(ShoppingItemCategorySelectView), findsOneWidget);
    }

    testWidgets('GIVEN category input view is shown '
        'WHEN tapping done without inputting a category '
        'THEN show error', (WidgetTester tester) async {
      await proceedToCategoryView(tester);

      await tester.tap(doneButtonFinder);
      await tester.pumpAndSettle();

      expect(find.text(_Strings.categoryRequired), findsOneWidget);
    });

    testWidgets('GIVEN category input view is shown '
        'WHEN tapping add more without inputting a category '
        'THEN show error', (WidgetTester tester) async {
      await proceedToCategoryView(tester);

      await tester.tap(addMoreButtonFinder);
      await tester.pumpAndSettle();

      expect(find.text(_Strings.categoryRequired), findsOneWidget);
    });

    testWidgets('GIVEN category input error is shown '
        'WHEN entering a category '
        'THEN error is removed', (WidgetTester tester) async {
      await proceedToCategoryView(tester);

      await tester.tap(addMoreButtonFinder);
      await tester.pumpAndSettle();

      expect(find.text(_Strings.categoryRequired), findsOneWidget);

      // Enter text to remove error
      final categoryName = 'Dairy';
      await inputCategory(tester, categoryName);
      expect(find.text(_Strings.categoryRequired), findsNothing);

      // Clear text to show error again
      await tester.enterText(categoryInputFieldFinder, '');
      await tester.pumpAndSettle();

      expect(find.text(_Strings.categoryRequired), findsOneWidget);
    });
  });

  group('Adding items after setting category ', () {
    final itemName = 'Unknown Item';
    final categoryName = 'My new category';

    final userWithTutorial = UserProfile(userId: 'test-user-id', completedTutorials: [Tutorial.categorySelection.name]);
    setUp(() {
      when(() => userProfileRepo.getProfile()).thenAnswer((_) => Stream.value(userWithTutorial));
    });

    ShoppingItem addItemFn() => itemsRepo.addItem(any(), buildItemRawData(p: itemName, q: '', c: categoryName));

    testWidgets('GIVEN category has been input in category view '
        'WHEN add more is tapped '
        'THEN item is added and item search screen shown', (WidgetTester tester) async {
      await proceedToCategoryView(tester, itemName);

      when(addItemFn).thenReturn(buildShoppingItem(itemName, categoryName));

      await inputCategory(tester, categoryName);

      await tester.tap(addMoreButtonFinder);
      await tester.pumpAndSettle();

      verify(addItemFn).called(1);
      verifyNever(() => router.pop());
      expect(find.text(_Strings.addedToList(itemName)), findsOneWidget);
      expect(find.byType(ShoppingItemSearchView), findsOneWidget);
      expect(getTextFieldText(tester, itemInputFinder), isEmpty);
    });

    testWidgets('GIVEN category has been input in category view '
        'WHEN done is tapped '
        'THEN item is added and screen is popped', (WidgetTester tester) async {
      await proceedToCategoryView(tester, itemName);

      await inputCategory(tester, categoryName);

      when(addItemFn).thenReturn(buildShoppingItem(itemName, categoryName));

      await tester.tap(doneButtonFinder);
      await tester.pumpAndSettle();

      verify(() => router.pop()).called(1);
      verify(addItemFn).called(1);
      expect(find.text(_Strings.addedToList(itemName)), findsOneWidget);
    });

    testWidgets('GIVEN category suggestion results shown '
        'WHEN category suggestion is tapped '
        'THEN item is added and screen is popped', (WidgetTester tester) async {
      await proceedToCategoryView(tester, itemName);

      when(addItemFn).thenReturn(buildShoppingItem(itemName, categoryName));

      await selectCategory(tester, categoryName);

      verify(() => router.pop()).called(1);
      verify(addItemFn).called(1);
      expect(find.text(_Strings.addedToList(itemName)), findsOneWidget);
    });

    testWidgets('GIVEN category suggestion results shown '
        'WHEN category suggestion add more button is tapped '
        'THEN item is added and screen is popped', (WidgetTester tester) async {
      await proceedToCategoryView(tester, itemName);

      when(addItemFn).thenReturn(buildShoppingItem(itemName, categoryName));

      await selectCategory(tester, categoryName, addMore: true);

      verifyNever(() => router.pop());
      verify(addItemFn).called(1);
      expect(find.text(_Strings.addedToList(itemName)), findsOneWidget);

      expect(find.byType(ShoppingItemSearchView), findsOneWidget);
      expect(getTextFieldText(tester, itemInputFinder), isEmpty);
    });
  });

  group('Full item edit view ', () {
    final itemName = 'Unknown Item';
    final categoryName = 'My category';

    final keys = ShoppingItemView.keys;
    final errors = ShoppingItemErrors.messages;

    final userWithTutorial = UserProfile(userId: 'test-user-id', completedTutorials: [Tutorial.categorySelection.name]);
    setUp(() {
      when(() => userProfileRepo.getProfile()).thenAnswer((_) => Stream.value(userWithTutorial));
    });

    Future<void> proceedToItemEditView(WidgetTester tester, String itemName) async {
      await proceedToCategoryView(tester, itemName);

      await tester.tap(find.byKey(_Keys.editProductButton));
      await tester.pumpAndSettle();
    }

    void verifyItemNotAdded() {
      verifyNever(() => router.pop());
      verifyNever(() => itemsRepo.addItem(any(), any()));
      expect(find.byType(ShoppingItemSearchView), findsNothing);
    }

    void setupAddItemAnswer() {
      when(
        () => itemsRepo.addItem(any(), buildItemRawData(p: itemName, q: '', c: categoryName)),
      ).thenReturn(buildShoppingItem(itemName, categoryName));
    }

    testWidgets('GIVEN item category input view '
        'WHEN tapping edit product button '
        'THEN item edit view shown', (WidgetTester tester) async {
      await proceedToItemEditView(tester, itemName);

      expect(find.byType(ShoppingItemView), findsOneWidget);
    });

    testWidgets('GIVEN invalid input on item edit view '
        'WHEN tapping done '
        'THEN validation errors shown', (WidgetTester tester) async {
      await proceedToItemEditView(tester, itemName);

      await tester.enterText(find.byKey(keys.productInput), '');

      await tester.tap(doneButtonFinder);
      await tester.pumpAndSettle();

      expect(find.text(errors.productNameMissing), findsOneWidget);
      expect(find.text(errors.categoryMissing), findsOneWidget);

      await tester.enterText(find.byKey(keys.productInput), itemName);
      await selectCategory(tester, categoryName);

      expect(find.text(errors.productNameMissing), findsNothing);
      expect(find.text(errors.categoryMissing), findsNothing);

      verifyItemNotAdded();
    });

    testWidgets('GIVEN invalid input on item edit view '
        'WHEN tapping add more '
        'THEN validation errors shown', (WidgetTester tester) async {
      await proceedToItemEditView(tester, itemName);

      await tester.enterText(find.byKey(keys.productInput), '');

      await tester.tap(addMoreButtonFinder);
      await tester.pumpAndSettle();

      expect(find.text(errors.productNameMissing), findsOneWidget);
      expect(find.text(errors.categoryMissing), findsOneWidget);

      await tester.enterText(find.byKey(keys.productInput), itemName);
      await selectCategory(tester, categoryName);

      expect(find.text(errors.productNameMissing), findsNothing);
      expect(find.text(errors.categoryMissing), findsNothing);

      verifyItemNotAdded();
    });

    testWidgets('GIVEN valid data on item edit view '
        'WHEN tapping done '
        'THEN item is added and screen popped', (WidgetTester tester) async {
      await proceedToItemEditView(tester, itemName);
      await tester.enterText(find.byKey(keys.productInput), itemName);
      await selectCategory(tester, categoryName);
      setupAddItemAnswer();

      await tester.tap(doneButtonFinder);
      await tester.pumpAndSettle();

      verify(() => itemsRepo.addItem(any(), buildItemRawData(p: itemName, q: '', c: categoryName))).called(1);
      verify(() => router.pop()).called(1);
      expect(find.text(_Strings.addedToList(itemName)), findsOneWidget);
    });

    testWidgets('GIVEN valid data on item edit view '
        'WHEN tapping add more '
        'THEN item is added and screen reset to item search view', (WidgetTester tester) async {
      await proceedToItemEditView(tester, itemName);
      await tester.enterText(find.byKey(keys.productInput), itemName);
      await selectCategory(tester, categoryName);
      setupAddItemAnswer();

      await tester.tap(addMoreButtonFinder);
      await tester.pumpAndSettle();

      verify(() => itemsRepo.addItem(any(), buildItemRawData(p: itemName, q: '', c: categoryName))).called(1);
      verifyNever(() => router.pop());
      expect(find.text(_Strings.addedToList(itemName)), findsOneWidget);
      expect(find.byType(ShoppingItemSearchView), findsOneWidget);
      expect(getTextFieldText(tester, itemInputFinder), isEmpty);
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
      of: find.byType(CategoryAutocompleteEntry),
      matching: find.text(text),
    );
  }

  Finder categoryAutocompletePlusButton(String text) {
    return find.descendant(
      of: find.ancestor(
        of: find.text(text),
        matching: find.byType(CategoryAutocompleteEntry),
      ),
      matching: find.byIcon(Icons.add),
    );
  }
}

ShoppingItemRawData buildItemRawData({required String p, String q = '', String c = ''}) {
  return ShoppingItemRawData(
    product: p,
    quantity: q,
    category: c,
  );
}

ShoppingItemAutocomplete buildItemAutocomplete(
  String name,
  String category, {
  String? quantity,
  ShoppingItemAutocompleteSource source = ShoppingItemAutocompleteSource.suggested,
}) {
  return ShoppingItemAutocomplete(
    source: source,
    sourceId: name.toLowerCase().replaceAll(' ', '-'),
    product: name,
    category: category,
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
  String category, {
  String? quantity,
}) {
  final id = name.toLowerCase().replaceAll(' ', '-');
  return ShoppingItem(
    id: id,
    path: 'lists/test-list-id/items/$id',
    product: name,
    quantity: quantity ?? '',
    category: category,
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
