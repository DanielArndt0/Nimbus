import 'package:nimbus/Controllers/NavigationController.dart';
import 'package:nimbus/Controllers/OnboardingScreenController.dart';

class OnboardingScreenControllerImpl implements OnboardingScreenController {
  OnboardingScreenControllerImpl({required this.navigationController});

  late NavigationController navigationController;

  @override
  Future<void> signInButtonPressed() async {
    navigationController.goToLogin();
  }

  @override
  Future<void> signInWithFacebook() async {}

  @override
  Future<void> signInWithGoogle() async {}
}
