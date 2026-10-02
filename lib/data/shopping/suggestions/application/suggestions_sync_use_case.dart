import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../analytics/crash_reporter.dart';
import '../../../../services/auth_service.dart';
import '../../../../services/locale_service.dart';
import '../database/suggestion_type.dart';
import '../repositories/shopping_category_suggestion_repo.dart';
import '../repositories/shopping_item_suggestion_repo.dart';
import '../repositories/suggestions_download.dart';

part 'suggestions_sync_use_case.freezed.dart';
part 'suggestions_sync_use_case.g.dart';

/// What the signed in user's database should be synced to for one type of suggestion.
@freezed
abstract class SuggestionsSyncRequest with _$SuggestionsSyncRequest {
  const factory SuggestionsSyncRequest({
    required String userId,
    required String langCode,
    required DateTime lastUpdated,
  }) = _SuggestionsSyncRequest;
}

@Riverpod(keepAlive: true)
SuggestionsDownload suggestionsDownload(Ref ref, SuggestionType type) {
  return switch (type) {
    SuggestionType.item => ref.read(shoppingItemSuggestionRepoProvider),
    SuggestionType.category => ref.read(shoppingCategorySuggestionRepoProvider),
  };
}

/// The time suggestions of [type] were last updated in Firestore, keyed by language code.
@riverpod
Stream<Map<String, DateTime>> suggestionsLastUpdated(Ref ref, SuggestionType type) {
  return ref.watch(suggestionsDownloadProvider(type)).watchLastUpdated();
}

/// Combines the signed in user, the locale and the Firestore summary into what suggestions of [type]
/// should be synced to, or null while signed out or until the summary has loaded.
///
/// The summary is only watched while signed in, so Firestore isn't listened to while signed out.
/// Errors from the summary are rethrown, for the use case to report.
@riverpod
SuggestionsSyncRequest? suggestionsSyncRequest(Ref ref, SuggestionType type) {
  final userId = ref.watch(userIdProvider);
  if (userId == null) {
    return null;
  }
  final summary = ref.watch(suggestionsLastUpdatedProvider(type));
  if (summary.error case final error?) {
    Error.throwWithStackTrace(error, summary.stackTrace!);
  }
  final lastUpdated = summary.value;
  if (lastUpdated == null) {
    return null;
  }
  final langCode = ref.watch(localeServiceProvider.select((locale) => locale.languageCode));
  return SuggestionsSyncRequest(
    userId: userId,
    langCode: langCode,
    lastUpdated: lastUpdated[langCode] ?? DateTime.fromMillisecondsSinceEpoch(0),
  );
}

@Riverpod(keepAlive: true)
SuggestionsSyncUseCase suggestionsSyncUseCase(Ref ref) {
  return SuggestionsSyncUseCase(ref);
}

/// Keeps the signed in user's local database up to date with the item and category suggestions in
/// Firestore, by downloading whenever a type's [suggestionsSyncRequestProvider] changes.
class SuggestionsSyncUseCase {
  SuggestionsSyncUseCase(this._ref) {
    for (final type in SuggestionType.values) {
      _ref.listen(
        suggestionsSyncRequestProvider(type),
        (_, request) {
          if (request != null) {
            _enqueue(type, request);
          }
        },
        onError: _ref.read(crashReporterProvider).report,
        fireImmediately: true,
      );
    }
  }

  final Ref _ref;

  /// Downloads run one at a time, so that two downloads never write to the same database at once.
  Future<void> _downloads = Future.value();

  void _enqueue(SuggestionType type, SuggestionsSyncRequest request) {
    _downloads = _downloads
        .then((_) {
          // Skip if the user changed while this was queued. The new user has their own request.
          if (_ref.read(userIdProvider) != request.userId) {
            return null;
          }
          return _ref.read(suggestionsDownloadProvider(type)).download(request.langCode, request.lastUpdated);
        })
        .catchError((Object error, StackTrace stackTrace) {
          _ref.read(crashReporterProvider).report(error, stackTrace);
        });
  }
}
