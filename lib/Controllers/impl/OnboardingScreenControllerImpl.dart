import 'package:nimbus/Controllers/NavigationController.dart';
import 'package:nimbus/Controllers/OnboardingScreenController.dart';

class OnboardingScreenControllerImpl implements OnboardingScreenController {
  OnboardingScreenControllerImpl({required this.navigationController});

  late NavigationController navigationController;

  @override
  Future<void> signInWithFacebook() async {}

  @override
  Future<void> signInWithGoogle() async {}

  @override
  Future<void> signInPressed() async {
    await navigationController.goToLogin();
  }

  @override
  Future<void> signInWithPhone() async {
    await navigationController.goToPhoneLogin();
  }
}
