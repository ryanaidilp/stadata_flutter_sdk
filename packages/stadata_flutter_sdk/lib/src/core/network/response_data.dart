class ResponseData {
  final int statusCode;
  final Map<String, String> headers;
  final dynamic body;

  ResponseData({
    required this.statusCode,
    required this.headers,
    required this.body,
  });

  ResponseData copyWith({
    int? statusCode,
    Map<String, String>? headers,
    dynamic body,
  }) {
    return ResponseData(
      statusCode: statusCode ?? this.statusCode,
      headers: headers ?? this.headers,
      body: body ?? this.body,
    );
  }
}
