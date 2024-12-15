import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'user.dart';

part 'list_summary.freezed.dart';

@freezed
class ListSummary with _$ListSummary {
  const ListSummary._();

  const factory ListSummary({
    required String id,
    required String name,

    /// The ID of the user who created the list
    required String ownerId,

    /// List of user IDs who can edit the list, including the owner
    required List<String> editorIds,

    /// List of user details of users who can edit the list, including the owner
    required List<User> editors,

    /// Number of items in the list
    required int itemCount,

    /// When the list was last modified by a specific user, in milliseconds since the epoch.
    required Map<String, int> lastModified,
    required ListType listType,
  }) = _ListSummary;

  factory ListSummary.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) {
    return ListSummary.fromJson(doc.data()!, doc.id);
  }

  factory ListSummary.fromJson(Map<String, dynamic> json, String listId) {
    return ListSummary(
      id: listId,
      name: json[fields.name],
      ownerId: json['ownerId'],
      editorIds: List<String>.from(json[fields.editorIds]),
      editors: List<User>.from(List<Map<String, dynamic>>.from(json['editors']).map(User.fromJson)),
      itemCount: json[fields.itemCount],
      lastModified: Map<String, int>.from(json[fields.lastModified]),
      listType: parseListType(json['listType']),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      fields.name: name,
      'ownerId': ownerId,
      fields.editorIds: editorIds,
      'editors': editors
          .map((e) => {
                'id': e.id,
                'name': e.name,
                'email': e.email,
              })
          .toList(),
      fields.itemCount: itemCount,
      fields.lastModified: lastModified,
      'listType': listType.name,
    };
  }

  static const ListSummaryFields fields = ListSummaryFields();
}

class ListSummaryFields {
  const ListSummaryFields();
  final String name = 'name';
  final String editorIds = 'editorIds';
  final String itemCount = 'itemCount';
  final String lastModified = 'lastModified';
}

enum ListType {
  checklist,
  shoppingList,
}

ListType parseListType(dynamic data) {
  return ListType.values.firstWhere(
    (e) => e.name == data,
    orElse: () => throw Exception('Invalid list type $dynamic'),
  );
}

extension ListTypeExtension on ListType {
  String get displayName {
    switch (this) {
      case ListType.checklist:
        return 'checklist';
      case ListType.shoppingList:
        return 'shopping list';
    }
  }
}
