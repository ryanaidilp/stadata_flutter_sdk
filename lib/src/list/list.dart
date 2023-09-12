// ignore_for_file: public_member_api_docs, one_member_abstracts

import 'package:injectable/injectable.dart';
import 'package:stadata_flutter_sdk/src/core/di/service_locator.dart';
import 'package:stadata_flutter_sdk/src/core/failures/failures.dart';
import 'package:stadata_flutter_sdk/src/list/domains/domain/usecases/get_domains.dart';
import 'package:stadata_flutter_sdk/src/list/domains/domains.dart';
import 'package:stadata_flutter_sdk/src/shared/domain/entities/pagination.dart';

abstract class StadataList {
  Future<ListResult<DomainEntity>> domains({
    DomainType type = DomainType.all,
    String? provinceCode,
  });
}

@LazySingleton(as: StadataList)
class StadataListImpl implements StadataList {
  final getDomains = getIt<GetDomains>();

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
      (l) => switch (l) {
        DomainFailure(:final message) => throw Exception(message),
        DomainProvinceCodeMissingFailure(:final message) =>
          throw Exception(message),
      },
      (r) => ListResult<DomainEntity>(
        data: r.data ?? [],
        pagination: r.pagination,
      ),
    );
  }
}

class ListResult<T> {
  const ListResult({
    required this.data,
    this.pagination,
  });
  final List<T> data;
  final Pagination? pagination;
}
