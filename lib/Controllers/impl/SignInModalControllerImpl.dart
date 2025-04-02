import 'package:flutter/src/widgets/editable_text.dart';
import 'package:flutter/src/widgets/form.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nimbus/Controllers/NavigationController.dart';
import 'package:nimbus/Controllers/SignInModalController.dart';
import 'package:nimbus/Errors/AuthException.dart';
import 'package:nimbus/Services/AuthService.dart';
import 'package:nimbus/Services/LogService.dart';

class SignInModalControllerImpl implements SignInModalController {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  SignInModalControllerImpl({
    required this.authService,
    required this.logService,
    required this.navigationController,
  });

  final NavigationController navigationController;
  final AuthService authService;
  final LogService logService;

  @override
  TextEditingController get email => _email;

  @override
  TextEditingController get password => _password;

  @override
  GlobalKey<FormState> get formKey => _formKey;

  @override
  Future<void> signInPressed() async {
    try {
      await authService.login(email: email.text, password: password.text);
    } on AuthException catch (error) {
      logService.error(message: error.message, error: error);
      navigationController.showSnackbar(text: error.message);
    } catch (error) {
      logService.error(message: error.toString(), error: error);
      navigationController.showSnackbar(text: error.toString());
    }
  }

  @override
  Future<void> signUpPressed() async {
    return navigationController.pop();
  }

  @override
  Future<void> forgotPasswordPressed() async {}
}
