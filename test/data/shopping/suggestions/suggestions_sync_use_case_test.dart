import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quickshop/data/shopping/suggestions/application/suggestions_sync_use_case.dart';
import 'package:quickshop/data/shopping/suggestions/repositories/shopping_category_suggestion_repo.dart';
import 'package:quickshop/data/shopping/suggestions/repositories/shopping_item_suggestion_repo.dart';
import 'package:quickshop/services/auth_service.dart';
import 'package:quickshop/services/locale_service.dart';
import 'package:riverpod/riverpod.dart';

import '../../../utilities/create_provider_container.dart';

class MockItemSuggestionRepo extends Mock implements ShoppingItemSuggestionRepo {}

class MockCategorySuggestionRepo extends Mock implements ShoppingCategorySuggestionRepo {}

void main() {
  late MockItemSuggestionRepo itemRepo;
  late MockCategorySuggestionRepo categoryRepo;
  late StreamController<Map<String, DateTime>> itemSummary;
  late StreamController<Map<String, DateTime>> categorySummary;
  late ProviderContainer container;
  String? userId;

  final enUpdated = DateTime.fromMillisecondsSinceEpoch(1000);
  final frUpdated = DateTime.fromMillisecondsSinceEpoch(2000);

  setUpAll(() {
    registerFallbackValue(DateTime.fromMillisecondsSinceEpoch(0));
  });

  setUp(() {
    itemRepo = MockItemSuggestionRepo();
    categoryRepo = MockCategorySuggestionRepo();
    itemSummary = StreamController();
    categorySummary = StreamController();
    when(() => itemRepo.watchLastUpdated()).thenAnswer((_) => itemSummary.stream);
    when(() => categoryRepo.watchLastUpdated()).thenAnswer((_) => categorySummary.stream);
    when(() => itemRepo.download(any(), any())).thenAnswer((_) => Future.value());
    when(() => categoryRepo.download(any(), any())).thenAnswer((_) => Future.value());
    userId = null;
    container = createContainer(
      overrides: [
        shoppingItemSuggestionRepoProvider.overrideWithValue(itemRepo),
        shoppingCategorySuggestionRepoProvider.overrideWithValue(categoryRepo),
        userIdProvider.overrideWith((ref) => userId),
      ],
    );
    container.testListen(suggestionsSyncUseCaseProvider);
  });

  Future<void> signInAs(String? id) async {
    userId = id;
    container.invalidate(userIdProvider);
    container.read(userIdProvider);
    await pumpEventQueue();
  }

  Future<void> emitSummaries() async {
    itemSummary.add({'en': enUpdated, 'fr': frUpdated});
    categorySummary.add({'en': enUpdated});
    await pumpEventQueue();
  }

  test('Nothing is downloaded while signed out', () async {
    await emitSummaries();

    verifyNever(() => itemRepo.download(any(), any()));
    verifyNever(() => categoryRepo.download(any(), any()));
  });

  test('Signing in downloads suggestions for the current locale', () async {
    await emitSummaries();
    await signInAs('user-a');

    verify(() => itemRepo.download('en', enUpdated)).called(1);
    verify(() => categoryRepo.download('en', enUpdated)).called(1);
  });

  test('Summary updates are downloaded while signed in', () async {
    await signInAs('user-a');
    verifyNever(() => itemRepo.download(any(), any()));

    await emitSummaries();

    verify(() => itemRepo.download('en', enUpdated)).called(1);
  });

  test('Changing user downloads suggestions for the new user', () async {
    await emitSummaries();
    await signInAs('user-a');
    verify(() => itemRepo.download('en', enUpdated)).called(1);

    await signInAs('user-b');

    verify(() => itemRepo.download('en', enUpdated)).called(1);
  });

  test('Changing locale downloads suggestions for the new language', () async {
    await emitSummaries();
    await signInAs('user-a');

    container.read(localeServiceProvider.notifier).setLocale(const Locale('fr'));
    await pumpEventQueue();

    verify(() => itemRepo.download('fr', frUpdated)).called(1);
    verify(() => categoryRepo.download('fr', DateTime.fromMillisecondsSinceEpoch(0))).called(1);
  });

  test('Downloads run one at a time', () async {
    final itemDownload = Completer<void>();
    when(() => itemRepo.download(any(), any())).thenAnswer((_) => itemDownload.future);
    await signInAs('user-a');

    await emitSummaries();
    verify(() => itemRepo.download('en', enUpdated)).called(1);
    verifyNever(() => categoryRepo.download(any(), any()));

    itemDownload.complete();
    await pumpEventQueue();
    verify(() => categoryRepo.download('en', enUpdated)).called(1);
  });
}
