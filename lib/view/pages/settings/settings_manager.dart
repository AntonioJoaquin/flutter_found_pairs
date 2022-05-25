import 'package:injectable/injectable.dart';

import '../../../di/locator.dart';
import '../../../domain/use_case/settings_use_case.dart';
import '../../common/services/settings_service.dart';
import '../../view_manager.dart';

@injectable
class SettingsManager extends ViewManager {
  final SetSfxEnabledUseCase _setSfxEnabledUseCase =
      locator<SetSfxEnabledUseCase>();
  final SetMusicEnabledUseCase _setMusicEnabledUseCase =
      locator<SetMusicEnabledUseCase>();

  final SettingsService _settingsService = locator<SettingsService>();
  SettingsService get settingsService => _settingsService;

  // setters
  void setSfxEnabled(bool newValue) async {
    _settingsService.setSfxEnabled(newValue);
    await _setSfxEnabledUseCase.setSfxEnabled(newValue);
  }

  void setMusicEnabled(bool newValue) async {
    _settingsService.setMusicEnabled(newValue);
    await _setMusicEnabledUseCase.setMusicEnabled(newValue);
  }
}
