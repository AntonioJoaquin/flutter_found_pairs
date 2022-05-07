import 'package:flutter/material.dart';

abstract class View {
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
