import 'package:flutter/material.dart';
import 'package:nimbus/App/AppTheme.dart';
import 'package:nimbus/RouteHandler.dart';
import 'package:nimbus/Services/NavigationService.dart';
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final NavigationService _navigationService;
  GlobalKey<NavigatorState> navigator = GlobalKey<NavigatorState>();


  @override
  void initState() {
    _navigationService = context.read<NavigationService>();
    _navigationService.navigator = navigator;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nimbus',
      theme: AppTheme.themeData,
      initialRoute: RouteHandler.initialRoute,
      routes: RouteHandler.routes,
      navigatorKey: navigator,
    );
  }
}
