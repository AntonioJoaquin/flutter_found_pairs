import 'package:flutter/material.dart';

import '../../../di/locator.dart';
import '../../common/widgets/custom_button.dart';
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Center(
          child: CustomButton(
            'New game',
            _manager.navigateToBoardGame,
          ),
        ),
      ),
    );
  }
}
