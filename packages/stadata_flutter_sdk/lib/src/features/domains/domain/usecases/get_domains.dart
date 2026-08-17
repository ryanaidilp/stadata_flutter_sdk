import 'package:stadata_flutter_sdk/src/base/usecase.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

class GetDomains
    implements
        UseCase<
          ApiResponse<List<DomainEntity>>,
          GetDomainParam,
          DomainRepository
        > {
  @override
  Future<Result<Failure, ApiResponse<List<DomainEntity>>>> call(
    GetDomainParam param,
  ) => repo.get(type: param.type, provinceCode: param.provinceCode);

  @override
  DomainRepository get repo => injector.get<DomainRepository>();
}

class const GetDomainParam({
  required final DomainType type,
  final String? provinceCode,
}) extends BaseEntity {
  @override
  List<Object?> get props => [type, provinceCode];
}
