import 'package:flutter/material.dart';
import 'package:found_pairs/di/locator.dart';

import '../../../utils/board_utils.dart';
import 'board_manager.dart';
import 'models/card_model.dart';
import 'widgets/custom_card.dart';

class BoardPage extends StatefulWidget {
  const BoardPage({Key? key}) : super(key: key);

  @override
  State<BoardPage> createState() => _BoardPageState();
}

class _BoardPageState extends State<BoardPage> {
  final List<CardModel> _deck = [];

  @override
  void initState() {
    _deck.addAll(BoardUtils.generateDeck(12));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back_rounded,
          color: Colors.red,
        ),
        title: const Text('Board Page'),
      ),
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * .1),
          _Board(_deck),
        ],
      ),
    );
  }
}

class _Board extends StatelessWidget {
  final BoardManager _manager = locator<BoardManager>();

  _Board(
    List<CardModel> deck, {
    Key? key,
  })  : _deck = deck,
        super(key: key);

  final List<CardModel> _deck;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 104 * 6,
      child: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
        ),
        itemCount: _deck.length,
        itemBuilder: (_, index) => _DeckItem(_manager, _deck[index]),
      ),
    );
  }
}

class _DeckItem extends StatelessWidget {
  const _DeckItem(
    BoardManager manager,
    CardModel card, {
    Key? key,
  })  : _manager = manager,
        _card = card,
        super(key: key);

  final BoardManager _manager;
  final CardModel _card;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _card.isPairFounded,
      builder: (_, bool isPairFounded, __) => GestureDetector(
        onTap: () => _onItemTap(isPairFounded),
        child: CustomCard(_card, _manager.checkPair, isPairFounded),
      ),
    );
  }

  void _onItemTap(bool isPairFounded) =>
      (isPairFounded || _card.isFlipped) ? null : _manager.selectCard(_card);
}
