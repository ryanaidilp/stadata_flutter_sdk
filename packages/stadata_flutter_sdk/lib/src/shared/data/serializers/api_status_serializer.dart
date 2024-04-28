// ignore_for_file: public_member_api_docs, depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';

class ApiStatusSerializer extends JsonConverter<bool, String> {
  const ApiStatusSerializer();

  @override
  bool fromJson(String json) => json == 'OK';

  @override
  String toJson(bool object) => object ? 'OK' : 'Error';
}
