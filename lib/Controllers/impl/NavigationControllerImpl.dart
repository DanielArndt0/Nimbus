import 'package:nimbus/Controllers/NavigationController.dart';
import 'package:nimbus/NamedRoutes.dart';
import 'package:nimbus/Services/NavigationService.dart';
import 'package:page_transition/page_transition.dart';

class NavigationControllerImpl implements NavigationController {
  NavigationControllerImpl({required this.navigationService});

  final NavigationService navigationService;

  @override
  Future<void> goToLogin() async {
    return navigationService.pushNamed(
      route: NamedRoutes.login,
      transition: PageTransitionType.rightToLeft,
    );
  }

  @override
  Future<void> pop() async {
    return navigationService.pop();
  }

  @override
  void showSnackbar({required String text}) {
    navigationService.showSnackbar(text: text);
  }
}
