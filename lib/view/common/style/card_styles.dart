import 'package:flutter/material.dart';

abstract class CardStyles {
  static Gradient get backDesign => const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [.4, .4, .6, .6],
        colors: [
          Colors.red,
          Colors.black,
          Colors.black,
          Colors.white,
        ],
      );
}
