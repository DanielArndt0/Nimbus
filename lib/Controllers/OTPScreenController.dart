import 'package:flutter/material.dart';

abstract class OTPScreenController {
  Future<void> exitPressed();
  Future<void> sendCode({required String phoneNumber});
  Future<void> onPinputSubmitted(String pin);

  ValueNotifier<bool> get sendCodeEnabled;
  ValueNotifier<int> get countdown;


}
