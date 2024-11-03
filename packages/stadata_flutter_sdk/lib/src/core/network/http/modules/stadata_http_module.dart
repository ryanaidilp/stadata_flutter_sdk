import 'package:stadata_flutter_sdk/src/core/core.dart';

class StadataHttpModule extends HttpModule {
  StadataHttpModule() : super(injector.get<HttpClient>());
}
