import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:stadata_flutter_sdk/src/core/exceptions/exceptions.dart';
import 'package:stadata_flutter_sdk/src/core/network/base_network_interceptor.dart';
import 'package:stadata_flutter_sdk/src/core/network/request_data.dart';
import 'package:stadata_flutter_sdk/src/core/network/response_data.dart';

class NetworkClient {
  final String baseUrl;
  final Duration timeout;
  final List<BaseNetworkInterceptor> interceptors;

  NetworkClient({
    required this.baseUrl,
    this.timeout = const Duration(seconds: 30),
    this.interceptors = const [],
  });

  Future<Map<String, String>> _getHeaders() async => {
    'Content-Type': 'application/json',
  };

  Future<T> get<T>(
    String path, {
    Map<String, dynamic>? queryParams,
    T Function(Map<String, dynamic>)? responseConverter,
  }) async {
    return _sendRequest<T>(
      'GET',
      path,
      queryParams: queryParams,
      responseConverter: responseConverter,
    );
  }

  Future<T> post<T>(
    String path, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParams,
    T Function(Map<String, dynamic>)? responseConverter,
  }) async {
    return _sendRequest<T>(
      'POST',
      path,
      body: body,
      queryParams: queryParams,
      responseConverter: responseConverter,
    );
  }

  Future<T> put<T>(
    String path, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParams,
    T Function(Map<String, dynamic>)? responseConverter,
  }) async {
    return _sendRequest<T>(
      'PUT',
      path,
      body: body,
      queryParams: queryParams,
      responseConverter: responseConverter,
    );
  }

  Future<T> delete<T>(
    String path, {
    Map<String, dynamic>? queryParams,
    T Function(Map<String, dynamic>)? responseConverter,
  }) async {
    return _sendRequest<T>(
      'DELETE',
      path,
      queryParams: queryParams,
      responseConverter: responseConverter,
    );
  }

  Future<T> _sendRequest<T>(
    String method,
    String path, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParams,
    T Function(Map<String, dynamic>)? responseConverter,
  }) async {
    final client = HttpClient();
    HttpClientRequest? request;
    HttpClientResponse? response;

    try {
      // Prepare initial request data
      final uri = Uri.parse(baseUrl + path).replace(
        queryParameters: queryParams?.map(
          (key, value) => MapEntry(key, value.toString()),
        ),
      );

      final headers = await _getHeaders();
      var requestData = RequestData(
        method: method,
        uri: uri,
        headers: headers,
        body: body,
      );

      // Apply request interceptors
      for (final interceptor in interceptors) {
        requestData = await interceptor.onRequest(requestData);
      }

      // Create and send request
      request = await client.openUrl(requestData.method, requestData.uri);

      requestData.headers.forEach((key, value) {
        request?.headers.add(key, value);
      });

      if (requestData.body != null) {
        final jsonBody = json.encode(requestData.body);
        request.write(jsonBody);
      }

      response = await request.close();
      final responseBody = await response.transform(utf8.decoder).join();

      // Prepare response data
      final responseHeaders = <String, String>{};

      response.headers.forEach(
        (key, values) =>
            responseHeaders.putIfAbsent(key, () => values.join('; ')),
      );

      var responseData = ResponseData(
        statusCode: response.statusCode,
        request: requestData,
        headers: responseHeaders,
        body: responseBody.isNotEmpty ? json.decode(responseBody) : null,
      );

      // Apply response interceptors
      for (final interceptor in interceptors) {
        responseData = await interceptor.onResponse(responseData);
      }

      // Handle response
      if (responseData.statusCode >= 200 && responseData.statusCode < 300) {
        if (responseData.body == null) {
          return null as T;
        }

        if (responseConverter != null) {
          return responseConverter(responseData.body as Map<String, dynamic>);
        } else {
          return responseData.body as T;
        }
      } else {
        throw ApiException(
          'Request failed: ${responseData.statusCode} - ${responseData.body}',
          responseData.statusCode,
        );
      }
    } catch (error, stackTrace) {
      // Apply error interceptors
      try {
        for (final interceptor in interceptors) {
          final errorResponse = await interceptor.onError(error, stackTrace);
          // If interceptor handles the error and returns a response, use it
          return errorResponse.body as T;
        }
      } catch (e) {
        // If error handling fails, throw the original error
        if (error is ApiException) {
          rethrow;
        }
        throw ApiException('Unexpected error: $error');
      }
      rethrow;
    } finally {
      client.close();
    }
  }
}
