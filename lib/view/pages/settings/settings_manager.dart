import 'package:injectable/injectable.dart';

import '../../../di/locator.dart';
import '../../../domain/use_case/settings_use_case.dart';
import '../../common/services/settings_service.dart';
import '../../view_manager.dart';

@injectable
class SettingsManager extends ViewManager {
  final SetSfxEnabledUseCase _setSfxEnabledUseCase =
      locator<SetSfxEnabledUseCase>();
  final SetSfxVolumeUseCase _setSfxVolumeUseCase =
      locator<SetSfxVolumeUseCase>();
  final SetMusicEnabledUseCase _setMusicEnabledUseCase =
      locator<SetMusicEnabledUseCase>();
  final SetMusicVolumeUseCase _setMusicVolumeUseCase =
      locator<SetMusicVolumeUseCase>();

  final SettingsService _settingsService = locator<SettingsService>();
  SettingsService get settingsService => _settingsService;

  // setters
  void setSfxEnabled(bool newValue) async {
    _settingsService.setSfxEnabled(newValue);
    await _setSfxEnabledUseCase.setSfxEnabled(newValue);
  }

  void setSfxVolume(double volume) async {
    _settingsService.setSfxVolume(volume);
    await _setSfxVolumeUseCase.setSfxVolume(volume);
  }

  void setMusicEnabled(bool newValue) async {
    _settingsService.setMusicEnabled(newValue);
    await _setMusicEnabledUseCase.setMusicEnabled(newValue);
  }

  void setMusicVolume(double volume) async {
    _settingsService.setMusicVolume(volume);
    await _setMusicVolumeUseCase.setMusicVolume(volume);
  }
}
