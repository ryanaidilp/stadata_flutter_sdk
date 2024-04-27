// ignore_for_file: public_member_api_docs

import 'package:dio/dio.dart';

class HttpSetting {
  const HttpSetting({
    required this.baseUrl,
    this.interceptors,
    this.useHttp2 = false,
    this.contentType = 'application/json',
    this.timeout = const HttpTimeout(),
  });
  final bool useHttp2;
  final String baseUrl;
  final String contentType;
  final HttpTimeout timeout;
  final List<Interceptor>? interceptors;
}

class HttpTimeout {
  const HttpTimeout({
    this.connectTimeout = 30000,
    this.sendTimeout = 20000,
    this.receiveTimeout = 20000,
  });
  final int connectTimeout;
  final int sendTimeout;
  final int receiveTimeout;
}
