import 'package:stadata_flutter_sdk/src/base/base.dart';

class NewsConverter extends BaseConverter<String, String> {
  const NewsConverter();

  @override
  String fromJson(String json) => json;

  @override
  String toJson(String object) => object;
}
