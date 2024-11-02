import 'package:html_unescape/html_unescape_small.dart';
import 'package:stadata_flutter_sdk/src/base/base.dart';

class NoteConverter extends BaseConverter<String, String> {
  const NoteConverter();

  @override
  String fromJson(String json) => HtmlUnescape().convert(json);

  @override
  String toJson(String object) => object;
}
