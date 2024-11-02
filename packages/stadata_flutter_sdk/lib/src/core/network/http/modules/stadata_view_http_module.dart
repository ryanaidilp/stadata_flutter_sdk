import 'package:stadata_flutter_sdk/src/core/core.dart';

class StadataViewHttpModule extends HttpModule {
  StadataViewHttpModule()
      : super(injector.get<HttpClient>(instanceName: 'viewClient'));
}
