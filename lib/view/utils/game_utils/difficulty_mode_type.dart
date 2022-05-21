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
    'Difficulty for beginners:\n\n- Pokemon to catch: 6\n- Seconds to catch them all: 60',
    GameConfiguration.easy,
  ),
  medium(
    1,
    Palette.blue,
    'Medium Mode',
    Pictures.mediumIcon,
    'Difficulty for a balanced game:\n\n- Pokemon to catch: 8\n- Seconds to catch them all: 50',
    GameConfiguration.medium,
  ),
  hard(
    2,
    Palette.black,
    'Hard Mode',
    Pictures.hardIcon,
    'Difficult for those looking for a challenge:\n\n- Pokemon to catch: 12\n- Seconds to catch them all: 40',
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
