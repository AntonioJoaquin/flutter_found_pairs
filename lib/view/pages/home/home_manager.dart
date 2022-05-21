import 'package:injectable/injectable.dart';

import '../../utils/router.dart';
import '../../view_manager.dart';

@injectable
class HomeManager extends ViewManager {
  // navigation
  void navigateToDifficultyMode() =>
      navigationService.pushNamed(AppRouter.difficultyModeRoute);
}
