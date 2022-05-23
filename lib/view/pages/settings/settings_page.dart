import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/common/palette.dart';
import '../../../di/locator.dart';
import 'settings_manager.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final SettingsManager _manager = locator<SettingsManager>();

  @override
  void initState() {
    _manager.init();

    super.initState();
  }

  @override
  void dispose() {
    _manager.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text('Settings'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: _SettingCheckItem(
            'Finished game sounds',
            _manager.isGameFinishedSoundsActivated,
            onChanged: _manager.setGameFinishedSounds,
            settingDescription: 'The sound played with the win or lose dialog.',
          ),
        ),
      ),
    );
  }
}

class _SettingCheckItem extends StatelessWidget {
  const _SettingCheckItem(
    String setting,
    ValueListenable<bool> valueListenable, {
    Key? key,
    required Function onChanged,
    required String settingDescription,
  })  : _setting = setting,
        _valueListenable = valueListenable,
        _onChanged = onChanged,
        _settingDescription = settingDescription,
        super(key: key);

  final String _setting;
  final ValueListenable<bool> _valueListenable;
  final Function _onChanged;
  final String _settingDescription;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * .05),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _setting,
              style: const TextStyle(fontWeight: FontWeight.w300),
            ),
            ValueListenableBuilder<bool>(
              valueListenable: _valueListenable,
              builder: (_, bool isActivated, __) => Checkbox(
                value: isActivated,
                onChanged: (newValue) => _onChanged.call(newValue ?? false),
                activeColor: Palette.red,
              ),
            ),
          ],
        ),
        SizedBox(height: MediaQuery.of(context).size.height * .01),
        Text(
          _settingDescription,
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }
}
