import 'package:nimbus/Errors/AuthException.dart';


class UserLogouException extends AuthException {
  UserLogouException({
    super.message = 'The user has been logged out.',
    super.code = 'user-logout',
  });
}
