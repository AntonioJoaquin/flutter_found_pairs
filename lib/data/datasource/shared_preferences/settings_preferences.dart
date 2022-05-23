import 'package:shared_preferences/shared_preferences.dart';

abstract class SettingsPreferences {
  static const String _finishedGameSoundsKey = 'finishedGameSounds';

  static Future<bool> get finishedGameSounds async =>
      (await SharedPreferences.getInstance()).getBool(_finishedGameSoundsKey) ??
      true;

  static Future<void> setFinishedGameSounds(bool isActivated) async =>
      await (await SharedPreferences.getInstance())
          .setBool(_finishedGameSoundsKey, isActivated);

  Future<void> removeSettings() async =>
      await (await SharedPreferences.getInstance()).clear();
}
