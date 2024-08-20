import 'package:flutter/material.dart';
import 'package:ampiy/app/app.bottomsheets.dart';
import 'package:ampiy/app/app.dialogs.dart';
import 'package:ampiy/app/app.locator.dart';
import 'package:ampiy/app/app.router.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:stacked_services/stacked_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.startupView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [
        StackedService.routeObserver,
      ],
      builder: (context, child) {
        return EasyLoading.init()(context, child);
      },
    );
  }
}
