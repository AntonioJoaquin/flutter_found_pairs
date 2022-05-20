import 'dart:math';

import 'package:flutter/material.dart';

import '../../../common/style/card_styles.dart';
import '../../../common/style/palette.dart';
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
      decoration: BoxDecoration(
        border: Border.all(color: Palette.black),
        borderRadius: BorderRadius.circular(8.0),
        color: Palette.cardFrontBackground,
      ),
      child: Center(
        child: Image.asset(
          _publicValue,
          fit: BoxFit.contain,
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
      decoration: BoxDecoration(
        border: Border.all(color: Palette.black, width: 2),
        borderRadius: BorderRadius.circular(8.0),
        gradient: CardStyles.easyBackDesign,
      ),
    );
  }
}

class _EmptyCard extends StatelessWidget {
  const _EmptyCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Palette.black),
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
  }
}
