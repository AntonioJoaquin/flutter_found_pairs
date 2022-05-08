import 'package:flutter/widgets.dart';
import 'package:found_pairs/common/custom_notifier.dart';

class CardModel {
  final int value;
  final String publicValue;

  final CustomValueNotifier<bool> _isPairFounded =
      CustomValueNotifier<bool>(false);
  CustomValueNotifier<bool> get isPairFounded => _isPairFounded;

  bool _isFlipped = false;
  bool get isFlipped => _isFlipped;

  late AnimationController _animationController;
  AnimationController get animationController => _animationController;

  late void Function(AnimationStatus status) _animControllerListener;

  late Animation _animation;
  Animation get animation => _animation;

  CardModel(this.value, this.publicValue);

  void init(TickerProvider vsync, Function onCheckPair) {
    _animControllerListener = (status) {
      if (status == AnimationStatus.completed) {
        onCheckPair.call();
      }
    };
    _animationController = AnimationController(
      vsync: vsync,
      duration: const Duration(milliseconds: 300),
    )..addStatusListener(_animControllerListener);
    _animation = Tween(end: 1.0, begin: .0).animate(_animationController);
  }

  void flip() {
    _isFlipped
        ? _animationController.reverse()
        : _animationController.forward();

    _isFlipped = !_isFlipped;
  }

  void pairFounded() => _isPairFounded.value = true;

  void dispose() {
    _isPairFounded.dispose();
    _animationController.removeStatusListener(_animControllerListener);
    _animationController.dispose();
  }
}
