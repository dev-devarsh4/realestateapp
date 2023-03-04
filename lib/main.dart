import 'dart:async';

import 'package:flutter/material.dart';
import 'package:realestateapp/core/string_constants/label_constants.dart';

import '/di/injection_container.dart' as di;
import 'core/preference/prefs.dart';
import 'routes/custom_navigator_observer.dart';
import 'routes/routes.dart';

void mainDelegate() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Prefs.init();
  await di.init();
  // await Firebase.initializeApp();
  runZonedGuarded<Future<void>>(() async {
    runApp(
      const MyApp(),
    );
  }, (error, stackTrace) {});
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateTitle: (context) => appName,
        initialRoute: Routes.dashboard,
        routes: Routes.routes,
        navigatorObservers: <NavigatorObserver>[
          CustomNavigatorObserver(),
        ],
      );
}
