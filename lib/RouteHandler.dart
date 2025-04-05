import 'package:flutter/material.dart';
import 'package:nimbus/Middlewares/AutoLogin.dart';
import 'package:nimbus/Middlewares/RequireAuth.dart';
import 'package:nimbus/Middlewares/VerifyEmail.dart';
import 'package:nimbus/NamedRoutes.dart';
import 'package:nimbus/Screens/AuthCodeScreen.dart';
import 'package:nimbus/Screens/HomeScreen.dart';
import 'package:nimbus/Screens/LoginScreen.dart';
import 'package:nimbus/Screens/LoginWithPhoneScreen.dart';
import 'package:nimbus/Screens/OTPScreen.dart';
import 'package:nimbus/Screens/OnboardingScreen.dart';
import 'package:nimbus/Screens/ProfileScreen.dart';
import 'package:nimbus/Screens/SettingsScreen.dart';
import 'package:nimbus/Screens/SignUpScreen.dart';
import 'package:nimbus/Screens/StorageScreen.dart';

class RouteHandler {
  static const initialRoute = NamedRoutes.onboarding;

  static final routes = {
    NamedRoutes.onboarding:
        (context) => AutoLogin(child: OnboardingScreen()), // AutoLogin
    NamedRoutes.login:
        (context) => AutoLogin(child: LoginScreen()), // AutoLogin
    NamedRoutes.loginWithPhone:
        (context) => AutoLogin(child: LoginWithPhoneScreen()), // AutoLogin
    NamedRoutes.register:
        (context) => AutoLogin(child: SignUpScreen()), // AutoLogin
    NamedRoutes.home:
        (context) => RequireAuth(child: HomeScreen()), // RequireAuth
    NamedRoutes.storage:
        (context) => RequireAuth(child: StorageScreen()), // RequireAuth
    NamedRoutes.profile:
        (context) => RequireAuth(child: ProfileScreen()), // RequireAuth
    NamedRoutes.settings:
        (context) => RequireAuth(child: SettingsScreen()), // RequireAuth
    NamedRoutes.auth:
        (context) => VerifyEmail(
          child: RequireAuth(child: AuthCodeScreen()),
        ), // RequireAuth
    NamedRoutes.otp:
        (context) => AutoLogin(
          child: _openPage<String>(
            context,
            (phoneNumber) => OTPScreen(phoneNumber: phoneNumber),
          ),
        ), // RequireAuth
  };

  static Widget _openPage<T>(BuildContext context, Widget Function(T) onPage) {
    final obj = ModalRoute.of(context)!.settings.arguments as T;
    return onPage(obj);
  }
}
