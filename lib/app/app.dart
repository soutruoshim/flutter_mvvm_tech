import 'package:flutter/material.dart';
import 'package:flutter_mvvm_tech/presentation/resources/routes_manager.dart';
import 'package:flutter_mvvm_tech/presentation/resources/theme_manager.dart';

class MyApp extends StatefulWidget {

  int appState = 0;

  MyApp._internal();   // private named constructor

  static final MyApp instance = MyApp._internal(); // single instance -- singleton

  factory MyApp() => instance;    // factory for class instance

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,
      theme: getApplicationTheme(),
    );
  }
}
