import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quickshop/pages/lists/shopping/items/shopping_item_create_page.dart';
import 'package:quickshop/pages/lists/shopping/items/shopping_item_create_view_model.dart';
import 'package:quickshop/services/app_database.dart';
import 'package:quickshop/services/app_database_provider.dart';
import 'package:quickshop/services/firestore.dart';
import 'package:quickshop/services/shared_preferences.dart';

import '../../../fakes/fake_shared_preferences.dart';
import '../../../mocks/mock_firestore.dart';

class MockDb extends Mock implements AppDatabase {}

void main() {
  final listId = 'test-list-id';

  late MockFirebaseFirestore fs;
  late MockDb db;
  late FakeSharedPreferences prefs;

  setUp(() {
    fs = MockFirebaseFirestore();
    db = MockDb();
    prefs = FakeSharedPreferences();
  });

  Future<void> pumpScreen(WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: ProviderScope(
        overrides: [
          appDatabaseProvider.overrideWithValue(db),
          firestoreProvider.overrideWithValue(fs),
          sharedPrefsProvider.overrideWithValue(prefs),
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
}
