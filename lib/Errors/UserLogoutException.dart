import 'package:nimbus/Errors/AuthException.dart';


class UserLogoutException extends AuthException {
  UserLogoutException({
    super.message = 'Session expired. Please log in again.',
    super.code = 'user-logout',
  });
}
