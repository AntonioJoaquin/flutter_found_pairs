import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/widgets/custom_button.dart';

class CustomModePage extends StatelessWidget {
  const CustomModePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text('Customize game'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _RadioNumber(),
              SizedBox(height: MediaQuery.of(context).size.height * .03),
              const _CustomTimePicker(),
              const Spacer(),
              CustomButton('Play!', () {}),
            ],
          ),
        ),
      ),
    );
  }
}

class _CustomTimePicker extends StatelessWidget {
  const _CustomTimePicker({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Time to catch them all:',
          style: TextStyle(fontWeight: FontWeight.w300),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * .01),
        SizedBox(
          height: MediaQuery.of(context).size.height * .15,
          child: Row(
            children: const [
              Flexible(child: _Picker(2)),
              Text(':'),
              Flexible(child: _Picker(60)),
            ],
          ),
        ),
      ],
    );
  }
}

class _Picker extends StatelessWidget {
  const _Picker(
    this.length, {
    Key? key,
  }) : super(key: key);

  final int length;

  @override
  Widget build(BuildContext context) {
    return CupertinoPicker(
      itemExtent: MediaQuery.of(context).size.height * .055,
      children: List.generate(
        length,
        (index) => _PickerItem(index),
      ),
      onSelectedItemChanged: null,
    );
  }
}

class _PickerItem extends StatelessWidget {
  const _PickerItem(
    this.value, {
    Key? key,
  }) : super(key: key);

  final int value;

  @override
  Widget build(BuildContext context) {
    return Text(
      value.toString(),
      style: TextStyle(fontSize: 32.sp),
    );
  }
}

class _RadioNumber extends StatelessWidget {
  const _RadioNumber({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Number of Pokemon to catch: ',
          style: TextStyle(fontWeight: FontWeight.w300),
        ),
        SizedBox(height: height * .01),
        const _RadioItem(8),
        const _RadioItem(10),
        const _RadioItem(12),
      ],
    );
  }
}

class _RadioItem extends StatelessWidget {
  const _RadioItem(
    this.value, {
    Key? key,
  }) : super(key: key);

  final int value;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(value.toString()),
      leading: const Radio(
        value: true,
        groupValue: 'pairsNumber',
        onChanged: null,
      ),
    );
  }
}
