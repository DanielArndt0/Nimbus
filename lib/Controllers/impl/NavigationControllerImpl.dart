import 'package:nimbus/Controllers/NavigationController.dart';
import 'package:nimbus/NamedRoutes.dart';
import 'package:nimbus/Services/NavigationService.dart';
import 'package:page_transition/page_transition.dart';

class NavigationControllerImpl implements NavigationController {
  NavigationControllerImpl({required this.navigationService});

  final NavigationService navigationService;

  @override
  void showSnackbar({required String text}) {
    navigationService.showSnackbar(text: text);
  }

  @override
  Future<void> pop() async {
    return navigationService.pop();
  }

  @override
  Future<void> goToLogin() async {
    return navigationService.pushNamed(
      route: NamedRoutes.login,
      transition: PageTransitionType.rightToLeft,
    );
  }

  @override
  Future<void> goToSignUp() async {
    await navigationService.pushNamed(
      route: NamedRoutes.register,
      transition: PageTransitionType.leftToRight,
    );
  }

  @override
  Future<void> goToHome() async {
    await navigationService.popAllAndPushNamed(route: NamedRoutes.home);
  }

  @override
  Future<void> goToAuth() async {
    await navigationService.popAllAndPushNamed(route: NamedRoutes.auth);
  }

  @override
  Future<void> goToPhoneLogin() async {
    await navigationService.pushNamed(
      route: NamedRoutes.loginWithPhone,
      transition: PageTransitionType.rightToLeft,
    );
  }

  @override
  Future<void> goToOTP({required String phoneNumber}) async {
    await navigationService.pushNamed<String>(
      route: NamedRoutes.otp,
      object: phoneNumber,
      transition: PageTransitionType.rightToLeft,
    );
  }
}
