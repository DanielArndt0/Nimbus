
import 'package:nimbus/Errors/AuthException.dart';

class ExpiredActionCodeException extends AuthException {
  ExpiredActionCodeException({
    super.message = 'This link has expired. Please request a new one.',
    super.code = 'expired-action-code',
  });
}
