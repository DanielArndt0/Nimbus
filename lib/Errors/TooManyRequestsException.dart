import 'package:nimbus/Errors/AuthException.dart';


class TooManyRequestsException extends AuthException {
  TooManyRequestsException({
    super.message = 'Too many login attempts. Please wait a moment and try again.',
    super.code = 'too-many-requests',
  });
}
