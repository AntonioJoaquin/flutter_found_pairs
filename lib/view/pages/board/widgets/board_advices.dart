import 'package:flutter/material.dart';

import '../../../common/widgets/custom_button.dart';

abstract class BoardAdvices {
  static Future<void> showWinDialog(BuildContext context) => showDialog(
        context: context,
        barrierDismissible: true,
        builder: (_) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24.0),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 32.0,
                horizontal: 16.0,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'You win!',
                    style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * .025),
                  const Text(
                    'Congratulations, you managed to catch them all!',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * .05),
                  CustomButton(
                    'View stadistics',
                    () => BoardAdvices.showWinDialog(
                        context), // _manager.navigateToBoardGame,),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: CustomButton(
                      'Save in ranking',
                      () => BoardAdvices.showWinDialog(
                          context), // _manager.navigateToBoardGame,),
                    ),
                  ),
                  CustomButton(
                    'Go home',
                    () => BoardAdvices.showWinDialog(
                        context), // _manager.navigateToBoardGame,),
                  ),
                ],
              ),
            ),
          );
        },
      );
}
