import 'package:stadata_flutter_sdk/src/core/core.dart';

class StadataListHttpModule extends HttpModule {
  StadataListHttpModule()
      : super(injector.get<HttpClient>(instanceName: 'listClient'));
}
