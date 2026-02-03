import 'dart:async';
import 'dart:io';

import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/core/network/base_network_interceptor.dart';

class RetryInterceptor extends BaseNetworkInterceptor {
  final int maxRetries;
  final Duration delay;
  int _retryCount = 0;

  final Log _log = injector.get<Log>();

  RetryInterceptor({
    this.maxRetries = 3,
    this.delay = const Duration(seconds: 1),
  });

  @override
  FutureOr<ResponseData> onError(Object error, StackTrace stackTrace) async {
    if (_retryCount < maxRetries && error is SocketException) {
      _retryCount++;
      _log.console(
        '🔄 Retrying request (Attempt $_retryCount of $maxRetries)',
        type: LogType.info,
      );
      await Future<void>.delayed(delay * _retryCount);
      return Future.error(error, stackTrace);
    }
    _retryCount = 0;
    return Future.error(error, stackTrace);
  }
}
