import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:found_pairs/view/pages/board/widgets/board_advices.dart';

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
            () => _showWinDialog(context), // _manager.navigateToBoardGame,),
          ),
        ),
      ),
    );
  }

  void _showWinDialog(BuildContext context) async {
    BoardAdvices.showWinDialog(context);

    AssetsAudioPlayer.newPlayer().open(
      Audio('assets/sounds/lose.wav'),
      autoStart: true,
    );
  }
}
