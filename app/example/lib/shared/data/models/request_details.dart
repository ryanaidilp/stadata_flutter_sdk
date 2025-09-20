/// Shared request details model to track API call information across all features
class RequestDetails {
  const RequestDetails({
    required this.url,
    required this.method,
    required this.parameters,
    this.responseTime,
    this.statusCode,
    this.errorMessage,
  });

  final String url;
  final String method;
  final Map<String, dynamic> parameters;
  final Duration? responseTime;
  final int? statusCode;
  final String? errorMessage;

  /// Creates a copy of this RequestDetails with the given fields replaced
  RequestDetails copyWith({
    String? url,
    String? method,
    Map<String, dynamic>? parameters,
    Duration? responseTime,
    int? statusCode,
    String? errorMessage,
  }) {
    return RequestDetails(
      url: url ?? this.url,
      method: method ?? this.method,
      parameters: parameters ?? this.parameters,
      responseTime: responseTime ?? this.responseTime,
      statusCode: statusCode ?? this.statusCode,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  /// Converts the request details to a readable string format
  String toReadableString() {
    final buffer = StringBuffer();
    buffer.writeln('Method: $method');
    buffer.writeln('URL: $url');
    if (parameters.isNotEmpty) {
      buffer.writeln('Parameters:');
      parameters.forEach((key, value) {
        buffer.writeln('  $key: $value');
      });
    }
    if (responseTime != null) {
      buffer.writeln('Response Time: ${responseTime!.inMilliseconds}ms');
    }
    if (statusCode != null) {
      buffer.writeln('Status Code: $statusCode');
    }
    if (errorMessage != null) {
      buffer.writeln('Error: $errorMessage');
    }
    return buffer.toString();
  }
}
