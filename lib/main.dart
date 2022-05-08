import 'package:flutter/material.dart';

import 'di/locator.dart';
import 'view/view.dart';

void main() {
  setUpLocator();
  final _navigatorKey = navigatorKeyBuilder(GlobalKey<NavigatorState>());

  runApp(MyApp(_navigatorKey));
}

class MyApp extends StatelessWidget {
  const MyApp(
    this._navigatorKey, {
    Key? key,
  }) : super(key: key);

  final GlobalKey<NavigatorState> _navigatorKey;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      navigatorKey: _navigatorKey,
      theme: View.theme,
      routes: View.getRoutes(),
      initialRoute: View.getInitialRoute(),
    );
  }
}
