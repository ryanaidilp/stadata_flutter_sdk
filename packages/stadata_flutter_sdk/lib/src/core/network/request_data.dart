class RequestData({
  required final String method,
  required final Uri uri,
  required final Map<String, String> headers,
  final dynamic body,
}) {
  RequestData copyWith({
    String? method,
    Uri? uri,
    Map<String, String>? headers,
    dynamic body,
  }) => RequestData(
    method: method ?? this.method,
    uri: uri ?? this.uri,
    headers: headers ?? this.headers,
    body: body ?? this.body,
  );
}
