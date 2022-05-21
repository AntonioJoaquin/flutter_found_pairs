import 'package:flutter/widgets.dart';

import '../pages/board/board_page.dart';
import '../pages/difficulty_mode/difficulty_mode_page.dart';
import '../pages/home/home_page.dart';

abstract class AppRouter {
  static const String homeRoute = '/';
  static const String difficultyModeRoute = '/difficulty_mode';
  static const String boardRoute = '/board';

  static Map<String, WidgetBuilder> routes = {
    homeRoute: (context) => const HomePage(),
    difficultyModeRoute: (context) => const DifficultyModePage(),
    boardRoute: (context) => const BoardPage(),
  };
}
