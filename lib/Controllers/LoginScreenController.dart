import 'package:flutter/widgets.dart';

abstract class LoginScreenController {
  TextEditingController get email;
  TextEditingController get password;
  GlobalKey<FormState> get formKey;

  Future<void> signInPressed();
  Future<void> signUpPressed();
  Future<void> forgotPasswordPressed();
}
