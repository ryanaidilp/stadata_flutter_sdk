// ignore_for_file: public_member_api_docs, depend_on_referenced_packages, lines_longer_than_80_chars

import 'package:json_annotation/json_annotation.dart';

class NewsSerializer extends JsonConverter<String, String> {
  const NewsSerializer();

  @override
  String fromJson(String json) => json
      .replaceAll('&quot;', '"')
      .replaceAll('&amp;', '&')
      .replaceAll('&lt;', '<')
      .replaceAll('&gt;', '>');

  @override
  String toJson(String object) => object;
}
