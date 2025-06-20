import 'dart:async';

import 'package:stadata_flutter_sdk/src/config/config.dart';
import 'package:stadata_flutter_sdk/src/core/di/di.dart';
import 'package:stadata_flutter_sdk/src/core/network/base_network_interceptor.dart';
import 'package:stadata_flutter_sdk/src/core/network/request_data.dart';

class AuthInterceptor extends BaseNetworkInterceptor {
  final ApiConfig _apiConfig = injector.get<ApiConfig>();

  @override
  FutureOr<RequestData> onRequest(RequestData request) async {
    final apiKey = _apiConfig.apiKey;

    final newQueries = Map<String, dynamic>.from(request.uri.queryParameters);
    newQueries['key'] = apiKey;

    return super.onRequest(
      request.copyWith(uri: request.uri.replace(queryParameters: newQueries)),
    );
  }
}
