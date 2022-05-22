import 'package:flutter/material.dart';

import '../../../di/locator.dart';
import '../../common/widgets/custom_button.dart';
import 'home_manager.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeManager _manager = locator<HomeManager>();

  @override
  void dispose() {
    _manager.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final spacer = SizedBox(height: MediaQuery.of(context).size.height * .05);

    return Scaffold(
      appBar: AppBar(
        title: const Text('FOUND PAIRS'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              'New game',
              _manager.navigateToDifficultyMode,
            ),
            spacer,
            CustomButton(
              'Ranking',
              _manager.navigateToRanking,
            ),
          ],
        ),
      ),
    );
  }
}
