import 'package:stadata_flutter_sdk/src/core/core.dart';

class ApiConfig {
  static final ApiConfig _instance = ApiConfig._internal();

  String? _apiKey;

  factory ApiConfig() => _instance;

  ApiConfig._internal();

  String get apiKey {
    if (_apiKey == null) {
      throw const StadataException(
        message: 'API Key not initialized. Call StadataFlutter.init() first.',
      );
    }

    return _apiKey!;
  }

  set apiKey(String key) => _apiKey = key;
}
