// ignore_for_file: public_member_api_docs, depend_on_referenced_packages, lines_longer_than_80_chars

import 'package:stadata_flutter_sdk/src/base/base.dart';

class TableSerializer extends BaseConverter<String, String> {
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
