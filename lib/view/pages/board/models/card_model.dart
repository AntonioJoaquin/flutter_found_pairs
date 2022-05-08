import 'package:found_pairs/common/custom_notifier.dart';

class CardModel {
  final int value;
  final String publicValue;

  final CustomValueNotifier<bool> _isFlipped = CustomValueNotifier<bool>(false);
  CustomValueNotifier<bool> get isFlipped => _isFlipped;

  CardModel(this.value, this.publicValue);

  void flip() => _isFlipped.value = !_isFlipped.value;

  void dispose() => _isFlipped.dispose();
}
