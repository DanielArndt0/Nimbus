import 'package:flutter/src/widgets/editable_text.dart';
import 'package:flutter/src/widgets/form.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nimbus/Controllers/AuthController.dart';
import 'package:nimbus/Controllers/NavigationController.dart';
import 'package:nimbus/Controllers/SignUpScreenController.dart';
import 'package:nimbus/Errors/AuthException.dart';
import 'package:nimbus/Services/LogService.dart';

class SignUpScreenControllerImpl implements SignUpScreenController {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  SignUpScreenControllerImpl({
    required this.authController,
    required this.logService,
    required this.navigationController,
  });

  final AuthController authController;
  final LogService logService;
  final NavigationController navigationController;

  @override
  TextEditingController get email => _email;

  @override
  TextEditingController get password => _password;

  @override
  TextEditingController get confirmPassword => _confirmPassword;

  @override
  GlobalKey<FormState> get formKey => _formKey;

  @override
  Future<void> signInPressed() async {
    navigationController.pop();
  }

  @override
  Future<void> signUpPressed() async {
    try {
      if (formKey.currentState!.validate()) {
        await authController.signUp(email: email.text, password: password.text);
        navigationController.goToAuth();
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
