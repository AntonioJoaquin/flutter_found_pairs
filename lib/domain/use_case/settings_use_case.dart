abstract class GetGameFinishedSoundsUseCase {
  Future<bool> getGameFinishedSounds();
}

abstract class SetGameFinishedSoundsUseCase {
  Future<bool> setGameFinishedSounds(bool isActivated);
}
