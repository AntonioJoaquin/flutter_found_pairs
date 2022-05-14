import '../di/locator.dart';
import '../services/dialog_service.dart';
import '../services/navigation_service.dart';

abstract class ViewManager {
  final NavigationService navigationService = locator<NavigationService>();
  final DialogService dialogService = locator<DialogService>();
}
