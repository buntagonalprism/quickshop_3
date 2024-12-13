import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'shopping_item.freezed.dart';

@freezed
class ShoppingItem with _$ShoppingItem {
  const ShoppingItem._();

  const factory ShoppingItem({
    required String id,
    required String path,
    required String name,
    required String quantity,
    required List<String> categories,
    required String addedByUserId,
    required bool completed,
  }) = _ShoppingItem;

  factory ShoppingItem.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) {
    return ShoppingItem(
      path: doc.reference.path,
      id: doc.id,
      name: doc[fieldKeys.name],
      quantity: doc[fieldKeys.quantity],
      categories: (doc[fieldKeys.categories] as List).cast<String>(),
      addedByUserId: doc['addedByUserId'],
      completed: doc[fieldKeys.completed],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      fieldKeys.name: name,
      fieldKeys.quantity: quantity,
      fieldKeys.categories: categories,
      'addedByUserId': addedByUserId,
      fieldKeys.completed: completed,
    };
  }

  String get displayName => quantity.isEmpty ? name : '$quantity $name';

  static const ShoppingItemFieldKeys fieldKeys = ShoppingItemFieldKeys();
}

class ShoppingItemFieldKeys {
  const ShoppingItemFieldKeys();
  final String completed = 'completed';
  final String name = 'name';
  final String quantity = 'quantity';
  final String categories = 'categories';
}
