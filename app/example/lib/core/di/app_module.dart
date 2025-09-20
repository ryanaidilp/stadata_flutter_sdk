import 'package:injectable/injectable.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

@module
abstract class AppModule {
  @singleton
  StadataFlutter get stadataFlutter => StadataFlutter.instance;
}
