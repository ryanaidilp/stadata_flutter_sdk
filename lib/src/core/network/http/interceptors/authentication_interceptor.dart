// ignore_for_file: public_member_api_docs

import 'package:dio/dio.dart';
import 'package:stadata_flutter_sdk/src/core/constants/constants.dart';
import 'package:stadata_flutter_sdk/src/core/di/service_locator.dart';
import 'package:stadata_flutter_sdk/src/core/storage/local_storage.dart';

class AuthenticationInterceptor extends Interceptor {
  LocalStorage get secureStorage => getIt<LocalStorage>(instanceName: 'secure');

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final apiKey = await secureStorage.get(StorageConstant.apiKey);

    options.queryParameters.addAll({'key': apiKey});

    super.onRequest(options, handler);
  }
}
