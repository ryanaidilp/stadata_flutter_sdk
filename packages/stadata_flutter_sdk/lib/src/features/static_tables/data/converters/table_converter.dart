import 'package:html_unescape/html_unescape.dart';
import 'package:stadata_flutter_sdk/src/base/base.dart';

class TableConverter extends BaseConverter<String, String> {
  const TableConverter();

  @override
  String fromJson(String json) {
    final cleanUpResult = HtmlUnescape().convert(json);

    return cleanUpResult;
  }

  @override
  String toJson(String object) => object;
}
