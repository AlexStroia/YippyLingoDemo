import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

MemoryOutput logMemory = MemoryOutput(
  bufferSize: 100,
);

Logger _logger = Logger(
  level: kReleaseMode ? Level.error : Level.verbose,
  filter: _FitnessAppLogFilter(),
  printer: PrettyPrinter(
    colors: false,
    methodCount: 0,
    errorMethodCount: 100,
  ),
  output: MultiOutput(
    [
      logMemory,
      ConsoleOutput(),
    ],
  ),
);

//ignore: long-parameter-list
void logError(
  dynamic error, {
  StackTrace? stack,
  String? reason,
  bool logToCrashlytics = true,
  bool fatal = false,
}) {
  if (logToCrashlytics) {
    //TODO
  }
  _logger.e(
    reason,
    error,
    stack ?? StackTrace.current,
  );
}

void debugLog(
  String message, [
  dynamic caller,
]) {
  _logger.d(
    caller == null ? message : '${caller.runtimeType}: $message',
  );
}

//ignore: prefer-match-file-name
class _FitnessAppLogFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    return !kReleaseMode || event.level.index > Level.warning.index;
  }
}
