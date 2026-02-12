import '../data/common/models/has_id.dart';

List<T> replaceById<T extends HasId>(List<T> list, String id, T Function(T current) updater) {
  final index = list.indexWhere((e) => e.id == id);
  if (index >= 0) {
    final updatedList = List<T>.from(list);
    updatedList[index] = updater(updatedList[index]);
    return updatedList;
  }
  return list;
}
