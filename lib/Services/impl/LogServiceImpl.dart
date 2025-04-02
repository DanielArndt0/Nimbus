import 'package:logger/logger.dart';
import 'package:nimbus/Services/LogService.dart';

class LogServiceImpl implements LogService {
  LogServiceImpl._();
  static final LogServiceImpl instance = LogServiceImpl._();

  final Logger _logger = Logger();

  @override
  debug({required message, Object? error, StackTrace? stackTrace}) {
    _logger.d(
      message,
      time: DateTime.now(),
      error: error,
      stackTrace: stackTrace,
    );
  }

  @override
  error({required message, Object? error, StackTrace? stackTrace}) {
    _logger.d(
      message,
      time: DateTime.now(),
      error: error,
      stackTrace: stackTrace,
    );
  }

  @override
  fatal({required message, Object? error, StackTrace? stackTrace}) {
    _logger.f(
      message,
      time: DateTime.now(),
      error: error,
      stackTrace: stackTrace,
    );
  }

  @override
  info({required message, Object? error, StackTrace? stackTrace}) {
    _logger.i(
      message,
      time: DateTime.now(),
      error: error,
      stackTrace: stackTrace,
    );
  }

  @override
  trace({required message, Object? error, StackTrace? stackTrace}) {
    _logger.t(
      trace,
      time: DateTime.now(),
      error: error,
      stackTrace: stackTrace,
    );
  }

  @override
  warning({required message, Object? error, StackTrace? stackTrace}) {
    _logger.w(
      message,
      time: DateTime.now(),
      error: error,
      stackTrace: stackTrace,
    );
  }
}
