import 'package:injectable/injectable.dart';

import '../../../core/common/custom_notifiers.dart';
import '../../../di/locator.dart';
import '../../../domain/use_case/settings_use_case.dart';
import '../../view_manager.dart';

@injectable
class SettingsManager extends ViewManager {
  final GetGameFinishedSoundsUseCase _getGameFinishedSoundsUseCase =
      locator<GetGameFinishedSoundsUseCase>();
  final SetGameFinishedSoundsUseCase _setGameFinishedSoundsUseCase =
      locator<SetGameFinishedSoundsUseCase>();

  final CustomValueNotifier<bool> _isGameFinishedSoundsActivated =
      CustomValueNotifier<bool>(true);
  CustomValueNotifier<bool> get isGameFinishedSoundsActivated =>
      _isGameFinishedSoundsActivated;

  // actions
  void init() async {
    _isGameFinishedSoundsActivated.value =
        await _getGameFinishedSoundsUseCase.getGameFinishedSounds();
  }

  void setGameFinishedSounds(bool newValue) async {
    _isGameFinishedSoundsActivated.value = newValue;
    await _setGameFinishedSoundsUseCase.setGameFinishedSounds(newValue);
  }

  @override
  void dispose() {
    _isGameFinishedSoundsActivated.dispose();

    super.dispose();
  }
}
