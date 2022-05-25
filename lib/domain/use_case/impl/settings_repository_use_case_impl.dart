import 'package:injectable/injectable.dart';

import '../../repository/settings_repository.dart';
import '../settings_use_case.dart';

@Injectable(as: GetSfxEnabledUseCase)
class GetSfxEnabledUseCaseImpl implements GetSfxEnabledUseCase {
  final SettingsRepository _repository;

  GetSfxEnabledUseCaseImpl(this._repository);

  @override
  Future<bool> getSfxEnabled() => _repository.getSfxEnabled();
}

@Injectable(as: SetSfxEnabledUseCase)
class SetSfxEnabledUseCaseImpl implements SetSfxEnabledUseCase {
  final SettingsRepository _repository;

  SetSfxEnabledUseCaseImpl(this._repository);

  @override
  Future<bool> setSfxEnabled(bool isActivated) =>
      _repository.setSfxEnabled(isActivated);
}

@Injectable(as: GetSfxVolumeUseCase)
class GetSfxVolumeUseCaseImpl implements GetSfxVolumeUseCase {
  final SettingsRepository _repository;

  GetSfxVolumeUseCaseImpl(this._repository);

  @override
  Future<int> getSfxVolume() => _repository.getSfxVolume();
}

@Injectable(as: SetSfxVolumeUseCase)
class SetSfxVolumeUseCaseImpl implements SetSfxVolumeUseCase {
  final SettingsRepository _repository;

  SetSfxVolumeUseCaseImpl(this._repository);

  @override
  Future<bool> setSfxVolume(int volume) => _repository.setSfxVolume(volume);
}

@Injectable(as: GetMusicEnabledUseCase)
class GetMusicEnabledUseCaseImpl implements GetMusicEnabledUseCase {
  final SettingsRepository _repository;

  GetMusicEnabledUseCaseImpl(this._repository);

  @override
  Future<bool> getMusicEnabled() => _repository.getMusicEnabled();
}

@Injectable(as: SetMusicEnabledUseCase)
class SetMusicEnabledUseCaseImpl implements SetMusicEnabledUseCase {
  final SettingsRepository _repository;

  SetMusicEnabledUseCaseImpl(this._repository);

  @override
  Future<bool> setMusicEnabled(bool isActivated) =>
      _repository.setMusicEnabled(isActivated);
}

@Injectable(as: GetMusicVolumeUseCase)
class GetMusicVolumeUseCaseImpl implements GetMusicVolumeUseCase {
  final SettingsRepository _repository;

  GetMusicVolumeUseCaseImpl(this._repository);

  @override
  Future<int> getMusicVolume() => _repository.getMusicVolume();
}

@Injectable(as: SetMusicVolumeUseCase)
class SetMusicVolumeUseCaseImpl implements SetMusicVolumeUseCase {
  final SettingsRepository _repository;

  SetMusicVolumeUseCaseImpl(this._repository);

  @override
  Future<bool> setMusicVolume(int volume) => _repository.setMusicVolume(volume);
}
