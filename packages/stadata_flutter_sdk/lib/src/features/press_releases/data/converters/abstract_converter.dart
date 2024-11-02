import 'package:html_unescape/html_unescape_small.dart';
import 'package:stadata_flutter_sdk/src/base/base.dart';

class AbstractConverter extends BaseConverter<String?, String?> {
  const AbstractConverter();

  @override
  String? fromJson(String? json) =>
      json == null ? null : HtmlUnescape().convert(json);

  @override
  String? toJson(String? object) => object;
}
