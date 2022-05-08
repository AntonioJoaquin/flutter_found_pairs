import 'package:flutter/material.dart';

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
    _deck.addAll(CardModel.generateDeck(12));

    super.initState();
  }

  @override
  void dispose() {
    for (CardModel card in _deck) {
      card.dispose();
    }

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
          SizedBox(height: MediaQuery.of(context).size.height * .1),
          SizedBox(
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
              itemBuilder: (_, index) => CustomCard(_deck[index]),
            ),
          ),
        ],
      ),
    );
  }
}
