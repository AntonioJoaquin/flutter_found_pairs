import 'package:flutter/material.dart';

import '../../common/constants.dart';
import '../../common/style/card_styles.dart';
import '../../common/style/pictures.dart';

enum GameConfiguration {
  easy(
    Constants.easyGamePairCards,
    Constants.easyGameTimeInSeconds,
    Constants.easyCardColumns,
    CardStyles.easyBackDesign,
    Pictures.easyIcon,
  ),
  medium(
    Constants.mediumGamePairCards,
    Constants.mediumGameTimeInSeconds,
    Constants.mediumCardColumns,
    CardStyles.mediumBackDesign,
    Pictures.mediumIcon,
  ),
  hard(
    Constants.hardGamePairCards,
    Constants.hardGameTimeInSeconds,
    Constants.hardCardColumns,
    CardStyles.hardBackDesign,
    Pictures.hardIcon,
  );

  final int pairsNumber;
  final int timeInSeconds;
  final int cardColumns;
  final Gradient cardStyle;
  final String difficultyIcon;

  const GameConfiguration(
    this.pairsNumber,
    this.timeInSeconds,
    this.cardColumns,
    this.cardStyle,
    this.difficultyIcon,
  );
}
