import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quickshop/analytics/analytics.dart';
import 'package:quickshop/analytics/crash_reporter.dart';
import 'package:quickshop/data/common/application/firestore_transaction.dart';
import 'package:quickshop/data/lists/application/lists_notifier.dart';
import 'package:quickshop/data/lists/models/list_summary.dart';
import 'package:quickshop/data/lists/repositories/list_repo.dart';
import 'package:quickshop/data/shopping/autocomplete/application/shopping_category_autocomplete_use_case.dart';
import 'package:quickshop/data/shopping/items/models/shopping_item.dart';
import 'package:quickshop/data/shopping/items/models/shopping_item_raw_data.dart';
import 'package:quickshop/data/shopping/items/repositories/shopping_items_repo.dart';
import 'package:quickshop/pages/lists/shopping/items/models/shopping_item_errors.dart';
import 'package:quickshop/pages/lists/shopping/items/shopping_item_edit_page.dart';
import 'package:quickshop/pages/lists/shopping/items/shopping_item_view.dart';
import 'package:quickshop/router.dart';
import 'package:quickshop/services/firebase_auth.dart';
import 'package:quickshop/services/shared_preferences.dart';

import '../../../fakes/fake_firebase_auth.dart';
import '../../../fakes/fake_list_items_transaction.dart';
import '../../../fakes/fake_shared_preferences.dart';

class MockAnalytics extends Mock implements Analytics {}

class MockCategoryAutocompleteRepo extends Mock implements ShoppingCategoryAutocompleteUseCase {}

class MockShoppingListItemsRepo extends Mock implements ShoppingListItemsRepo {}

class MockListRepo extends Mock implements ListRepo {}

class MockRouter extends Mock implements GoRouter {}

class MockCrashReporter extends Mock implements CrashReporter {}

void main() {
  late MockShoppingListItemsRepo itemsRepo;
  late MockListRepo listRepo;
  late MockRouter router;
  late MockAnalytics analytics;
  late MockCategoryAutocompleteRepo categoryAutocompleteRepo;
  late FakeFirebaseAuth auth;
  late FakeSharedPreferences prefs;

  final userId = 'user123';

  final listId = 'test-list-id';
  final list = ListSummary(
    id: listId,
    name: 'TestList',
    ownerId: 'user123',
    editorIds: [],
    editors: [],
    itemCount: 0,
    lastModified: {userId: DateTime.now().millisecondsSinceEpoch},
    listType: ListType.shoppingList,
  );

  final itemId = 'test-item-id';
  final item = ShoppingItem(
    id: itemId,
    path: '/lists/$listId/items/$itemId',
    product: 'Milk',
    quantity: '1 Litre',
    category: 'Dairy',
    addedByUserId: userId,
    lastModifiedByUserId: userId,
    lastModifiedAt: DateTime.now(),
    completed: false,
  );

  registerFallbackValue(FakeListItemsTransaction());
  registerFallbackValue(item);
  registerFallbackValue(ShoppingItemRawData(product: '', quantity: '', category: ''));

  setUp(() {
    itemsRepo = MockShoppingListItemsRepo();
    when(() => itemsRepo.itemsStream).thenAnswer((_) => Stream.value([item]));
    listRepo = MockListRepo();
    when(() => listRepo.getAllLists()).thenAnswer((_) => Stream.value([list]));
    router = MockRouter();
    auth = FakeFirebaseAuth(user: buildUser());
    prefs = FakeSharedPreferences();
    analytics = MockAnalytics();
    categoryAutocompleteRepo = MockCategoryAutocompleteRepo();
  });

  final doneButtonFinder = find.text('Done');
  final deleteButtonFinder = find.byIcon(Icons.delete);
  final productInputFinder = find.byKey(ShoppingItemView.keys.productInput);
  final quantityInputFinder = find.byKey(ShoppingItemView.keys.quantityInput);
  final categoryInputFinder = find.byKey(ShoppingItemView.keys.categoriesInput);

  Future<void> pumpScreen(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ProviderScope(
          overrides: [
            shoppingListItemsRepoProvider(listId).overrideWithValue(itemsRepo),
            listRepoProvider.overrideWithValue(listRepo),
            routerProvider.overrideWithValue(router),
            firestoreTransactionProvider.overrideWithValue(() => FakeListItemsTransaction()),
            firebaseAuthProvider.overrideWithValue(auth),
            sharedPrefsProvider.overrideWithValue(prefs),
            analyticsProvider.overrideWithValue(analytics),
            shoppingCategoryAutocompleteUseCaseProvider(listId).overrideWithValue(categoryAutocompleteRepo),
            crashReporterProvider.overrideWithValue(MockCrashReporter()),
          ],
          child: Consumer(
            builder: (context, ref, _) {
              // Updating a shopping item triggers a side effect of updating the list item
              // last modified via the lists notifier. We need to ensure the lists notifier is in a
              // valid state (i.e. has loaded the lists) to avoid state errors.
              ref.watch(listsProvider);

              return ShoppingItemEditPage(listId: listId, itemId: itemId);
            },
          ),
        ),
      ),
    );
  }

  testWidgets('WHEN item is loading THEN loading indicator is shown', (tester) async {
    when(() => itemsRepo.itemsStream).thenAnswer((_) => Completer<List<ShoppingItem>>().future.asStream());

    await pumpScreen(tester);
    await tester.pump();

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('WHEN item is loaded from list THEN item details are displayed', (tester) async {
    await pumpScreen(tester);
    await tester.pump();

    expect(find.text(item.product), findsOneWidget);
    expect(find.text(item.quantity), findsOneWidget);
    expect(find.text(item.category), findsOneWidget);
  });

  testWidgets('WHEN error occurs loading item THEN error message is shown', (tester) async {
    when(() => itemsRepo.itemsStream).thenAnswer((_) => Stream.error(Exception('Failed to load items')));

    await pumpScreen(tester);
    await tester.pump();

    expect(find.text('Error loading item'), findsOneWidget);
  });

  testWidgets('WHEN item is not found in list THEN not found message is shown', (tester) async {
    when(() => itemsRepo.itemsStream).thenAnswer((_) => Stream.value([]));

    await pumpScreen(tester);
    await tester.pump();

    expect(find.text('Item not found'), findsOneWidget);
  });

  testWidgets('WHEN product name is empty THEN error is shown and item cannot be saved', (tester) async {
    await pumpScreen(tester);
    await tester.pumpAndSettle();

    await tester.enterText(productInputFinder, '');
    await tester.tap(doneButtonFinder);
    await tester.pumpAndSettle();

    expect(find.text(ShoppingItemErrors.messages.productNameMissing), findsOneWidget);
    verifyNever(() => itemsRepo.updateItem(any(), any(), any()));
  });

  testWidgets('WHEN category is empty THEN error is shown and item cannot be saved', (tester) async {
    await pumpScreen(tester);
    await tester.pumpAndSettle();

    await tester.enterText(categoryInputFinder, '');
    await tester.tap(doneButtonFinder);
    await tester.pumpAndSettle();

    expect(find.text(ShoppingItemErrors.messages.categoryMissing), findsOneWidget);
    verifyNever(() => itemsRepo.updateItem(any(), any(), any()));
  });

  testWidgets('GIVEN product is valid WHEN done is tapped THEN item is saved and screen closed', (tester) async {
    await pumpScreen(tester);
    await tester.pumpAndSettle();

    when(() => categoryAutocompleteRepo.getAutocomplete(any())).thenAnswer((_) {
      return Future.value([]);
    });

    final newProductName = 'Bread';
    await tester.enterText(productInputFinder, newProductName);

    final newQuantity = '2 Loaves';
    await tester.enterText(quantityInputFinder, newQuantity);

    final newCategoryName = 'Bakery';
    await tester.enterText(categoryInputFinder, newCategoryName);

    final expectedUpdates = ShoppingItemRawData(
      product: newProductName,
      quantity: newQuantity,
      category: newCategoryName,
    );

    void expectedCall() => itemsRepo.updateItem(any(), item, expectedUpdates);
    when(expectedCall).thenAnswer((_) => Future.value());

    await tester.tap(doneButtonFinder);
    await tester.pumpAndSettle();

    verify(expectedCall).called(1);
    verify(() => router.go(Routes.shoppingListDetail(listId).path)).called(1);
  });

  testWidgets('WHEN delete button is tapped THEN confirmation dialog is shown', (tester) async {
    await pumpScreen(tester);
    await tester.pumpAndSettle();

    await tester.tap(deleteButtonFinder);
    await tester.pumpAndSettle();

    expect(find.text('Delete item?'), findsOneWidget);
    expect(find.text('Cancel'), findsOneWidget);
    expect(find.text('Delete'), findsOneWidget);

    await tester.tap(find.text('Cancel'));
    await tester.pumpAndSettle();

    verifyNever(() => itemsRepo.deleteItems(any(), any()));
    expect(find.text('Delete item?'), findsNothing);

    await tester.tap(deleteButtonFinder);
    await tester.pumpAndSettle();

    await tester.tap(find.text('Delete'));
    await tester.pumpAndSettle();

    verify(() => itemsRepo.deleteItems(any(), [item])).called(1);
  });
}
