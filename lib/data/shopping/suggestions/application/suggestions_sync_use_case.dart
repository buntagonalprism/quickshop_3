import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../analytics/crash_reporter.dart';
import '../../../../services/auth_service.dart';
import '../../../../services/locale_service.dart';
import '../repositories/shopping_category_suggestion_repo.dart';
import '../repositories/shopping_item_suggestion_repo.dart';
import '../repositories/suggestions_download.dart';

part 'suggestions_sync_use_case.g.dart';

@Riverpod(keepAlive: true)
SuggestionsSyncUseCase suggestionsSyncUseCase(Ref ref) {
  final useCase = SuggestionsSyncUseCase(ref);
  ref.onDispose(useCase._dispose);
  return useCase;
}

/// Keeps the signed in user's local database up to date with the item and category suggestions in
/// Firestore.
///
/// Suggestions are the same for every user, so their Firestore summaries are watched for the life of
/// the app. They are stored in each user's own database, so a sync runs whenever the summaries
/// change, the user changes, or the locale changes. Nothing is downloaded while signed out.
class SuggestionsSyncUseCase {
  SuggestionsSyncUseCase(this._ref) {
    for (final type in _types) {
      _subscriptions.add(
        type.download.watchLastUpdated().listen(
          (lastUpdated) {
            type.lastUpdated = lastUpdated;
            _sync(type);
          },
          onError: (Object error, StackTrace stackTrace) {
            _ref.read(crashReporterProvider).report(error, stackTrace);
          },
        ),
      );
    }
    _ref.listen(userIdProvider, (_, _) => _syncAll());
    _ref.listen(localeServiceProvider, (_, _) => _syncAll());
  }

  final Ref _ref;
  late final _types = [
    _SuggestionsType(_ref.read(shoppingItemSuggestionRepoProvider)),
    _SuggestionsType(_ref.read(shoppingCategorySuggestionRepoProvider)),
  ];
  final _subscriptions = <StreamSubscription>[];

  /// Downloads run one at a time, so that two downloads never write to the same database at once.
  Future<void> _downloads = Future.value();

  void _syncAll() {
    for (final type in _types) {
      _sync(type);
    }
  }

  void _sync(_SuggestionsType type) {
    final lastUpdated = type.lastUpdated;
    if (lastUpdated == null || _ref.read(userIdProvider) == null) {
      return;
    }
    final langCode = _ref.read(localeServiceProvider).languageCode;
    final langLastUpdated = lastUpdated[langCode] ?? DateTime.fromMillisecondsSinceEpoch(0);
    _downloads = _downloads.then((_) => type.download.download(langCode, langLastUpdated)).catchError((
      Object error,
      StackTrace stackTrace,
    ) {
      _ref.read(crashReporterProvider).report(error, stackTrace);
    });
  }

  void _dispose() {
    for (final subscription in _subscriptions) {
      subscription.cancel();
    }
  }
}

class _SuggestionsType {
  _SuggestionsType(this.download);

  final SuggestionsDownload download;

  /// The latest summary of when suggestions were last updated in Firestore, keyed by language code,
  /// or null until the summary has loaded.
  Map<String, DateTime>? lastUpdated;
}
