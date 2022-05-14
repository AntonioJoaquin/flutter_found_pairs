import 'dart:async';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';

import '../../common/constants.dart';
import '../../common/custom_notifier.dart';
import '../../view_manager.dart';
import 'models/card_model.dart';
import 'widgets/board_advices.dart';

@injectable
class BoardManager extends ViewManager {
  final CustomValueNotifier<bool> _isInitialCountDown =
      CustomValueNotifier<bool>(true);
  CustomValueNotifier<bool> get isInitialCountDown => _isInitialCountDown;

  final CustomValueNotifier<Duration?> _remainedDuration =
      CustomValueNotifier<Duration?>(null);
  CustomValueNotifier<Duration?> get remainedDuration => _remainedDuration;

  bool _canSelect = false;
  bool get canSelect => _canSelect;

  Timer? _timer;

  CardModel? _firstCardSelected;
  CardModel? _secondCardSelected;

  // setters
  void setCanSelect(bool can) => _canSelect = can;

  void _setFirstCardSelected(CardModel card) {
    _firstCardSelected = card.isFlipped ? null : card;
    card.flip();
  }

  void _setSecondCardSelected(CardModel card) {
    _canSelect = false;
    _secondCardSelected = card;
    card.flip();
  }

  // actions
  void start() {
    _isInitialCountDown.value = false;
    _canSelect = true;

    _remainedDuration.value =
        const Duration(seconds: Constants.gameTimeInSeconds);
    Future.delayed(
      const Duration(seconds: 1),
      () => _timer = Timer.periodic(
        const Duration(seconds: 1),
        (_) => _decreaseDuration(),
      ),
    );
  }

  void _decreaseDuration() {
    final newDuration = _remainedDuration.value!.inSeconds - 1;
    _remainedDuration.value = Duration(seconds: newDuration);

    if (newDuration == 0) {
      _timer!.cancel();
    }
  }

  void selectCard(CardModel card) => card.isFlipped
      ? _setFirstCardSelected(card)
      : (_firstCardSelected != null)
          ? _setSecondCardSelected(card)
          : _setFirstCardSelected(card);

  void checkPair() {
    if (_secondCardSelected != null) {
      Future.delayed(
        const Duration(milliseconds: 300),
        () => (_firstCardSelected!.value == _secondCardSelected!.value)
            ? _pairFounded()
            : _restoreSelectedCards(),
      );
    }
  }

  void _pairFounded() {
    _firstCardSelected!.pairFounded();
    _secondCardSelected!.pairFounded();

    _restoreSelectedCards();
  }

  void _restoreSelectedCards() {
    _firstCardSelected!.flip();
    _firstCardSelected = null;

    _secondCardSelected!.flip();
    _secondCardSelected = null;

    _canSelect = true;
  }

  // shows
  void showWinDialog(BuildContext context) async {
    BoardAdvices.showWinDialog(context);

    AssetsAudioPlayer.newPlayer().open(
      Audio('assets/sounds/win.wav'),
      autoStart: true,
    );
  }

  void dispose() {
    _isInitialCountDown.dispose();
    _remainedDuration.dispose();
  }
}
