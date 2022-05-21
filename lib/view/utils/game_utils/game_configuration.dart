import 'package:flutter/material.dart';

import '../../common/constants.dart';
import '../../common/style/card_styles.dart';
import '../../common/style/pictures.dart';

enum GameConfiguration {
  easy(
    Constants.easyGamePairCards,
    Constants.easyGameTimeInSeconds,
    CardStyles.easyBackDesign,
    Pictures.easyIcon,
  ),
  medium(
    Constants.mediumGamePairCards,
    Constants.mediumGameTimeInSeconds,
    CardStyles.mediumBackDesign,
    Pictures.mediumIcon,
  ),
  hard(
    Constants.hardGamePairCards,
    Constants.hardGameTimeInSeconds,
    CardStyles.hardBackDesign,
    Pictures.hardIcon,
  );

  final int pairsNumber;
  final int timeInSeconds;
  final Gradient cardStyle;
  final String difficultyIcon;

  const GameConfiguration(
    this.pairsNumber,
    this.timeInSeconds,
    this.cardStyle,
    this.difficultyIcon,
  );
}
