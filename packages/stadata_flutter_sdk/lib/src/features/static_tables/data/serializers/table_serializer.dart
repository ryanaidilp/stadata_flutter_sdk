// ignore_for_file: public_member_api_docs, depend_on_referenced_packages, lines_longer_than_80_chars

import 'package:json_annotation/json_annotation.dart';

class TableSerializer extends JsonConverter<String, String> {
  const TableSerializer();

  @override
  String fromJson(String json) => json
      .replaceAll('&quot;', '"')
      .replaceAll('&nbsp;', '\u00A0')
      .replaceAll('&amp;', '&')
      .replaceAll('&lt;', '<')
      .replaceAll('&gt;', '>');

  @override
  String toJson(String object) => object;
}
