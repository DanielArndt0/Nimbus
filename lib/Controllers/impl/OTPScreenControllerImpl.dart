import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nimbus/Controllers/AuthController.dart';
import 'package:nimbus/Controllers/NavigationController.dart';
import 'package:nimbus/Controllers/OTPScreenController.dart';
import 'package:nimbus/Errors/AuthException.dart';
import 'package:nimbus/Services/LogService.dart';

class OTPScreenControllerImpl implements OTPScreenController {
  OTPScreenControllerImpl({
    required this.authController,
    required this.navigationController,
    required this.logService,
  });

  final AuthController authController;
  final NavigationController navigationController;
  final LogService logService;

  final _sendCodeEnabled = ValueNotifier<bool>(true);
  final _countdown = ValueNotifier<int>(0);
  Timer? _timer;
  String _verificationId = '';

  @override
  ValueNotifier<int> get countdown => _countdown;

  @override
  ValueNotifier<bool> get sendCodeEnabled => _sendCodeEnabled;

  @override
  Future<void> exitPressed() async {
    navigationController.pop();
    navigationController.pop();
  }

  @override
  Future<void> sendCode({required String phoneNumber}) async {
    try {
      await authController.sendSmsCode(
        phone: phoneNumber,
        onCodeSent: (verificationId) => _verificationId = verificationId,
      );
      _blockSendCode();
    } on AuthException catch (error) {
      logService.error(message: error.message, error: error.code);
      navigationController.showSnackbar(text: error.message);
    } catch (error) {
      logService.error(message: error.toString(), error: error);
      navigationController.showSnackbar(text: error.toString());
    }
  }

  void _blockSendCode() {
    _sendCodeEnabled.value = false;
    _countdown.value = 60;

    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      _countdown.value--;
      if (_countdown.value <= 0) {
        _sendCodeEnabled.value = true;
        _timer?.cancel();
      }
    });
  }

  @override
  Future<void> onPinputSubmitted(String pin) async {
    try {
      if (_verificationId.isNotEmpty) {
        if (pin.length >= 6) {
          await authController.verifySmsCode(
            code: pin,
            verificationId: _verificationId,
          );
          navigationController.goToHome();
        }
      } else {
        throw AuthException(
          message:
              'Verification failed. Please request a new code before trying again.',
          code: 'verificationid-empty',
        );
      }
    } on AuthException catch (error) {
      logService.error(message: error.message, error: error.code);
      navigationController.showSnackbar(text: error.message);
    } catch (error) {
      logService.error(message: error.toString(), error: error);
      navigationController.showSnackbar(text: error.toString());
    }
  }
}
