import 'package:flutter/widgets.dart';

import '../view/pages/board/board_page.dart';
import '../view/pages/home/home_page.dart';

abstract class AppRouter {
  static const String homeRoute = '/';
  static const String boardRoute = '/board';

  static Map<String, WidgetBuilder> routes = {
    homeRoute: (context) => const HomePage(),
    boardRoute: (context) => const BoardPage(),
  };
}
