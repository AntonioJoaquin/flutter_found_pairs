import 'package:found_pairs/utils/difficulty_mode_type.dart';
import 'package:found_pairs/view/common/custom_notifier.dart';
import 'package:found_pairs/view/view_manager.dart';
import 'package:injectable/injectable.dart';

@injectable
class DifficultyModeManager extends ViewManager {
  final List<String> difficultyModes = [
    'Easy Mode',
    'Medium Mode',
    'Hard Mode',
  ];

  final CustomValueNotifier<DifficultyModeType> _difficultySelected =
      CustomValueNotifier(DifficultyModeType.easy);
  CustomValueNotifier<DifficultyModeType> get difficultySelected =>
      _difficultySelected;

  // setters
  void selectDifficulty(DifficultyModeType type) =>
      _difficultySelected.value = type;

  void dispose() {
    _difficultySelected.dispose();
  }
}
