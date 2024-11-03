// ignore_for_file: cascade_invocations
import 'package:dio/dio.dart';
import 'package:stadata_flutter_sdk/src/core/di/injector.dart';
import 'package:stadata_flutter_sdk/src/core/log/log.dart';

class LoggingInterceptor extends Interceptor {
  Log get log => injector.get<Log>();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log
      ..console('HTTP REQUEST')
      ..console('==============================')
      ..console(
        '${options.method.toUpperCase()} ${(options.baseUrl) + options.path}',
      )
      ..console('Headers:');
    options.headers.forEach(
      (k, v) => log.console('$k: $v'),
    );

    log.console('Query Parameters:');
    options.queryParameters.forEach(
      (k, v) => log.console('$k: $v'),
    );

    if (options.data != null) {
      log.console('Body: ${options.data}');
    }

    return super.onRequest(options, handler);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    log.console('HTTP RESPONSE');
    log.console('==============================');

    log.console(
      '${response.statusCode} (${response.statusMessage}) '
      '${response.requestOptions.baseUrl + response.requestOptions.path}',
    );

    log.console('Headers:');
    response.headers.forEach(
      (k, v) => log.console('$k: $v'),
    );

    log.console('Body: ${response.data}');

    return super.onResponse(response, handler);
  }

  @override
  void onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) {
    log.console(
      'HTTP ERROR',
      type: LogType.error,
    );
    log.console('==============================', type: LogType.error);

    final request = err.requestOptions;

    if (err.response != null) {
      final response = err.response!;
      log.console(
        '${err.response!.statusCode} (${err.response!.statusMessage}) '
        '${request.baseUrl}${request.path}',
        type: LogType.error,
      );

      log.console('Body: ${response.data}', type: LogType.error);
    } else {
      log.console(
        '${err.error} (${err.type}) '
        '${request.baseUrl}${request.path}',
        type: LogType.error,
      );
    }

    if (err.response != null) {
      return handler.resolve(err.response!);
    }

    return handler.resolve(
      Response(
        requestOptions: request,
        statusCode: 1000,
        statusMessage: err.message,
      ),
    );
  }
}
