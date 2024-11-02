import 'package:stadata_flutter_sdk/src/base/base.dart';

class ApiStatusConverter extends BaseConverter<String, bool> {
  const ApiStatusConverter();

  @override
  bool fromJson(String json) => json == 'OK';

  @override
  String toJson(bool object) => object ? 'OK' : 'Error';
}
