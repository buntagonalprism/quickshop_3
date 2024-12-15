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
      name: doc[fields.name],
      quantity: doc[fields.quantity],
      categories: (doc[fields.categories] as List).cast<String>(),
      addedByUserId: doc['addedByUserId'],
      completed: doc[fields.completed],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      fields.name: name,
      fields.quantity: quantity,
      fields.categories: categories,
      'addedByUserId': addedByUserId,
      fields.completed: completed,
    };
  }

  String get displayName => quantity.isEmpty ? name : '$quantity $name';

  static const ShoppingItemFields fields = ShoppingItemFields();
}

class ShoppingItemFields {
  const ShoppingItemFields();
  final String completed = 'completed';
  final String name = 'name';
  final String quantity = 'quantity';
  final String categories = 'categories';
}
