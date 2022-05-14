import 'dart:math';

import 'package:flutter/material.dart';

import '../models/card_model.dart';

class CustomCard extends StatefulWidget {
  const CustomCard(
    this._card,
    this._onCheckPair,
    this._isPairFounded, {
    Key? key,
  }) : super(key: key);

  final CardModel _card;
  final Function _onCheckPair;
  final bool _isPairFounded;

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    widget._card.init(this, widget._onCheckPair);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget._isPairFounded
        ? const _EmptyCard()
        : AnimatedBuilder(
            animation: widget._card.animation!,
            builder: (_, __) => Transform(
              alignment: FractionalOffset.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, .0015)
                ..rotateY(pi * widget._card.animation?.value),
              child: (widget._card.animation?.value <= .5)
                  ? const _CardBack()
                  : Transform(
                      alignment: FractionalOffset.center,
                      transform: Matrix4.identity()..setRotationY(pi),
                      child: _CardFront(widget._card.publicValue),
                    ),
            ),
          );
  }
}

class _CardFront extends StatelessWidget {
  const _CardFront(
    this._publicValue, {
    Key? key,
  }) : super(key: key);

  final String _publicValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.blue,
      ),
      child: Center(
        child: Text(
          _publicValue,
          style: const TextStyle(
            fontSize: 24.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class _CardBack extends StatelessWidget {
  const _CardBack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.red,
      ),
      child: const Center(
        child: Text(
          'X',
          style: TextStyle(
            fontSize: 24.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class _EmptyCard extends StatelessWidget {
  const _EmptyCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
  }
}
