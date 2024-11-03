// ignore_for_file: public_member_api_docs, depend_on_referenced_packages

import 'package:stadata_flutter_sdk/src/base/base.dart';

class ApiStatusSerializer extends BaseConverter<String, bool> {
  const ApiStatusSerializer();

  @override
  bool fromJson(String json) => json == 'OK';

  @override
  String toJson(bool object) => object ? 'OK' : 'Error';
}
