import 'package:flutter/widgets.dart';

abstract class SignInModalController {
  TextEditingController get email;
  TextEditingController get password;

  Future<void> SignInPressed();
  Future<void> SignUpPressed();
}
