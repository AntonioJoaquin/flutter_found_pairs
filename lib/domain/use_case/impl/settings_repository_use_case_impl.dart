import 'package:injectable/injectable.dart';

import '../../repository/settings_repository.dart';
import '../settings_use_case.dart';

@Injectable(as: GetGameFinishedSoundsUseCase)
class GetGameFinishedSoundsUseCaseImpl implements GetGameFinishedSoundsUseCase {
  final SettingsRepository _repository;

  GetGameFinishedSoundsUseCaseImpl(this._repository);

  @override
  Future<bool> getGameFinishedSounds() => _repository.getGameFinishedSounds();
}

@Injectable(as: SetGameFinishedSoundsUseCase)
class SetGameFinishedSoundsUseCaseImpl implements SetGameFinishedSoundsUseCase {
  final SettingsRepository _repository;

  SetGameFinishedSoundsUseCaseImpl(this._repository);

  @override
  Future<bool> setGameFinishedSounds(bool isActivated) =>
      _repository.setGameFinishedSounds(isActivated);
}
