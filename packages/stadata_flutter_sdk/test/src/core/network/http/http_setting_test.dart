import 'package:flutter_test/flutter_test.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';

void main() {
  group(
    'HttpTimeout',
    () {
      test(
        'has default value if initialize without custom params',
        () {
          const result = HttpTimeout();

          expect(result.connectTimeout, equals(30000));
          expect(result.sendTimeout, equals(20000));
          expect(result.receiveTimeout, equals(20000));
        },
      );

      test(
        'should use correct connectTimeout value if it passed to param',
        () {
          const result = HttpTimeout(
            connectTimeout: 50000,
          );

          expect(result.connectTimeout, equals(50000));
          expect(result.sendTimeout, equals(20000));
          expect(result.receiveTimeout, equals(20000));
        },
      );

      test(
        'should use correct sendTimeout value if it passed to param',
        () {
          const result = HttpTimeout(
            sendTimeout: 50000,
          );

          expect(result.connectTimeout, equals(30000));
          expect(result.sendTimeout, equals(50000));
          expect(result.receiveTimeout, equals(20000));
        },
      );

      test(
        'should use correct receiveTimeout value if it passed to param',
        () {
          const result = HttpTimeout(
            receiveTimeout: 50000,
          );

          expect(result.connectTimeout, equals(30000));
          expect(result.sendTimeout, equals(20000));
          expect(result.receiveTimeout, equals(50000));
        },
      );
    },
  );
  group(
    'HttpSetting',
    () {
      test(
        'should use default value param if no customization made '
        'and should use given base url',
        () {
          const result = HttpSetting(
            baseUrl: 'BASE_URL',
          );

          expect(result.baseUrl, equals('BASE_URL'));
          expect(result.interceptors, isNull);
          expect(result.contentType, equals('application/json'));
          expect(result.useHttp2, isFalse);
          expect(result.timeout, equals(const HttpTimeout()));
        },
      );

      test(
        'should use correct contentType that are passed from constructor param',
        () {
          const result = HttpSetting(
            baseUrl: 'BASE_URL',
            contentType: 'application/vnd.api+json',
          );

          expect(result.baseUrl, equals('BASE_URL'));
          expect(result.interceptors, isNull);
          expect(result.contentType, equals('application/vnd.api+json'));
          expect(result.useHttp2, isFalse);
          expect(result.timeout, equals(const HttpTimeout()));
        },
      );

      test(
        'should use correct useHttp2 that are passed from constructor param ',
        () {
          const result = HttpSetting(
            baseUrl: 'BASE_URL',
            useHttp2: true,
          );

          expect(result.baseUrl, equals('BASE_URL'));
          expect(result.interceptors, isNull);
          expect(result.contentType, equals('application/json'));
          expect(result.useHttp2, isTrue);
          expect(result.timeout, equals(const HttpTimeout()));
        },
      );

      test(
        'should use correct timeout that are passed from constructor param ',
        () {
          const httpTimeout = HttpTimeout(
            connectTimeout: 50000,
            receiveTimeout: 50000,
            sendTimeout: 60000,
          );
          const result = HttpSetting(
            baseUrl: 'BASE_URL',
            timeout: httpTimeout,
          );

          expect(result.baseUrl, equals('BASE_URL'));
          expect(result.interceptors, isNull);
          expect(result.contentType, equals('application/json'));
          expect(result.useHttp2, isFalse);
          expect(result.timeout, equals(httpTimeout));
        },
      );
    },
  );
}
