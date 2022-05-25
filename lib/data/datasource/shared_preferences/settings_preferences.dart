import 'package:shared_preferences/shared_preferences.dart';

abstract class SettingsPreferences {
  static const String _sfxEnabledKey = 'sfxEnabled';
  static const String _sfxVolumeKey = 'sfxVolume';
  static const String _musicEnabledKey = 'musicEnabled';
  static const String _musicVolumeKey = 'musicVolume';

  // getters
  static Future<bool> get sfxEnabled async =>
      (await SharedPreferences.getInstance()).getBool(_sfxEnabledKey) ?? true;

  static Future<int> get sfxVolume async =>
      (await SharedPreferences.getInstance()).getInt(_sfxVolumeKey) ?? 50;

  static Future<bool> get musicEnabled async =>
      (await SharedPreferences.getInstance()).getBool(_musicEnabledKey) ?? true;

  static Future<int> get musicVolume async =>
      (await SharedPreferences.getInstance()).getInt(_musicVolumeKey) ?? 50;

  // setters
  static Future<void> setSfxEnabled(bool isActivated) async =>
      await (await SharedPreferences.getInstance())
          .setBool(_sfxEnabledKey, isActivated);

  static Future<void> setSfxVolume(int volume) async =>
      await (await SharedPreferences.getInstance())
          .setInt(_sfxVolumeKey, volume);

  static Future<void> setMusicEnabled(bool isActivated) async =>
      await (await SharedPreferences.getInstance())
          .setBool(_musicEnabledKey, isActivated);

  static Future<void> setMusicVolume(int volume) async =>
      await (await SharedPreferences.getInstance())
          .setInt(_musicVolumeKey, volume);

  Future<void> removeSettings() async =>
      await (await SharedPreferences.getInstance()).clear();
}
