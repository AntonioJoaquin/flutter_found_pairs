import 'package:flutter/widgets.dart';
import 'package:found_pairs/view/common/style/pictures.dart';

import '../common/style/palette.dart';

enum DifficultyModeType {
  easy(
    0,
    Palette.red,
    'Easy Mode',
    Pictures.easyIcon,
    '',
  ),
  medium(
    1,
    Palette.blue,
    'Medium Mode',
    Pictures.mediumIcon,
    '',
  ),
  hard(
    2,
    Palette.black,
    'Hard Mode',
    Pictures.hardIcon,
    '',
  );

  final int id;
  final Color color;
  final String text;
  final String difficultyIcon;
  final String description;

  const DifficultyModeType(
    this.id,
    this.color,
    this.text,
    this.difficultyIcon,
    this.description,
  );
}
