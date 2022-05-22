import 'dart:async';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:found_pairs/view/pages/score/score_arguments.dart';
import 'package:injectable/injectable.dart';

import '../../../core/common/custom_notifiers.dart';
import '../../../core/common/play_dialog_types.dart';
import '../../utils/game_utils/game_configuration.dart';
import '../../utils/router.dart';
import '../../view_manager.dart';
import 'models/card_model.dart';

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

  int _points = 0;

  Timer? _timer;

  CardModel? _firstCardSelected;
  CardModel? _secondCardSelected;

  late GameConfiguration _gameConfiguration;

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
  void start(GameConfiguration gameConfiguration) {
    _gameConfiguration = gameConfiguration;
    _isInitialCountDown.value = false;
    _canSelect = true;

    _remainedDuration.value = Duration(
      seconds: gameConfiguration.timeInSeconds,
    );
    Future.delayed(
      const Duration(seconds: 1),
      () => {}, // _initTimer(),
    );
  }

  void _initTimer() => _timer = Timer.periodic(
        const Duration(seconds: 1),
        (_) => _decreaseDuration(),
      );

  void _decreaseDuration() {
    final newDuration = _remainedDuration.value!.inSeconds - 1;
    _remainedDuration.value = Duration(seconds: newDuration);

    if (newDuration == 0) {
      _showLoseDialog();
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

    _points++;

    (_points == _gameConfiguration.pairsNumber)
        ? _gameWon()
        : _restoreSelectedCards();
  }

  void _gameWon() {
    _timer?.cancel();

    Future.delayed(
      const Duration(milliseconds: 300),
      (() => _showWinDialog()),
    );
  }

  void _restoreSelectedCards() {
    _firstCardSelected!.flip();
    _firstCardSelected = null;

    _secondCardSelected!.flip();
    _secondCardSelected = null;

    _canSelect = true;
  }

  void _resume() {
    navigationService.pop(); // Close dialog
    _initTimer();
  }

  void _retry() {
    navigationService.pop(); // Close dialog
    navigationService.pushReplacement(AppRouter.boardRoute);
  }

  // shows
  void _showWinDialog() async {
    dialogService.showPlayDialog(PlayDialogType.win, [
      () {},
      _navigateToScore,
      navigateToHome,
    ]);

    AssetsAudioPlayer.newPlayer().open(
      Audio('assets/sounds/win.wav'),
      autoStart: true,
    );
  }

  void _showLoseDialog() async {
    dialogService.showPlayDialog(PlayDialogType.lose, [
      _retry,
      navigateToHome,
    ]);

    AssetsAudioPlayer.newPlayer().open(
      Audio('assets/sounds/lose.wav'),
      autoStart: true,
    );
  }

  Future<bool> showPauseDialog() async {
    _timer?.cancel();

    dialogService.showPlayDialog(PlayDialogType.pause, [
      navigateToHome,
      _resume,
    ]);

    return false;
  }

  // navigation
  @override
  void navigateToHome() {
    _timer?.cancel();

    super.navigateToHome();
  }

  void _navigateToScore() => navigationService.pushNamedWithArguments(
        AppRouter.scoreRoute,
        ScoreArguments(
          _gameConfiguration.pairsNumber,
          _remainedDuration.value!.inSeconds,
        ),
      );

  @override
  void dispose() {
    _isInitialCountDown.dispose();
    _remainedDuration.dispose();

    super.dispose();
  }
}
