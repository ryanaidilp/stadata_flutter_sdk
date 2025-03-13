import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

class ApiEndpoint {
  const ApiEndpoint._();

  static const String _model = 'model';

  static const String _datasource = 'datasource';

  static String get domain => 'domain';

  static String get publication => '$_model/publication';

  static String get infographic => '$_model/infographic';

  static String get staticTable => '$_model/statictable';

  static String get news => '$_model/news';

  static String get newsCategory => '$_model/newscategory';

  static String get subjectCategory => '$_model/subcat';

  static String get subject => '$_model/subject';

  static String get pressRelease => '$_model/pressrelease';

  static String get strategicIndicator => '$_model/indicators';

  static String get variable => '$_model/var';

  static String get verticalVariable => '$_model/vervar';

  static String get unit => '$_model/unit';

  static String statisticClassification({required ClassificationType type}) =>
      '$_model/${type.value}';

  static String get census => '$_datasource/sensus';
}
