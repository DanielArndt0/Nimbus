
import 'package:nimbus/Errors/AuthException.dart';

class InvalidCredentialException extends AuthException {
  InvalidCredentialException({
    super.message = 'Incorrect email or password. Please double-check your credentials and try again.',
    super.code = 'invalid-credential',
  });
}
