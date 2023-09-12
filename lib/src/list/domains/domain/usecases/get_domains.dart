// ignore_for_file: public_member_api_docs

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:stadata_flutter_sdk/src/base/usecase.dart';
import 'package:stadata_flutter_sdk/src/core/di/service_locator.dart';
import 'package:stadata_flutter_sdk/src/core/failures/failures.dart';
import 'package:stadata_flutter_sdk/src/list/domains/domain/entities/domain_entity.dart';
import 'package:stadata_flutter_sdk/src/list/domains/domain/enums/domain_type.dart';
import 'package:stadata_flutter_sdk/src/list/domains/domain/repositories/domain_repository.dart';
import 'package:stadata_flutter_sdk/src/shared/domain/entities/api_response.dart';

@LazySingleton()
class GetDomains
    implements
        UseCase<ApiResponse<List<DomainEntity>>, GetDomainParam,
            DomainRepository> {
  @override
  Future<Either<Failure, ApiResponse<List<DomainEntity>>>> call(
    GetDomainParam param,
  ) =>
      repo.get(
        type: param.type,
        provinceCode: param.provinceCode,
      );

  @override
  DomainRepository get repo => getIt<DomainRepository>();
}

class GetDomainParam extends Equatable {
  const GetDomainParam({required this.type, this.provinceCode});

  final String? provinceCode;
  final DomainType type;

  @override
  List<Object?> get props => [type, provinceCode];
}
