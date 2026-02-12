import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/tooltip_type.dart';
import '../repositories/tooltips_repo.dart';

part 'tooltips_notifier.g.dart';

@riverpod
class TooltipsNotifier extends _$TooltipsNotifier {
  @override
  bool build(TooltipType type) {
    return ref.read(tooltipsRepoProvider).get(type);
  }

  Future<void> set(bool value) async {
    state = value;
    return ref.read(tooltipsRepoProvider).setDisplayTooltip(type, value);
  }
}
