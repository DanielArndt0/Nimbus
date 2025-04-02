import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/src/widgets/editable_text.dart';
import 'package:flutter/src/widgets/form.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nimbus/Controllers/AuthCodeScreenController.dart';
import 'package:nimbus/Controllers/NavigationController.dart';
import 'package:nimbus/Errors/AuthException.dart';
import 'package:nimbus/Services/AuthService.dart';
import 'package:nimbus/Services/LogService.dart';

class AuthCodeScreenControllerImpl implements AuthCodeScreenController {
  AuthCodeScreenControllerImpl({
    required this.logService,
    required this.authService,
    required this.navigationController,
  });

  final LogService logService;
  final AuthService authService;
  final NavigationController navigationController;

  final TextEditingController _code = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _sendCodeEnabled = ValueNotifier<bool>(true);
  final _countdown = ValueNotifier<int>(0);
  Timer? _timer;

  @override
  TextEditingController get code => _code;

  @override
  ValueNotifier<bool> get sendCodeEnabled => _sendCodeEnabled;

  @override
  ValueNotifier<int> get countdown => _countdown;

  @override
  GlobalKey<FormState> get formKey => _formKey;

  @override
  Future<void> sendCodePressed() async {
    try {
      await authService.sendCodeToEmail();
      _startCountdown();
    } on AuthException catch (error) {
      logService.error(message: error.message, error: error.code);
      navigationController.showSnackbar(text: error.message);
    } catch (error) {
      logService.error(message: error.toString(), error: error);
      navigationController.showSnackbar(text: error.toString());
    }
  }

  @override
  Future<void> verifyCodePressed(String code) async {
    try {
      await authService.verifyCode(code: code);
    } on AuthException catch (error) {
      logService.error(message: error.message, error: error.code);
      navigationController.showSnackbar(text: error.message);
    } catch (error) {
      logService.error(message: error.toString(), error: error);
      navigationController.showSnackbar(text: error.toString());
    }
  }

  @override
  void onCodeChanged(String value) async {
    code.text = value.toUpperCase();
  }

  @override
  Future<void> exitPressed() async {
    await authService.signOut();
  }

  void _startCountdown() {
    _sendCodeEnabled.value = false;
    countdown.value = 60;

    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      _countdown.value--;

      if (_countdown.value <= 0) {
        _sendCodeEnabled.value = true;
        timer.cancel();
      }
    });
  }
}
