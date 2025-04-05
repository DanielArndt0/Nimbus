abstract class NavigationController {
  Future<void> goToLogin();
  Future<void> goToPhoneLogin();
  Future<void> goToSignUp();
  Future<void> goToHome();
  Future<void> goToAuth();
  Future<void> goToOTP({required String phoneNumber});
  Future<void> pop();

  void showSnackbar({required String text});
}
