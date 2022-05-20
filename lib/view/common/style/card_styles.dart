import 'package:flutter/material.dart';

import 'palette.dart';

abstract class CardStyles {
  static Gradient get easyBackDesign => const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [.4, .4, .6, .6],
        colors: [
          Palette.red,
          Palette.black,
          Palette.black,
          Palette.white,
        ],
      );

  static Gradient get mediumBackDesign => const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [.4, .4, .5, .5, .6, .6],
        colors: [
          Palette.blue,
          Palette.red,
          Palette.red,
          Palette.black,
          Palette.black,
          Palette.white,
        ],
      );

  static Gradient get hardBackDesign => const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [.4, .4, .5, .5, .6, .6],
        colors: [
          Palette.black,
          Palette.yellow,
          Palette.yellow,
          Palette.black,
          Palette.black,
          Palette.white,
        ],
      );
}
