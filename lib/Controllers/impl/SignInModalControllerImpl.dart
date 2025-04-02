import 'package:flutter/src/widgets/editable_text.dart';
import 'package:nimbus/Controllers/SignInModalController.dart';

class SignInModalControllerImpl implements SignInModalController {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Future<void> SignInPressed() async {}

  @override
  Future<void> SignUpPressed() async {}

  @override
  // TODO: implement email
  TextEditingController get email => _email;

  @override
  // TODO: implement password
  TextEditingController get password => _password;
}
