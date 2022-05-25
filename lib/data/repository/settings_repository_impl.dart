import 'package:injectable/injectable.dart';

import '../../domain/repository/settings_repository.dart';
import '../datasource/shared_preferences/settings_preferences.dart';

@Injectable(as: SettingsRepository)
class SettingsRepositoryImpl implements SettingsRepository {
  @override
  Future<bool> getMusicEnabled() async =>
      await SettingsPreferences.musicEnabled;

  @override
  Future<int> getMusicVolume() async => await SettingsPreferences.musicVolume;

  @override
  Future<bool> getSfxEnabled() async => await SettingsPreferences.sfxEnabled;

  @override
  Future<int> getSfxVolume() async => await SettingsPreferences.sfxVolume;

  @override
  Future<bool> setMusicEnabled(bool isActivated) async {
    await SettingsPreferences.setMusicEnabled(isActivated);

    return true;
  }

  @override
  Future<bool> setMusicVolume(int volume) async {
    await SettingsPreferences.setMusicVolume(volume);

    return true;
  }

  @override
  Future<bool> setSfxEnabled(bool isActivated) async {
    await SettingsPreferences.setSfxEnabled(isActivated);

    return true;
  }

  @override
  Future<bool> setSfxVolume(int volume) async {
    await SettingsPreferences.setSfxVolume(volume);

    return true;
  }
}
