import 'package:flutter/material.dart';

import 'di/locator.dart';
import 'view/pages/board/board_page.dart';
import 'view/view.dart';

void main() {
  setUpLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: const BoardPage(),
      theme: View.theme,
    );
  }
}
