// ignore_for_file: public_member_api_docs

import 'package:freezed_annotation/freezed_annotation.dart';

class AbstractSerializer extends JsonConverter<String, String> {
  const AbstractSerializer();

  @override
  String fromJson(String json) => json
      .replaceAll('&quot;', '"')
      .replaceAll('quot;', '"')
      .replaceAll('&nbsp;', '')
      .replaceAll('&amp;', '&')
      .replaceAll('&lt;', '<')
      .replaceAll('&gt;', '>')
      .replaceAll(r'\r', '')
      .replaceAll('<nobr>', '<p>')
      .replaceAll('</nobr>', '</p>');
  @override
  String toJson(String object) => object;
}
