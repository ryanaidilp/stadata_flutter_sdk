import 'dart:io';

abstract class StadataHttpInterceptor {
  void onRequest(HttpClientRequest request, {dynamic body});
  void onResponse(
    HttpClientResponse response,
    HttpClientRequest request, {
    dynamic body,
  });
  void onError(Object error, StackTrace stackTrace);
}
