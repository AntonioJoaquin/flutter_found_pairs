import 'package:injectable/injectable.dart';

import '../../common/custom_notifier.dart';
import '../../utils/game_utils/difficulty_mode_type.dart';
import '../../utils/router.dart';
import '../../view_manager.dart';

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

  // navigation
  void navigateToBoard() => navigationService.pushNamedWithArguments(
        AppRouter.boardRoute,
        _difficultySelected.value.gameConfiguration,
      );

  void dispose() {
    _difficultySelected.dispose();
  }
}
