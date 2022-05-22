import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:found_pairs/view/common/app_lifecycle_observer.dart';

import 'di/locator.dart';
import 'view/view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  setUpLocator();
  final _navigatorKey = navigatorKeyBuilder(GlobalKey<NavigatorState>());

  runApp(MyApp(_navigatorKey));
}

class MyApp extends StatelessWidget {
  const MyApp(
    this._navigatorKey, {
    Key? key,
  }) : super(key: key);

  final GlobalKey<NavigatorState> _navigatorKey;

  @override
  Widget build(BuildContext context) {
    return AppLifecycleObserver(
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, __) => MaterialApp(
          title: 'Material App',
          navigatorKey: _navigatorKey,
          theme: View.theme,
          onGenerateRoute: View.getRoutes,
          initialRoute: View.getInitialRoute(),
        ),
      ),
    );
  }
}
