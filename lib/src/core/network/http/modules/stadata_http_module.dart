// Package imports:

// ignore_for_file: public_member_api_docs

import 'package:injectable/injectable.dart';
import 'package:stadata_flutter_sdk/src/core/di/service_locator.dart';
import 'package:stadata_flutter_sdk/src/core/network/http/http_client.dart';
import 'package:stadata_flutter_sdk/src/core/network/http/http_module.dart';

@LazySingleton()
class StadataHttpModule extends HttpModule {
  StadataHttpModule() : super(getIt<HttpClient>());
}
