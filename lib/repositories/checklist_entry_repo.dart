import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/checklist_entry.dart';

part 'checklist_entry_repo.g.dart';

@riverpod
class ChecklistEntryRepo extends _$ChecklistEntryRepo {
  @override
  Stream<List<ChecklistEntry>> build(String listId) {
    throw UnimplementedError();
  }
}
