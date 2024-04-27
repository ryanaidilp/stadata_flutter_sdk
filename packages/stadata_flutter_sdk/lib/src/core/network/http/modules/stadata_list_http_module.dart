// Package imports:

// ignore_for_file: public_member_api_docs

import 'package:stadata_flutter_sdk/src/core/di/injector.dart';
import 'package:stadata_flutter_sdk/src/core/network/http/http_client.dart';
import 'package:stadata_flutter_sdk/src/core/network/http/http_module.dart';

class StadataListHttpModule extends HttpModule {
  StadataListHttpModule()
      : super(injector.get<HttpClient>(instanceName: 'listClient'));
}
