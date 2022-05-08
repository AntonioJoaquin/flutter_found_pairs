import '../di/locator.dart';
import '../services/navigation_service.dart';

abstract class ViewManager {
  final NavigationService navigationService = locator<NavigationService>();
}
