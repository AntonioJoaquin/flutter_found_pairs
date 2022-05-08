import 'package:flutter/material.dart';

import '../../../di/locator.dart';
import 'home_manager.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeManager _manager = locator<HomeManager>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('FOUND PAIRS'),
      ),
      body: Center(
        child: _NewGameButton(_manager),
      ),
    );
  }
}

class _NewGameButton extends StatelessWidget {
  const _NewGameButton(
    HomeManager manager, {
    Key? key,
  })  : _manager = manager,
        super(key: key);

  final HomeManager _manager;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _manager.navigateToBoardGame,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 32.0,
          vertical: 16.0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.red,
        ),
        child: const Text(
          'New game',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.w300,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
