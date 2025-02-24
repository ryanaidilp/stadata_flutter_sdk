class RequestData {
  final String method;
  final Uri uri;
  final Map<String, String> headers;

  final dynamic body;

  RequestData({
    required this.method,
    required this.uri,
    required this.headers,
    this.body,
  });

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
