// ignore_for_file: public_member_api_docs, one_member_abstracts

import 'package:injectable/injectable.dart';
import 'package:stadata_flutter_sdk/src/core/di/service_locator.dart';
import 'package:stadata_flutter_sdk/src/features/publications/domain/entities/publication.dart';
import 'package:stadata_flutter_sdk/src/features/publications/domain/usecases/get_all_publication.dart';
import 'package:stadata_flutter_sdk/src/features/domains/domain/usecases/get_domains.dart';
import 'package:stadata_flutter_sdk/src/features/domains/domains.dart';
import 'package:stadata_flutter_sdk/src/shared/domain/entities/list_result.dart';

import 'package:stadata_flutter_sdk/src/shared/domain/enums/data_language.dart';

abstract class StadataList {
  Future<ListResult<DomainEntity>> domains({
    DomainType type = DomainType.all,
    String? provinceCode,
  });
  Future<ListResult<Publication>> publications({
    required String domain,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
    String? keyword,
    int? month,
    int? year,
  });
}

@LazySingleton(as: StadataList)
class StadataListImpl implements StadataList {
  final getDomains = getIt<GetDomains>();
  final getAllPublications = getIt<GetAllPublication>();

  @override
  Future<ListResult<DomainEntity>> domains({
    DomainType type = DomainType.all,
    String? provinceCode,
  }) async {
    final result = await getDomains(
      GetDomainParam(
        type: type,
        provinceCode: provinceCode,
      ),
    );

    return result.fold(
      (l) => throw Exception(l.message),
      (r) => ListResult<DomainEntity>(
        data: r.data ?? [],
        pagination: r.pagination,
      ),
    );
  }

  @override
  Future<ListResult<Publication>> publications({
    required String domain,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
    String? keyword,
    int? month,
    int? year,
  }) async {
    final result = await getAllPublications(
      GetPublicationParam(
        domain: domain,
        lang: lang,
        page: page,
        keyword: keyword,
        month: month,
        year: year,
      ),
    );

    return result.fold(
      (l) => throw Exception(l.message),
      (r) => ListResult(
        data: r.data ?? [],
        pagination: r.pagination,
      ),
    );
  }
}
