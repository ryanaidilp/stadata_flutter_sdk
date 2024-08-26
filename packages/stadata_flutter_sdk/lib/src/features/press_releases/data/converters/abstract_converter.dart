import 'package:stadata_flutter_sdk/src/base/base.dart';

class AbstractConverter extends BaseConverter<String?, String?> {
  const AbstractConverter();

  @override
  String? fromJson(String? json) => json
      ?.replaceAll('&quot;', '"')
      .replaceAll('quot;', '"')
      .replaceAll('&nbsp;', '')
      .replaceAll('&amp;', '&')
      .replaceAll('&lt;', '<')
      .replaceAll('&gt;', '>')
      .replaceAll(r'\r', '')
      .replaceAll('<nobr>', '<p>')
      .replaceAll('</nobr>', '</p>');

  @override
  String? toJson(String? object) => object;
}
