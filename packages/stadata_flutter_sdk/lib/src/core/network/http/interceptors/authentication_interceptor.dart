import 'package:dio/dio.dart';
import 'package:stadata_flutter_sdk/src/config/config.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';

class AuthenticationInterceptor extends Interceptor {
  ApiConfig get apiConfig => injector.get<ApiConfig>();

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final apiKey = apiConfig.apiKey;

    options.queryParameters.addAll({'key': apiKey});

    super.onRequest(options, handler);
  }
}
