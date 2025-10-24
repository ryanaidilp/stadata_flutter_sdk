import 'dart:io';

import 'package:alice_http_client/alice_http_client_adapter.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

/// Simple Alice interceptor for STADATA Flutter SDK
///
/// This interceptor provides a basic integration with Alice HTTP inspector.
/// It logs requests and responses in a simple format that can be viewed
/// through Alice's interface.
///
/// Usage:
/// ```dart
/// final alice = Alice();
///
/// await StadataFlutter.instance.init(
///   apiKey: 'your_api_key',
///   interceptors: [AliceInterceptor(alice)],
/// );
///
/// // Open Alice inspector
/// alice.showInspector();
/// ```
class AliceInterceptor extends StadataHttpInterceptor {

  AliceInterceptor(this.adapter);
  final AliceHttpClientAdapter adapter;

  @override
  void onRequest(HttpClientRequest request, {dynamic body}) {
    // Log basic request info to Alice
    // For now, we'll use a simple approach since Alice API might be different
    _logRequestInfo(request, body);
  }

  @override
  void onResponse(
    HttpClientResponse response,
    HttpClientRequest request, {
    dynamic body,
  }) {
    // Log basic response info to Alice
    _logResponseInfo(response, request, body);
  }

  void _logRequestInfo(HttpClientRequest request, dynamic body) =>
      adapter.onRequest(request, body: body);

  void _logResponseInfo(
    HttpClientResponse response,
    HttpClientRequest request,
    dynamic body,
  ) => adapter.onResponse(response, request, body: body);

  @override
  void onError(Object error, StackTrace stackTrace) {}
}
