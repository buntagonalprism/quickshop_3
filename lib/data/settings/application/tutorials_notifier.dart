import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../user/repositories/user_profile_repo.dart';

part 'tutorials_notifier.g.dart';

enum Tutorial {
  categorySelection,
}

@Riverpod(keepAlive: true)
class TutorialsNotifier extends _$TutorialsNotifier {
  late final nameMap = Tutorial.values.asNameMap();

  @override
  Set<Tutorial> build() {
    final userProfile = ref.watch(userProfileProvider).value;
    final completedTutorialNames = userProfile?.completedTutorials ?? [];
    final completedTutorials = completedTutorialNames.map((name) => nameMap[name]).whereType<Tutorial>();
    return completedTutorials.toSet();
  }

  Future<void> markTutorialCompleted(Tutorial tutorial) {
    final currentTutorials = state;
    if (currentTutorials.contains(tutorial)) {
      return Future.value();
    }
    state = {...currentTutorials, tutorial};
    return ref.read(userProfileRepoProvider).setTutorialCompleted(tutorial.name);
  }
}
