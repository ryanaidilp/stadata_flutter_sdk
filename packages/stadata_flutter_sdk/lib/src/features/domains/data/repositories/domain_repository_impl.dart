// ignore_for_file: public_member_api_docs

import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

class DomainRepositoryImpl implements DomainRepository {
  final dataSource = injector.get<DomainRemoteDataSource>();

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

      if (result.data == null) {
        throw const DomainNotAvailableException();
      }

      final entities = result.data?.map((e) => e.toEntity()).toList() ?? [];

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
      log(e.toString(), name: 'StadataException');
      return Left(DomainFailure(message: e.toString()));
    }
  }
}
