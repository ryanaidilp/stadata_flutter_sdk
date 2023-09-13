// ignore_for_file: public_member_api_docs

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:stadata_flutter_sdk/src/core/di/service_locator.dart';
import 'package:stadata_flutter_sdk/src/core/failures/failures.dart';
import 'package:stadata_flutter_sdk/src/features/domains/data/datasources/domain_remote_data_source.dart';
import 'package:stadata_flutter_sdk/src/features/domains/data/models/domain_model.dart';
import 'package:stadata_flutter_sdk/src/features/domains/domain/entities/domain_entity.dart';
import 'package:stadata_flutter_sdk/src/features/domains/domain/enums/domain_type.dart';
import 'package:stadata_flutter_sdk/src/features/domains/domain/repositories/domain_repository.dart';
import 'package:stadata_flutter_sdk/src/shared/data/models/api_response_model.dart';
import 'package:stadata_flutter_sdk/src/shared/domain/entities/api_response.dart';

@LazySingleton(as: DomainRepository)
class DomainRepositoryImpl implements DomainRepository {
  final dataSource = getIt<DomainRemoteDataSource>();

  @override
  Future<Either<Failure, ApiResponse<List<DomainEntity>>>> get({
    DomainType type = DomainType.all,
    String? provinceCode,
  }) async {
    try {
      if (type == DomainType.regencyByProvince && provinceCode == null) {
        return const Left(DomainProvinceCodeMissingFailure());
      }

      final result = await dataSource.get(
        type: type,
        provinceCode: provinceCode,
      );

      final entities = result.data
              ?.map(
                (e) => e.toEntity(),
              )
              .toList() ??
          [];

      final apiResponse = result.toEntitity<List<DomainModel>>();

      return Right(
        ApiResponse<List<DomainEntity>>(
          status: apiResponse.status,
          dataAvailability: apiResponse.dataAvailability,
          message: apiResponse.message,
          pagination: apiResponse.pagination,
          data: entities,
        ),
      );
    } catch (e) {
      return Left(DomainFailure(message: e.toString()));
    }
  }
}
