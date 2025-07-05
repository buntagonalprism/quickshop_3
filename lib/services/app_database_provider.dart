import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../repositories/user_repo.dart';
import 'app_database.dart';

part 'app_database_provider.g.dart';

@Riverpod(keepAlive: true)
AppDatabase appDatabase(Ref ref) {
  final userId = ref.watch(userIdProvider);
  if (userId == null) {
    return AppDatabase('unauthenticated');
  }
  return AppDatabase(userId);
}
