import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../application/user_store.dart';
import 'app_database.dart';

part 'app_database_provider.g.dart';

@Riverpod(keepAlive: true)
AppDatabase appDatabase(Ref ref) {
  // Ensure that we have a unique AppDatabase instance per user which we only create once.
  final userId = ref.watch(userIdProvider) ?? 'unauthenticated';
  if (!_appDatabasesByUserId.containsKey(userId)) {
    _appDatabasesByUserId[userId] = AppDatabase(DatabaseFileNameConfig(userId));
  }
  return _appDatabasesByUserId[userId]!;
}

final _appDatabasesByUserId = <String, AppDatabase>{};
