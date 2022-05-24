import 'package:flutter/widgets.dart';
import 'package:found_pairs/view/common/services/audio_service.dart';
import 'package:found_pairs/view/utils/router.dart';
import 'package:injectable/injectable.dart';

import '../../../core/common/custom_notifiers.dart';
import '../../../di/locator.dart';
import '../../view_manager.dart';

@injectable
class SplashManager extends ViewManager {
  // actions
  void initAudioService() {
    final AudioService audioService = AudioService();
    audioService.attachLifecycleNotifier(
      locator<CustomValueNotifier<AppLifecycleState>>(),
    );
    audioService.initialize();
    audioService.startMusic();

    locator.registerLazySingleton(() => audioService);
  }

  // navigation
  @override
  void navigateToHome() =>
      navigationService.pushNamedAndRemoveUntil(AppRouter.homeRoute);
}
