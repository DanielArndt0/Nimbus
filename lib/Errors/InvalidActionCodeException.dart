
import 'package:nimbus/Errors/AuthException.dart';

class InvalidActionCodeException extends AuthException {
  InvalidActionCodeException({
    super.message = 'This link is invalid or has already been used. Please request a new one.',
    super.code = 'invalid-action-code',
  });
}
