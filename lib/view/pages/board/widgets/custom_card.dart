import 'dart:math';

import 'package:flutter/material.dart';

import '../models/card_model.dart';

class CustomCard extends StatefulWidget {
  const CustomCard(
    this._card, {
    Key? key,
  }) : super(key: key);

  final CardModel _card;

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation = Tween(end: 1.0, begin: .0).animate(_animationController);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget._card.isFlipped.value
            ? _animationController.reverse()
            : _animationController.forward();
        widget._card.flip();
      },
      child: AnimatedBuilder(
        animation: _animation,
        builder: (_, __) => Transform(
          alignment: FractionalOffset.center,
          transform: Matrix4.identity()
            ..setEntry(3, 2, .0015)
            ..rotateY(pi * _animation.value),
          child: (_animation.value <= .5)
              ? const _CardBack()
              : Transform(
                  alignment: FractionalOffset.center,
                  transform: Matrix4.identity()..setRotationY(pi),
                  child: _CardFront(widget._card.publicValue),
                ),
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
