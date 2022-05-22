import 'dart:io';

import 'package:flutter/cupertino.dart';

import '../pages/board/board_page.dart';
import '../pages/difficulty_mode/difficulty_mode_page.dart';
import '../pages/home/home_page.dart';
import '../pages/ranking/ranking_page.dart';
import 'game_utils/game_configuration.dart';

abstract class AppRouter {
  static const String homeRoute = '/';
  static const String rankingRoute = '/ranking';
  static const String difficultyModeRoute = '/difficulty_mode';
  static const String boardRoute = '/board';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return _fadeRoute(const HomePage(), homeRoute);

      case rankingRoute:
        return _fadeRoute(const RankingPage(), rankingRoute);

      case difficultyModeRoute:
        return _fadeRoute(const DifficultyModePage(), difficultyModeRoute);

      case boardRoute:
        return _fadeRoute(
          BoardPage(settings.arguments as GameConfiguration),
          boardRoute,
        );

      default:
        return _fadeRoute(const HomePage(), homeRoute);
    }
  }

  static PageRoute _fadeRoute(Widget child, String routeName) =>
      PageRouteBuilder(
        settings: RouteSettings(name: routeName),
        pageBuilder: (_, __, ___) => child,
        transitionDuration: const Duration(milliseconds: 200),
        transitionsBuilder: (_, animation, __, ___) => Platform.isAndroid
            ? FadeTransition(
                opacity: animation,
                child: child,
              )
            : CupertinoPageTransition(
                primaryRouteAnimation: animation,
                secondaryRouteAnimation: __,
                child: child,
                linearTransition: true,
              ),
      );
}
