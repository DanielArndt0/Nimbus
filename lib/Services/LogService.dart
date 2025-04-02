abstract class LogService {
  error({required message, Object? error, StackTrace? stackTrace});
  debug({required message, Object? error, StackTrace? stackTrace});
  fatal({required message, Object? error, StackTrace? stackTrace});
  info({required message, Object? error, StackTrace? stackTrace});
  warning({required message, Object? error, StackTrace? stackTrace});
  trace({required message, Object? error, StackTrace? stackTrace});
}
