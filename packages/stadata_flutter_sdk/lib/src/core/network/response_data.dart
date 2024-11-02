import 'package:stadata_flutter_sdk/src/core/core.dart';

class ResponseData {
  final int statusCode;
  final Map<String, String> headers;
  final dynamic body;
  final RequestData request;

  ResponseData({
    required this.statusCode,
    required this.headers,
    required this.body,
    required this.request,
  });

  ResponseData copyWith({
    int? statusCode,
    Map<String, String>? headers,
    RequestData? request,
    dynamic body,
  }) {
    return ResponseData(
      statusCode: statusCode ?? this.statusCode,
      headers: headers ?? this.headers,
      request: request ?? this.request,
      body: body ?? this.body,
    );
  }
}
