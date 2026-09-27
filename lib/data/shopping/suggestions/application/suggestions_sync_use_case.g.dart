// GENERATED CODE - DO NOT MODIFY BY HAND

// coverage:ignore-file
// dart format off

part of 'suggestions_sync_use_case.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(suggestionsDownload)
final suggestionsDownloadProvider = SuggestionsDownloadFamily._();

final class SuggestionsDownloadProvider
    extends
        $FunctionalProvider<
          SuggestionsDownload,
          SuggestionsDownload,
          SuggestionsDownload
        >
    with $Provider<SuggestionsDownload> {
  SuggestionsDownloadProvider._({
    required SuggestionsDownloadFamily super.from,
    required SuggestionType super.argument,
  }) : super(
         retry: null,
         name: r'suggestionsDownloadProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$suggestionsDownloadHash();

  @override
  String toString() {
    return r'suggestionsDownloadProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<SuggestionsDownload> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SuggestionsDownload create(Ref ref) {
    final argument = this.argument as SuggestionType;
    return suggestionsDownload(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SuggestionsDownload value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SuggestionsDownload>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SuggestionsDownloadProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$suggestionsDownloadHash() =>
    r'7bd1a482008b43eb9ef7f874493ab9cbf187f9da';

final class SuggestionsDownloadFamily extends $Family
    with $FunctionalFamilyOverride<SuggestionsDownload, SuggestionType> {
  SuggestionsDownloadFamily._()
    : super(
        retry: null,
        name: r'suggestionsDownloadProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  SuggestionsDownloadProvider call(SuggestionType type) =>
      SuggestionsDownloadProvider._(argument: type, from: this);

  @override
  String toString() => r'suggestionsDownloadProvider';
}

/// The time suggestions of [type] were last updated in Firestore, keyed by language code.

@ProviderFor(suggestionsLastUpdated)
final suggestionsLastUpdatedProvider = SuggestionsLastUpdatedFamily._();

/// The time suggestions of [type] were last updated in Firestore, keyed by language code.

final class SuggestionsLastUpdatedProvider
    extends
        $FunctionalProvider<
          AsyncValue<Map<String, DateTime>>,
          Map<String, DateTime>,
          Stream<Map<String, DateTime>>
        >
    with
        $FutureModifier<Map<String, DateTime>>,
        $StreamProvider<Map<String, DateTime>> {
  /// The time suggestions of [type] were last updated in Firestore, keyed by language code.
  SuggestionsLastUpdatedProvider._({
    required SuggestionsLastUpdatedFamily super.from,
    required SuggestionType super.argument,
  }) : super(
         retry: null,
         name: r'suggestionsLastUpdatedProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$suggestionsLastUpdatedHash();

  @override
  String toString() {
    return r'suggestionsLastUpdatedProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<Map<String, DateTime>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<Map<String, DateTime>> create(Ref ref) {
    final argument = this.argument as SuggestionType;
    return suggestionsLastUpdated(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is SuggestionsLastUpdatedProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$suggestionsLastUpdatedHash() =>
    r'7131eca05e3b1ae0bfa8957f66c08118ba75e407';

/// The time suggestions of [type] were last updated in Firestore, keyed by language code.

final class SuggestionsLastUpdatedFamily extends $Family
    with
        $FunctionalFamilyOverride<
          Stream<Map<String, DateTime>>,
          SuggestionType
        > {
  SuggestionsLastUpdatedFamily._()
    : super(
        retry: null,
        name: r'suggestionsLastUpdatedProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// The time suggestions of [type] were last updated in Firestore, keyed by language code.

  SuggestionsLastUpdatedProvider call(SuggestionType type) =>
      SuggestionsLastUpdatedProvider._(argument: type, from: this);

  @override
  String toString() => r'suggestionsLastUpdatedProvider';
}

/// Combines the signed in user, the locale and the Firestore summary into what suggestions of [type]
/// should be synced to, or null while signed out or until the summary has loaded.
///
/// The summary is only watched while signed in, so Firestore isn't listened to while signed out.
/// Errors from the summary are rethrown, for the use case to report.

@ProviderFor(suggestionsSyncRequest)
final suggestionsSyncRequestProvider = SuggestionsSyncRequestFamily._();

/// Combines the signed in user, the locale and the Firestore summary into what suggestions of [type]
/// should be synced to, or null while signed out or until the summary has loaded.
///
/// The summary is only watched while signed in, so Firestore isn't listened to while signed out.
/// Errors from the summary are rethrown, for the use case to report.

final class SuggestionsSyncRequestProvider
    extends
        $FunctionalProvider<
          SuggestionsSyncRequest?,
          SuggestionsSyncRequest?,
          SuggestionsSyncRequest?
        >
    with $Provider<SuggestionsSyncRequest?> {
  /// Combines the signed in user, the locale and the Firestore summary into what suggestions of [type]
  /// should be synced to, or null while signed out or until the summary has loaded.
  ///
  /// The summary is only watched while signed in, so Firestore isn't listened to while signed out.
  /// Errors from the summary are rethrown, for the use case to report.
  SuggestionsSyncRequestProvider._({
    required SuggestionsSyncRequestFamily super.from,
    required SuggestionType super.argument,
  }) : super(
         retry: null,
         name: r'suggestionsSyncRequestProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$suggestionsSyncRequestHash();

  @override
  String toString() {
    return r'suggestionsSyncRequestProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<SuggestionsSyncRequest?> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SuggestionsSyncRequest? create(Ref ref) {
    final argument = this.argument as SuggestionType;
    return suggestionsSyncRequest(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SuggestionsSyncRequest? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SuggestionsSyncRequest?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SuggestionsSyncRequestProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$suggestionsSyncRequestHash() =>
    r'f62d44279b6e85a73f00613a6c0829a96ea13dfc';

/// Combines the signed in user, the locale and the Firestore summary into what suggestions of [type]
/// should be synced to, or null while signed out or until the summary has loaded.
///
/// The summary is only watched while signed in, so Firestore isn't listened to while signed out.
/// Errors from the summary are rethrown, for the use case to report.

final class SuggestionsSyncRequestFamily extends $Family
    with $FunctionalFamilyOverride<SuggestionsSyncRequest?, SuggestionType> {
  SuggestionsSyncRequestFamily._()
    : super(
        retry: null,
        name: r'suggestionsSyncRequestProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Combines the signed in user, the locale and the Firestore summary into what suggestions of [type]
  /// should be synced to, or null while signed out or until the summary has loaded.
  ///
  /// The summary is only watched while signed in, so Firestore isn't listened to while signed out.
  /// Errors from the summary are rethrown, for the use case to report.

  SuggestionsSyncRequestProvider call(SuggestionType type) =>
      SuggestionsSyncRequestProvider._(argument: type, from: this);

  @override
  String toString() => r'suggestionsSyncRequestProvider';
}

@ProviderFor(suggestionsSyncUseCase)
final suggestionsSyncUseCaseProvider = SuggestionsSyncUseCaseProvider._();

final class SuggestionsSyncUseCaseProvider
    extends
        $FunctionalProvider<
          SuggestionsSyncUseCase,
          SuggestionsSyncUseCase,
          SuggestionsSyncUseCase
        >
    with $Provider<SuggestionsSyncUseCase> {
  SuggestionsSyncUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'suggestionsSyncUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$suggestionsSyncUseCaseHash();

  @$internal
  @override
  $ProviderElement<SuggestionsSyncUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SuggestionsSyncUseCase create(Ref ref) {
    return suggestionsSyncUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SuggestionsSyncUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SuggestionsSyncUseCase>(value),
    );
  }
}

String _$suggestionsSyncUseCaseHash() =>
    r'51dc7f6762b39a797a906322b93e7ffeeaaee651';
