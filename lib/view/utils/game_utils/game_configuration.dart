import 'package:flutter/material.dart';

import '../../common/constants.dart';
import '../../common/style/card_styles.dart';

enum GameConfiguration {
  easy(
    Constants.easyGamePairCards,
    Constants.easyGameTimeInSeconds,
    CardStyles.easyBackDesign,
  ),
  medium(
    Constants.mediumGamePairCards,
    Constants.mediumGameTimeInSeconds,
    CardStyles.mediumBackDesign,
  ),
  hard(
    Constants.hardGamePairCards,
    Constants.hardGameTimeInSeconds,
    CardStyles.hardBackDesign,
  );

  final int pairsNumber;
  final int timeInSeconds;
  final Gradient cardStyle;

  const GameConfiguration(
    this.pairsNumber,
    this.timeInSeconds,
    this.cardStyle,
  );
}
