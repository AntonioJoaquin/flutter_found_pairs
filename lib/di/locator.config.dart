// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:flutter/widgets.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../services/navigation_service.dart' as _i5;
import '../view/pages/board/board_manager.dart' as _i3;
import '../view/pages/home/home_manager.dart'
    as _i4; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.BoardManager>(() => _i3.BoardManager());
  gh.factory<_i4.HomeManager>(() => _i4.HomeManager());
  gh.lazySingleton<_i5.NavigationService>(
      () => _i5.NavigationService(get<_i6.GlobalKey<_i6.NavigatorState>>()));
  return get;
}
