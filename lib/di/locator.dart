import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../data/datasource/local/database/app_database.dart';
import 'locator.config.dart';

final locator = GetIt.instance;

@injectableInit
void setUpLocator() {
  _init(locator);
  $initGetIt(locator);
}

GlobalKey<NavigatorState> navigatorKeyBuilder(
    GlobalKey<NavigatorState> navigatorKey) {
  locator.registerLazySingleton<GlobalKey<NavigatorState>>(() => navigatorKey);

  return navigatorKey;
}

void _init(GetIt locator) {
  _openStore();
}

void _openStore() => AppDatabase.appDatabase.open();
