import 'package:flutter/material.dart';

import '../../../common/widgets/custom_button.dart';

enum PlayDialogType { win, lose }

abstract class BoardAdvices {
  static Future<void> showPlayDialog(
    BuildContext context,
    PlayDialogType type,
  ) {
    final size = MediaQuery.of(context).size;

    return showDialog(
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
            child: (type == PlayDialogType.win)
                ? _buildWinDialog(size)
                : _buildLoseDialog(size),
          ),
        );
      },
    );
  }

  static Widget _buildWinDialog(Size size) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'You win!',
            style: TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: size.height * .025),
          const Text(
            'Congratulations, you managed to catch them all!',
            style: TextStyle(fontSize: 16.0),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: size.height * .05),
          CustomButton(
            'View stadistics',
            () => null,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: CustomButton(
              'Save in ranking',
              () => null,
            ),
          ),
          CustomButton(
            'Go home',
            () => null, // _manager.navigateToBoardGame,),
          ),
        ],
      );

  static Widget _buildLoseDialog(Size size) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Time out!',
            style: TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: size.height * .025),
          const Text(
            'Too bad! Time has run out and you haven\'t had time to catch them all.',
            style: TextStyle(fontSize: 16.0),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: size.height * .05),
          CustomButton(
            'Retry',
            () => null,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: CustomButton(
              'Go home',
              () => null,
            ),
          ),
        ],
      );
}
