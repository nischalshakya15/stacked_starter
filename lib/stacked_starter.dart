import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_starter/app/locator/locator.dart';
import 'package:stacked_starter/app/routes/router.gr.dart';

final storage = FlutterSecureStorage();

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.loginView,
      onGenerateRoute: Router().onGenerateRoute,
      navigatorKey: locator<NavigationService>().navigatorKey,
    );
  }
}
