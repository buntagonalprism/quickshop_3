import 'package:freezed_annotation/freezed_annotation.dart';

import 'user/user.dart';

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
