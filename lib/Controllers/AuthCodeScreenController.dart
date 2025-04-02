import 'package:flutter/material.dart';

abstract class AuthCodeScreenController {
  TextEditingController get code;
  GlobalKey<FormState> get formKey;
  ValueNotifier<bool> get sendCodeEnabled;
  ValueNotifier<int> get countdown;

  Future<void> verifyCodePressed(String code);
  Future<void> sendCodePressed();
  void onCodeChanged(String value);
  Future<void> exitPressed();
}
