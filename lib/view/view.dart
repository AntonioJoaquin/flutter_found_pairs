import 'package:flutter/material.dart';

import '../utils/router.dart';

abstract class View {
  /// Routing
  static Map<String, WidgetBuilder> getRoutes() => AppRouter.routes;

  static String getInitialRoute() => AppRouter.homeRoute;

  /// Theming
  static ThemeData get theme => ThemeData(
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
          color: Colors.transparent,
          elevation: .0,
        ),
      );
}
