abstract class NavigationController {
  Future<void> goToLogin();
  Future<void> pop();

  void showSnackbar({required String text});
}
