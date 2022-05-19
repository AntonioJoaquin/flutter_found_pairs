import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/router.dart';

abstract class View {
  /// Routing
  static Map<String, WidgetBuilder> getRoutes() => AppRouter.routes;

  static String getInitialRoute() => AppRouter.homeRoute;

  /// Theming
  static ThemeData get theme => ThemeData(
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
          centerTitle: true,
          color: Colors.transparent,
          elevation: .0,
          iconTheme: const IconThemeData(color: Colors.red),
        ),
      );
}
