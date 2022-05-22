// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:flutter/material.dart' as _i5;
import 'package:flutter/widgets.dart' as _i12;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../core/services/dialog_service.dart' as _i4;
import '../core/services/navigation_service.dart' as _i11;
import '../domain/repository/score_repository.dart' as _i9;
import '../domain/use_case/impl/score_use_case_impl.dart' as _i8;
import '../domain/use_case/score_use_case.dart' as _i7;
import '../view/pages/board/board_manager.dart' as _i3;
import '../view/pages/difficulty_mode/difficulty_mode_manager.dart' as _i6;
import '../view/pages/home/home_manager.dart' as _i10;
import '../view/pages/ranking/ranking_manager.dart'
    as _i13; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.BoardManager>(() => _i3.BoardManager());
  gh.lazySingleton<_i4.DialogService>(
      () => _i4.DialogService(get<_i5.GlobalKey<_i5.NavigatorState>>()));
  gh.factory<_i6.DifficultyModeManager>(() => _i6.DifficultyModeManager());
  gh.factory<_i7.GetScoresUseCase>(
      () => _i8.GetScoreUseCaseImpl(get<_i9.ScoreRepository>()));
  gh.factory<_i10.HomeManager>(() => _i10.HomeManager());
  gh.lazySingleton<_i11.NavigationService>(
      () => _i11.NavigationService(get<_i12.GlobalKey<_i12.NavigatorState>>()));
  gh.factory<_i13.RankingManager>(() => _i13.RankingManager());
  gh.factory<_i7.SaveScoreUseCase>(
      () => _i8.SaveScoreUseCaseImpl(get<_i9.ScoreRepository>()));
  return get;
}
