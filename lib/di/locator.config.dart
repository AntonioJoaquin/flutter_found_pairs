// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:flutter/material.dart' as _i5;
import 'package:flutter/widgets.dart' as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../core/services/dialog_service.dart' as _i4;
import '../core/services/navigation_service.dart' as _i8;
import '../data/repository/score_repository_impl.dart' as _i13;
import '../data/repository/settings_repository_impl.dart' as _i16;
import '../domain/repository/score_repository.dart' as _i12;
import '../domain/repository/settings_repository.dart' as _i15;
import '../domain/use_case/impl/score_use_case_impl.dart' as _i22;
import '../domain/use_case/impl/settings_repository_use_case_impl.dart' as _i20;
import '../domain/use_case/score_use_case.dart' as _i21;
import '../domain/use_case/settings_use_case.dart' as _i19;
import '../view/common/services/settings_service.dart' as _i17;
import '../view/pages/board/board_manager.dart' as _i3;
import '../view/pages/difficulty_mode/difficulty_mode_manager.dart' as _i6;
import '../view/pages/home/home_manager.dart' as _i7;
import '../view/pages/ranking/ranking_manager.dart' as _i10;
import '../view/pages/score/score_manager.dart' as _i11;
import '../view/pages/settings/settings_manager.dart' as _i14;
import '../view/pages/splash/splash_manager.dart'
    as _i18; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.BoardManager>(() => _i3.BoardManager());
  gh.lazySingleton<_i4.DialogService>(
      () => _i4.DialogService(get<_i5.GlobalKey<_i5.NavigatorState>>()));
  gh.factory<_i6.DifficultyModeManager>(() => _i6.DifficultyModeManager());
  gh.factory<_i7.HomeManager>(() => _i7.HomeManager());
  gh.lazySingleton<_i8.NavigationService>(
      () => _i8.NavigationService(get<_i9.GlobalKey<_i9.NavigatorState>>()));
  gh.factory<_i10.RankingManager>(() => _i10.RankingManager());
  gh.factory<_i11.ScoreManager>(() => _i11.ScoreManager());
  gh.factory<_i12.ScoreRepository>(() => _i13.ScoreRepositoryImpl());
  gh.factory<_i14.SettingsManager>(() => _i14.SettingsManager());
  gh.factory<_i15.SettingsRepository>(() => _i16.SettingsRepositoryImpl());
  gh.lazySingleton<_i17.SettingsService>(() => _i17.SettingsService());
  gh.factory<_i18.SplashManager>(() => _i18.SplashManager());
  gh.factory<_i19.GetMusicEnabledUseCase>(
      () => _i20.GetMusicEnabledUseCaseImpl(get<_i15.SettingsRepository>()));
  gh.factory<_i19.GetMusicVolumeUseCase>(
      () => _i20.GetMusicVolumeUseCaseImpl(get<_i15.SettingsRepository>()));
  gh.factory<_i21.GetScoresUseCase>(
      () => _i22.GetScoreUseCaseImpl(get<_i12.ScoreRepository>()));
  gh.factory<_i19.GetSfxEnabledUseCase>(
      () => _i20.GetSfxEnabledUseCaseImpl(get<_i15.SettingsRepository>()));
  gh.factory<_i19.GetSfxVolumeUseCase>(
      () => _i20.GetSfxVolumeUseCaseImpl(get<_i15.SettingsRepository>()));
  gh.factory<_i19.GetThemeModeUseCase>(
      () => _i20.GetThemeModeUseCaseImpl(get<_i15.SettingsRepository>()));
  gh.factory<_i21.SaveScoreUseCase>(
      () => _i22.SaveScoreUseCaseImpl(get<_i12.ScoreRepository>()));
  gh.factory<_i19.SetMusicEnabledUseCase>(
      () => _i20.SetMusicEnabledUseCaseImpl(get<_i15.SettingsRepository>()));
  gh.factory<_i19.SetMusicVolumeUseCase>(
      () => _i20.SetMusicVolumeUseCaseImpl(get<_i15.SettingsRepository>()));
  gh.factory<_i19.SetSfxEnabledUseCase>(
      () => _i20.SetSfxEnabledUseCaseImpl(get<_i15.SettingsRepository>()));
  gh.factory<_i19.SetSfxVolumeUseCase>(
      () => _i20.SetSfxVolumeUseCaseImpl(get<_i15.SettingsRepository>()));
  gh.factory<_i19.SetThemeModeUseCase>(
      () => _i20.SetThemeModeUseCaseImpl(get<_i15.SettingsRepository>()));
  return get;
}
