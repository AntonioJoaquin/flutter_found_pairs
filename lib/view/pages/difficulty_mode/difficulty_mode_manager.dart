import 'package:injectable/injectable.dart';

import '../../../di/locator.dart';
import '../../common/custom_notifier.dart';
import '../../utils/game_utils/difficulty_mode_type.dart';
import '../../utils/game_utils/game_configuration.dart';
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

  // actions
  void _saveGameConfiguration() => locator.registerSingleton<GameConfiguration>(
        _difficultySelected.value.gameConfiguration,
      );

  // navigation
  void navigateToBoard() {
    _saveGameConfiguration();

    navigationService.pushNamed(AppRouter.boardRoute);
  }

  void dispose() {
    _difficultySelected.dispose();
  }
}
