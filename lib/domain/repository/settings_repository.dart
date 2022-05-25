abstract class SettingsRepository {
  Future<bool> getSfxEnabled();
  Future<bool> setSfxEnabled(bool isActivated);
  Future<int> getSfxVolume();
  Future<bool> setSfxVolume(int volume);
  Future<bool> getMusicEnabled();
  Future<bool> setMusicEnabled(bool isActivated);
  Future<int> getMusicVolume();
  Future<bool> setMusicVolume(int volume);
}
