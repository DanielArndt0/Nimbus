import 'package:nimbus/Errors/AuthException.dart';

class NetworkRequestFailedException extends AuthException {
  NetworkRequestFailedException({
    super.message =
        'Network error. Please check your internet connection and try again.',
    super.code = 'network-request-failed',
  });
}
