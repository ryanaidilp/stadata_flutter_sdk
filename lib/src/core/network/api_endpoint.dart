// ignore_for_file: public_member_api_docs

import 'package:stadata_flutter_sdk/src/features/domains/domain/enums/domain_type.dart';
import 'package:stadata_flutter_sdk/src/shared/domain/enums/data_language.dart';

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

  static String publication({
    required String domain,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
    String? keyword,
    int? month,
    int? year,
  }) {
    final path = StringBuffer(
      'model/publication?domain=$domain&lang=${lang.value}&page=$page',
    );

    if (keyword != null && keyword.isNotEmpty) {
      path.write('&keyword=$keyword');
    }

    if (month != null) {
      path.write('&month=${month.toString().padLeft(2, '0')}');
    }

    if (year != null) {
      path.write('&year=$year');
    }

    return path.toString();
  }

  static String publicationDetail({
    required String id,
    required String domain,
    DataLanguage lang = DataLanguage.id,
  }) =>
      'model/publication?lang=${lang.value}&domain=$domain&id=$id';

  static String infographic({
    required String domain,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
    String? keyword,
  }) {
    final path = StringBuffer(
      'model/infographic?domain=$domain&lang=${lang.value}&page=$page',
    );

    if (keyword != null && keyword.isNotEmpty) {
      path.write('&keyword=$keyword');
    }

    return path.toString();
  }

  static String staticTable({
    required String domain,
    int page = 1,
    DataLanguage lang = DataLanguage.id,
    int? month,
    int? year,
    String? keyword,
  }) {
    final path = StringBuffer(
      'model/statictable?domain=$domain&page=$page&lang=${lang.value}',
    );

    if (month != null) {
      path.write('&month=${month.toString().padLeft(2, '0')}');
    }

    if (year != null) {
      path.write('&year=$year');
    }

    if (keyword != null && keyword.isNotEmpty) {
      path.write('&keyword=$keyword');
    }

    return path.toString();
  }

  static String staticTableDetail({
    required int id,
    required String domain,
    DataLanguage lang = DataLanguage.id,
  }) =>
      'model/statictable?id=$id&domain=$domain&lang=${lang.value}';
}
