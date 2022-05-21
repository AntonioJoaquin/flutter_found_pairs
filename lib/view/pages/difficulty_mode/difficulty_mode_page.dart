import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:found_pairs/view/common/widgets/custom_button.dart';

import '../../common/style/palette.dart';

class DifficultyModePage extends StatelessWidget {
  const DifficultyModePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final spacer = SizedBox(height: MediaQuery.of(context).size.height * .025);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const _DifficultyItem('Easy Mode'),
            spacer,
            const _DifficultyItem('Medium Mode'),
            spacer,
            const _DifficultyItem('Hard Mode'),
          ],
        ),
      ),
    );
  }
}

class _DifficultyItem extends StatelessWidget {
  const _DifficultyItem(
    this.text, {
    Key? key,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Palette.black),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 20.sp,
          ),
        ),
      ),
    );
  }
}
