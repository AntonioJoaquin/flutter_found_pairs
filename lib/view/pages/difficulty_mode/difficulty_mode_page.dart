import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:found_pairs/utils/difficulty_mode_type.dart';

import '../../../di/locator.dart';
import '../../common/style/palette.dart';
import 'difficulty_mode_manager.dart';

class DifficultyModePage extends StatefulWidget {
  const DifficultyModePage({Key? key}) : super(key: key);

  @override
  State<DifficultyModePage> createState() => _DifficultyModePageState();
}

class _DifficultyModePageState extends State<DifficultyModePage> {
  final DifficultyModeManager _manager = locator<DifficultyModeManager>();

  @override
  void dispose() {
    _manager.dispose();

    super.dispose();
  }

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
            _DifficultyItem(DifficultyModeType.easy, _manager),
            spacer,
            _DifficultyItem(DifficultyModeType.medium, _manager),
            spacer,
            _DifficultyItem(DifficultyModeType.hard, _manager),
          ],
        ),
      ),
    );
  }
}

class _DifficultyItem extends StatelessWidget {
  const _DifficultyItem(
    this.type,
    this.manager, {
    Key? key,
  }) : super(key: key);

  final DifficultyModeType type;
  final DifficultyModeManager manager;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: manager.difficultySelected,
      builder: (_, DifficultyModeType typeSelected, __) => GestureDetector(
        onTap: () => manager.selectDifficulty(type),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          decoration: BoxDecoration(
            border: Border.all(
              color: (typeSelected.id == type.id) ? Palette.red : Palette.black,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Center(
            child: Text(
              type.text,
              style: TextStyle(
                fontSize: 20.sp,
                color:
                    (typeSelected.id == type.id) ? Palette.red : Palette.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
