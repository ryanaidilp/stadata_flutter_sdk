// ignore_for_file: public_member_api_docs

import 'package:dartz/dartz.dart';
import 'package:stadata_flutter_sdk/src/core/failures/failures.dart';
import 'package:stadata_flutter_sdk/src/features/domains/domain/entities/domain_entity.dart';
import 'package:stadata_flutter_sdk/src/features/domains/domain/enums/domain_type.dart';
import 'package:stadata_flutter_sdk/src/shared/domain/entities/api_response.dart';

abstract class DomainRepository {
  Future<Either<Failure, ApiResponse<List<DomainEntity>>>> get({
    DomainType type = DomainType.all,
    String? provinceCode,
  });
}
