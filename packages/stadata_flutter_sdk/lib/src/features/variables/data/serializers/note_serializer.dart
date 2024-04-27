// ignore_for_file: public_member_api_docs

import 'package:freezed_annotation/freezed_annotation.dart';

class NoteSerializer extends JsonConverter<String, String> {
  const NoteSerializer();

  @override
  String fromJson(String json) => json
      .replaceAll('&lt;', '<')
      .replaceAll('&gt;', '>')
      .replaceAll('&amp;', '&')
      .replaceAll('<p>', '')
      .replaceAll('</p>', '')
      .replaceAll('<br />', '')
      .replaceAll('<br/>', '');

  @override
  String toJson(String object) => object;
}
