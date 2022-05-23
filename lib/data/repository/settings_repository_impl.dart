import 'package:injectable/injectable.dart';

import '../../domain/repository/settings_repository.dart';
import '../datasource/shared_preferences/settings_preferences.dart';

@Injectable(as: SettingsRepository)
class SettingsRepositoryImpl implements SettingsRepository {
  @override
  Future<bool> getGameFinishedSounds() =>
      SettingsPreferences.finishedGameSounds;

  @override
  Future<bool> setGameFinishedSounds(bool isActivated) async {
    await SettingsPreferences.setFinishedGameSounds(isActivated);

    return true;
  }
}
