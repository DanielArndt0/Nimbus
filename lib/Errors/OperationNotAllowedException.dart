import 'package:nimbus/Errors/AuthException.dart';


class OperationNotAllowedException extends AuthException {
  OperationNotAllowedException({
    super.message = 'Operation not allowed.',
    super.code = 'operation-not-allowed',
  });
}
