import 'package:cloud_firestore/cloud_firestore.dart';

/// A type of suggestion which is downloaded from Firestore into the user's local database.
abstract interface class SuggestionsDownload {
  /// Emits the time suggestions were last updated in Firestore, keyed by language code.
  Stream<Map<String, DateTime>> watchLastUpdated();

  /// Downloads suggestions for [langCode] into the signed in user's database, if the database has
  /// not yet been updated up to [lastUpdated]. If the database holds suggestions for a different
  /// language, they are replaced.
  Future<void> download(String langCode, DateTime lastUpdated);
}

/// Parses the `lastUpdated` map of a suggestions summary document, keyed by language code.
Map<String, DateTime> parseLastUpdated(DocumentSnapshot<Map<String, dynamic>> snapshot) {
  final lastUpdated = snapshot.data()?['lastUpdated'] as Map<String, dynamic>? ?? {};
  return lastUpdated.map((langCode, millis) => MapEntry(langCode, DateTime.fromMillisecondsSinceEpoch(millis as int)));
}

/// Fetches every document in [collection] updated after [since], a page at a time.
Future<List<DocumentSnapshot<Map<String, dynamic>>>> fetchUpdatedSince(
  CollectionReference<Map<String, dynamic>> collection,
  DateTime since,
) async {
  const pageSize = 100;
  final baseQuery = collection
      .where('updated', isGreaterThan: since.millisecondsSinceEpoch)
      .orderBy('updated')
      .orderBy(FieldPath.documentId)
      .limit(pageSize);

  Query<Map<String, dynamic>> pageQuery = baseQuery;
  final allDocs = <DocumentSnapshot<Map<String, dynamic>>>[];
  QuerySnapshot<Map<String, dynamic>> pageResults;
  do {
    pageResults = await pageQuery.get();
    allDocs.addAll(pageResults.docs);
    if (pageResults.docs.isNotEmpty) {
      pageQuery = baseQuery.startAfterDocument(pageResults.docs.last);
    }
  } while (pageResults.size == pageSize);
  return allDocs;
}
