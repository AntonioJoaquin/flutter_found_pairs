import 'package:found_pairs/view/utils/router.dart';
import 'package:injectable/injectable.dart';

import '../../view_manager.dart';

@injectable
class SplashManager extends ViewManager {
  // navigation
  @override
  void navigateToHome() =>
      navigationService.pushNamedAndRemoveUntil(AppRouter.homeRoute);
}
