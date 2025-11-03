import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/list_summary.dart';
import 'list_store.dart';

part 'list_provider.g.dart';

@riverpod
AsyncValue<ListSummary?> list(Ref ref, String listId) {
  final result = ref.watch(listStoreProvider);
  return result.when(
    data: (lists) => AsyncValue.data(
      lists.any((list) => list.id == listId) ? lists.firstWhere((list) => list.id == listId) : null,
    ),
    error: (error, trace) => AsyncValue.error(error, trace),
    loading: AsyncValue.loading,
  );
}
