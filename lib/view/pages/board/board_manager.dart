import 'package:injectable/injectable.dart';

import 'models/card_model.dart';

@Injectable()
class BoardManager {
  bool _canSelect = true;
  bool get canSelect => _canSelect;

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
}
