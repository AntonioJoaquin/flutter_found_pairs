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
  final BoardManager _manager = locator<BoardManager>();

  final List<CardModel> _deck = [];

  @override
  void initState() {
    _deck.addAll(BoardUtils.generateDeck(12));
    _manager.start();

    super.initState();
  }

  @override
  void dispose() {
    _manager.dispose();

    super.dispose();
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
          // SizedBox(height: MediaQuery.of(context).size.height * .1),
          SizedBox(
            height: MediaQuery.of(context).size.height * .1,
            child: Center(child: _Timer(_manager)),
          ),
          _Board(_manager, _deck),
        ],
      ),
    );
  }
}

class _Timer extends StatelessWidget {
  const _Timer(
    BoardManager manager, {
    Key? key,
  })  : _manager = manager,
        super(key: key);

  final BoardManager _manager;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _manager.remainedDuration,
      builder: (_, Duration? remainedDuration, __) => Text(
        remainedDuration != null ? _formatDuration(remainedDuration) : '00:00',
        style: const TextStyle(
          fontSize: 32.0,
          fontWeight: FontWeight.w200,
          letterSpacing: 4.0,
        ),
      ),
    );
  }

  String _formatDuration(Duration remainedDuration) =>
      '${remainedDuration.inMinutes.remainder(60).toString().padLeft(2, '0')} : ${remainedDuration.inSeconds.remainder(60).toString().padLeft(2, '0')}';
}

class _Board extends StatelessWidget {
  const _Board(
    BoardManager manager,
    List<CardModel> deck, {
    Key? key,
  })  : _manager = manager,
        _deck = deck,
        super(key: key);

  final BoardManager _manager;
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
      (isPairFounded || _card.isFlipped || !_manager.canSelect)
          ? null
          : _manager.selectCard(_card);
}
