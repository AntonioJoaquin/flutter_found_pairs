import 'package:found_pairs/utils/router.dart';
import 'package:found_pairs/view/view_manager.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeManager extends ViewManager {
  // navigation
  void navigateToDifficultyMode() =>
      navigationService.pushNamed(AppRouter.difficultyModeRoute);
}
