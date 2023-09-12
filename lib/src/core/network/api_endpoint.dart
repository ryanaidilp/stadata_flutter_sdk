// ignore_for_file: public_member_api_docs

import 'package:stadata_flutter_sdk/src/list/domains/domain/enums/domain_type.dart';

class ApiEndpoint {
  const ApiEndpoint._();

  static String domain({
    DomainType type = DomainType.all,
    String? provinceCode,
  }) {
    final path = StringBuffer('domain?type=${type.value}');

    if (type == DomainType.regencyByProvince) {
      assert(
        provinceCode != null,
        'provinceCode must be provided if type is ${type.name}',
      );

      path.write('&prov=$provinceCode');
    }

    return path.toString();
  }
}
