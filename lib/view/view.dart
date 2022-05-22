import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'utils/router.dart';
import '../core/common/palette.dart';

abstract class View {
  /// Routing
  static Route<dynamic> getRoutes(RouteSettings settings) =>
      AppRouter.generateRoute(settings);

  static String getInitialRoute() => AppRouter.homeRoute;

  /// Theming
  static ThemeData get theme => ThemeData(
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.w300,
            color: Palette.red,
          ),
          centerTitle: true,
          color: Palette.transparent,
          elevation: .0,
          iconTheme: const IconThemeData(color: Palette.red),
        ),
        textTheme: const TextTheme(
          bodyText1: TextStyle(),
          bodyText2: TextStyle(),
        ).apply(
          bodyColor: Palette.item,
          displayColor: Palette.item,
        ),
        inputDecorationTheme: InputDecorationTheme(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: const BorderSide(color: Palette.red),
          ),
          focusColor: Palette.red,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
      );
}
