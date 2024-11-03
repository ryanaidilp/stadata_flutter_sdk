import 'dart:async';

import 'package:stadata_flutter_sdk/src/core/network/request_data.dart';
import 'package:stadata_flutter_sdk/src/core/network/response_data.dart';

abstract  class BaseNetworkInterceptor {
  FutureOr<RequestData> onRequest(RequestData request) => request;
  FutureOr<ResponseData> onResponse(ResponseData response) => response;
  FutureOr<ResponseData> onError(Object error, StackTrace stackTrace) =>
      Future.error(error, stackTrace);
}
