// ignore_for_file: public_member_api_docs

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logger/logger.dart';
import 'package:stadata_flutter_sdk/src/config/env.dart';
import 'package:stadata_flutter_sdk/src/core/log/filter/release_log_filter.dart';
import 'package:stadata_flutter_sdk/src/core/log/printer/simple_log_printer.dart';
import 'package:stadata_flutter_sdk/src/core/network/http/http_client.dart';
import 'package:stadata_flutter_sdk/src/core/network/http/http_setting.dart';
import 'package:stadata_flutter_sdk/src/core/network/http/interceptors/authentication_interceptor.dart';

abstract class RegisterModule {
  Logger get logger => Logger(
        filter: ReleaseLogFilter(),
        printer: PrefixPrinter(
          SimpleLogPrinter(),
          error: 'StadataError -',
          debug: 'StadataLog -',
          fatal: 'StadataFatalError -',
          info: 'StadataInfo -',
          trace: 'StadataTrace -',
          warning: 'StadataWarning -',
        ),
      );

  FlutterSecureStorage get secureStorage => const FlutterSecureStorage(
        aOptions: AndroidOptions(
          encryptedSharedPreferences: true,
          keyCipherAlgorithm:
              KeyCipherAlgorithm.RSA_ECB_OAEPwithSHA_256andMGF1Padding,
          storageCipherAlgorithm: StorageCipherAlgorithm.AES_GCM_NoPadding,
        ),
      );

  HttpClient get httpClient => HttpClient.init(
        HttpSetting(
          baseUrl: Env.apiBaseUrl,
          interceptors: [AuthenticationInterceptor()],
        ),
      );

  HttpClient get listHttpClient => HttpClient.init(
        HttpSetting(
          baseUrl: '${Env.apiBaseUrl}list/',
          interceptors: [AuthenticationInterceptor()],
        ),
      );

  HttpClient get viewHttpClient => HttpClient.init(
        HttpSetting(
          baseUrl: '${Env.apiBaseUrl}view/',
          interceptors: [AuthenticationInterceptor()],
        ),
      );
}
