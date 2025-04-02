import 'package:flutter/material.dart';

abstract class SignUpScreenController {
  TextEditingController get email;
  TextEditingController get password;
  TextEditingController get confirmPassword;
  GlobalKey<FormState> get formKey;

  Future<void> signInPressed();
  Future<void> signUpPressed();
}
