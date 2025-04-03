import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nimbus/Services/NavigationService.dart';
import 'package:page_transition/page_transition.dart';

class NavigationServiceImpl implements NavigationService {
  NavigationServiceImpl._();
  static final NavigationServiceImpl instance = NavigationServiceImpl._();

  @override
  late GlobalKey<NavigatorState> navigator;

  @override
  late GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey;

  @override
  BuildContext? get context => navigator.currentContext;

  @override
  Future<void> pushNamed<T>({
    required String route,
    PageTransitionType? transition,
    T? object,
  }) async {
    if (transition != null) {
      context?.pushNamedTransition(
        routeName: route,
        type: transition,
        arguments: object,
      );
    } else {
      navigator.currentState?.pushNamed(route, arguments: object);
    }
  }

  @override
  Future<void> popAndPushNamed<T>({required String route, T? object}) async {
    navigator.currentState?.popAndPushNamed(route, arguments: object);
  }

  @override
  Future<void> popAllAndPushNamed<T>({required String route, T? object}) async {
    navigator.currentState?.pushNamedAndRemoveUntil(
      route,
      (route) => false,
      arguments: object,
    );
  }

  @override
  Future<void> pop() async {
    navigator.currentState?.pop();
  }

  @override
  void showSnackbar({required String text}) {
    scaffoldMessengerKey.currentState!.showSnackBar(
      SnackBar(content: Text(text)),
    );
    // ScaffoldMessenger.of(
    //   navigator.currentContext!,
    // ).showSnackBar(SnackBar(content: Text(text)));
  }
}
