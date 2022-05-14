// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:flutter/material.dart' as _i5;
import 'package:flutter/widgets.dart' as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../services/dialog_service.dart' as _i4;
import '../services/navigation_service.dart' as _i7;
import '../view/pages/board/board_manager.dart' as _i3;
import '../view/pages/home/home_manager.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.BoardManager>(() => _i3.BoardManager());
  gh.lazySingleton<_i4.DialogService>(
      () => _i4.DialogService(get<_i5.GlobalKey<_i5.NavigatorState>>()));
  gh.factory<_i6.HomeManager>(() => _i6.HomeManager());
  gh.lazySingleton<_i7.NavigationService>(
      () => _i7.NavigationService(get<_i8.GlobalKey<_i8.NavigatorState>>()));
  return get;
}
