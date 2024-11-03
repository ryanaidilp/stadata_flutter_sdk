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

  HttpClient get httpClient => HttpClient.init(
        HttpSetting(
          baseUrl: Env.apiBaseUrl,
          interceptors: [AuthenticationInterceptor()],
        ),
      );

  HttpClient get listHttpClient => HttpClient.init(
        HttpSetting(
          baseUrl: '${Env.apiBaseUrl}list/',
          interceptors: [AuthenticationInterceptor()],
        ),
      );

  HttpClient get viewHttpClient => HttpClient.init(
        HttpSetting(
          baseUrl: '${Env.apiBaseUrl}view/',
          interceptors: [AuthenticationInterceptor()],
        ),
      );
}
