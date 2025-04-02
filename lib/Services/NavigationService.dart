import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

abstract class NavigationService {
  GlobalKey<NavigatorState> get navigator;
  void set navigator(GlobalKey<NavigatorState> navigator);

  GlobalKey<ScaffoldMessengerState> get scaffoldMessengerKey;
  void set scaffoldMessengerKey(GlobalKey<ScaffoldMessengerState> navigator);

  Future<void> pushNamed<T>({
    required String route,
    PageTransitionType? transition,
    T? object,
  });
  Future<void> popAndPushNamed<T>({required String route, T? object});
  Future<void> popAllAndPushNamed<T>({required String route, T? object});
  Future<void> pop();
  void showSnackbar({required String text});

  BuildContext? get context;
}
