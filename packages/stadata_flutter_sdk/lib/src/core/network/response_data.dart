import 'package:stadata_flutter_sdk/src/core/core.dart';

class ResponseData({
  required final int statusCode,
  required final Map<String, String> headers,
  required final dynamic body,
  required final RequestData request,
}) {
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
