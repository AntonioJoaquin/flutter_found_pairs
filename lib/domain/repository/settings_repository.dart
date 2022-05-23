abstract class SettingsRepository {
  Future<bool> getGameFinishedSounds();
  Future<bool> setGameFinishedSounds(bool isActivated);
}
