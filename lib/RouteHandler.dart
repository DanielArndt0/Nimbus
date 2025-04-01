import 'package:nimbus/NamedRoutes.dart';
import 'package:nimbus/Screens/HomeScreen.dart';
import 'package:nimbus/Screens/LoginScreen.dart';
import 'package:nimbus/Screens/OnboardingScreen.dart';
import 'package:nimbus/Screens/ProfileScreen.dart';
import 'package:nimbus/Screens/SettingsScreen.dart';
import 'package:nimbus/Screens/SignUpScreen.dart';
import 'package:nimbus/Screens/StorageScreen.dart';

class RouteHandler {
  static const initialRoute = NamedRoutes.onboarding;

  static final routes = {
    NamedRoutes.onboarding: (context) => OnboardingScreen(), // AutoLogin
    NamedRoutes.login: (context) => LoginScreen(), // AutoLogin
    NamedRoutes.register: (context) => SignUpScreen(), // AutoLogin
    NamedRoutes.home: (context) => HomeScreen(), // RequireAuth
    NamedRoutes.storage: (context) => StorageScreen(), // RequireAuth
    NamedRoutes.profile: (context) => ProfileScreen(), // RequireAuth
    NamedRoutes.settings: (context) => SettingsScreen(), // RequireAuth
  };
}
