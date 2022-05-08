import '../view/pages/board/models/card_model.dart';

abstract class BoardUtils {
  static final List<String> _cardValues = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
  ];

  static List<CardModel> generateDeck(int numPairs) {
    final _deck = <CardModel>[];

    for (int i = 0; i < numPairs; i++) {
      _deck.add(CardModel(i, _cardValues[i]));
      _deck.add(CardModel(i, _cardValues[i]));
    }
    _deck.shuffle();

    return _deck;
  }
}
