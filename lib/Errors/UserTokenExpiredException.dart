
import 'package:nimbus/Errors/AuthException.dart';

class UserTokenExpiredException extends AuthException {
  UserTokenExpiredException({
    super.message = 'Your session has expired. Please log in again to continue.',
    super.code = 'user-token-expired',
  });
}
