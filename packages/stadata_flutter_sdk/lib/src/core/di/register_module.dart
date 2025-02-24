import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:stadata_flutter_sdk/src/config/config.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/core/log/filter/release_log_filter.dart';
import 'package:stadata_flutter_sdk/src/core/log/printer/simple_log_printer.dart';

abstract class RegisterModule {
  Logger get logger => Logger(
    filter: ReleaseLogFilter(),
    printer: PrefixPrinter(
      SimpleLogPrinter(),
      error: 'StadataError -',
      debug: 'StadataLog -',
      fatal: 'StadataFatalError -',
      info: 'StadataInfo -',
      trace: 'StadataTrace -',
      warning: 'StadataWarning -',
    ),
  );

  NetworkClient get httpClient => NetworkClient(
    baseUrl: Env.apiBaseUrl,
    interceptors: [
      if (kDebugMode) LoggingInterceptor(),
      AuthInterceptor(),
      RetryInterceptor(),
    ],
  );

  NetworkClient get listHttpClient => NetworkClient(
    baseUrl: '${Env.apiBaseUrl}list/',
    interceptors: [
      if (kDebugMode) LoggingInterceptor(),
      AuthInterceptor(),
      RetryInterceptor(),
    ],
  );

  NetworkClient get viewHttpClient => NetworkClient(
    baseUrl: '${Env.apiBaseUrl}view/',
    interceptors: [
      if (kDebugMode) LoggingInterceptor(),
      AuthInterceptor(),
      RetryInterceptor(),
    ],
  );
}
