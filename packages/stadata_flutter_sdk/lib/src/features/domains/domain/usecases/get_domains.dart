// ignore_for_file: public_member_api_docs

import 'package:stadata_flutter_sdk/src/base/usecase.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

class GetDomains
    implements
        UseCase<ApiResponse<List<DomainEntity>>, GetDomainParam,
            DomainRepository> {
  @override
  Future<Result<Failure, ApiResponse<List<DomainEntity>>>> call(
    GetDomainParam param,
  ) =>
      repo.get(
        type: param.type,
        provinceCode: param.provinceCode,
      );

  @override
  DomainRepository get repo => injector.get<DomainRepository>();
}

class GetDomainParam extends BaseEntity {
  const GetDomainParam({required this.type, this.provinceCode});

  final String? provinceCode;
  final DomainType type;

  @override
  List<Object?> get props => [type, provinceCode];
}
