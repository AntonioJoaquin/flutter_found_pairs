import 'package:flutter/widgets.dart';

import '../../common/style/palette.dart';
import '../../common/style/pictures.dart';
import 'game_configuration.dart';

enum DifficultyModeType {
  easy(
    0,
    Palette.red,
    'Easy Mode',
    Pictures.easyIcon,
    '',
    GameConfiguration.easy,
  ),
  medium(
    1,
    Palette.blue,
    'Medium Mode',
    Pictures.mediumIcon,
    '',
    GameConfiguration.medium,
  ),
  hard(
    2,
    Palette.black,
    'Hard Mode',
    Pictures.hardIcon,
    '',
    GameConfiguration.hard,
  );

  final int id;
  final Color color;
  final String text;
  final String difficultyIcon;
  final String description;
  final GameConfiguration gameConfiguration;

  const DifficultyModeType(
    this.id,
    this.color,
    this.text,
    this.difficultyIcon,
    this.description,
    this.gameConfiguration,
  );
}
