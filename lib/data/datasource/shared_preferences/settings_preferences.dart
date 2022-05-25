import 'package:shared_preferences/shared_preferences.dart';

abstract class SettingsPreferences {
  static const String _sfxEnabledKey = 'sfxEnabled';
  static const String _sfxVolumeKey = 'sfxVolume';
  static const String _musicEnabledKey = 'musicEnabled';
  static const String _musicVolumeKey = 'musicVolume';

  // getters
  static Future<bool> get sfxEnabled async =>
      (await SharedPreferences.getInstance()).getBool(_sfxEnabledKey) ?? true;

  static Future<double> get sfxVolume async =>
      (await SharedPreferences.getInstance()).getDouble(_sfxVolumeKey) ?? .5;

  static Future<bool> get musicEnabled async =>
      (await SharedPreferences.getInstance()).getBool(_musicEnabledKey) ?? true;

  static Future<double> get musicVolume async =>
      (await SharedPreferences.getInstance()).getDouble(_musicVolumeKey) ?? .5;

  // setters
  static Future<void> setSfxEnabled(bool isActivated) async =>
      await (await SharedPreferences.getInstance())
          .setBool(_sfxEnabledKey, isActivated);

  static Future<void> setSfxVolume(double volume) async =>
      await (await SharedPreferences.getInstance())
          .setDouble(_sfxVolumeKey, volume);

  static Future<void> setMusicEnabled(bool isActivated) async =>
      await (await SharedPreferences.getInstance())
          .setBool(_musicEnabledKey, isActivated);

  static Future<void> setMusicVolume(double volume) async =>
      await (await SharedPreferences.getInstance())
          .setDouble(_musicVolumeKey, volume);

  Future<void> removeSettings() async =>
      await (await SharedPreferences.getInstance()).clear();
}
