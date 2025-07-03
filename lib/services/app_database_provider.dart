import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../repositories/user_repo.dart';
import 'app_database.dart';

part 'app_database_provider.g.dart';

@Riverpod(keepAlive: true)
AppDatabase appDatabase(Ref ref) {
  final user = ref.watch(userRepoProvider);
  if (user == null) {
    return AppDatabase('unauthenticated');
  }
  return AppDatabase(user.id);
}
