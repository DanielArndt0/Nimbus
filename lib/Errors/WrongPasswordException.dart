import 'package:nimbus/Errors/AuthException.dart';

class WrongPasswordException extends AuthException {
  WrongPasswordException({
    super.message = 'Invalid password or email address.',
    super.code = 'wrong-password',
  });
}
