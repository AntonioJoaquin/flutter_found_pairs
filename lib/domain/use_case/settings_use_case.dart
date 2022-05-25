abstract class GetSfxEnabledUseCase {
  Future<bool> getSfxEnabled();
}

abstract class SetSfxEnabledUseCase {
  Future<bool> setSfxEnabled(bool isActivated);
}

abstract class GetSfxVolumeUseCase {
  Future<int> getSfxVolume();
}

abstract class SetSfxVolumeUseCase {
  Future<bool> setSfxVolume(int volume);
}

abstract class GetMusicEnabledUseCase {
  Future<bool> getMusicEnabled();
}

abstract class SetMusicEnabledUseCase {
  Future<bool> setMusicEnabled(bool isActivated);
}

abstract class GetMusicVolumeUseCase {
  Future<int> getMusicVolume();
}

abstract class SetMusicVolumeUseCase {
  Future<bool> setMusicVolume(int volume);
}
