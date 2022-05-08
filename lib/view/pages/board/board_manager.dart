import 'package:found_pairs/view/pages/board/models/card_model.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class BoardManager {
  CardModel? _firstCardSelected;

  // setters
  void _setFirstCardSelected(CardModel card) {
    _firstCardSelected = card.isFlipped ? null : card;
    card.flip();
  }

  // actions
  void selectCard(CardModel card) => card.isFlipped
      ? _setFirstCardSelected(card)
      : (_firstCardSelected != null)
          ? _checkPair(card)
          : _setFirstCardSelected(card);

  void _checkPair(CardModel card) {}
}
