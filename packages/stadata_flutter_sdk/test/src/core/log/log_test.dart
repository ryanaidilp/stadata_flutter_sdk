import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';

import '../../../helpers/test_injection.dart';

class MockLogger extends Mock implements Logger {}

void main() {
  late Logger mockLogger;
  late Log log;

  setUpAll(
    () {
      mockLogger = MockLogger();
      registerTestLazySingleton<Logger>(mockLogger);
      log = Log();
    },
  );

  const message = 'This is log message';
  const error = {'name': 'This is example error'};
  final trace = StackTrace.fromString('This is example stack trace');

  tearDownAll(unregisterTestInjection);

  group(
    'Log',
    () {
      test(
        'default log type must be debug',
        () {
          when(
            () => mockLogger.d(message, error: error, stackTrace: trace),
          ).thenAnswer((_) => {});

          log.console(message, error: error, stackTrace: trace);

          verify(
            () => mockLogger.d(message, error: error, stackTrace: trace),
          );
        },
      );

      test(
        'can print log without optional param',
        () {
          when(
            () => mockLogger.d(message),
          ).thenAnswer((_) => {});

          log.console(message);

          verify(
            () => mockLogger.d(message),
          );
        },
      );

      test(
        'default log type must be verbose when LogType.verbose',
        () {
          when(
            () => mockLogger.t(message, error: error, stackTrace: trace),
          ).thenAnswer((_) => {});

          log.console(
            message,
            error: error,
            stackTrace: trace,
            type: LogType.verbose,
          );

          verify(
            () => mockLogger.t(message, error: error, stackTrace: trace),
          );
        },
      );

      test(
        'default log type must be info when LogType.info',
        () {
          when(
            () => mockLogger.i(message, error: error, stackTrace: trace),
          ).thenAnswer((_) => {});

          log.console(
            message,
            error: error,
            stackTrace: trace,
            type: LogType.info,
          );

          verify(
            () => mockLogger.i(message, error: error, stackTrace: trace),
          );
        },
      );
      test(
        'default log type must be warning when LogType.warning',
        () {
          when(
            () => mockLogger.w(message, error: error, stackTrace: trace),
          ).thenAnswer((_) => {});

          log.console(
            message,
            error: error,
            stackTrace: trace,
            type: LogType.warning,
          );

          verify(
            () => mockLogger.w(message, error: error, stackTrace: trace),
          );
        },
      );

      test(
        'default log type must be error when LogType.error',
        () {
          when(
            () => mockLogger.e(message, error: error, stackTrace: trace),
          ).thenAnswer((_) => {});

          log.console(
            message,
            error: error,
            stackTrace: trace,
            type: LogType.error,
          );

          verify(
            () => mockLogger.e(message, error: error, stackTrace: trace),
          );
        },
      );

      test(
        'default log type must be fatal when LogType.fatal',
        () {
          when(
            () => mockLogger.f(message, error: error, stackTrace: trace),
          ).thenAnswer((_) => {});

          log.console(
            message,
            error: error,
            stackTrace: trace,
            type: LogType.fatal,
          );

          verify(
            () => mockLogger.f(message, error: error, stackTrace: trace),
          );
        },
      );
    },
  );
}
