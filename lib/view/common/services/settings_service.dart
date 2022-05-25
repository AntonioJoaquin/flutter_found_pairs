import 'package:injectable/injectable.dart';

import '../../../core/common/custom_notifiers.dart';
import '../../../di/locator.dart';
import '../../../domain/use_case/settings_use_case.dart';

@lazySingleton
class SettingsService {
  final GetSfxEnabledUseCase _getSfxEnabledUseCase =
      locator<GetSfxEnabledUseCase>();
  final GetMusicEnabledUseCase _getMusicEnabledUseCase =
      locator<GetMusicEnabledUseCase>();

  final CustomValueNotifier<bool> _isSfxEnabled =
      CustomValueNotifier<bool>(true);
  CustomValueNotifier<bool> get isSfxEnabled => _isSfxEnabled;

  final CustomValueNotifier<bool> _isMusicEnabled =
      CustomValueNotifier<bool>(true);
  CustomValueNotifier<bool> get isMusicEnabled => _isMusicEnabled;

  // actions
  Future<void> init() async {
    isSfxEnabled.value = await _getSfxEnabledUseCase.getSfxEnabled();
    isMusicEnabled.value = await _getMusicEnabledUseCase.getMusicEnabled();
  }

  // setters
  void setSfxEnabled(bool newValue) async => _isSfxEnabled.value = newValue;

  void setMusicEnabled(bool newValue) async => _isMusicEnabled.value = newValue;

  void dispose() {
    _isSfxEnabled.dispose();
    _isMusicEnabled.dispose();
  }
}
