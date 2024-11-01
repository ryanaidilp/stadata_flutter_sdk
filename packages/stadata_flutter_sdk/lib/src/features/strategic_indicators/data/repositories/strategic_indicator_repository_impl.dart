// ignore_for_file: public_member_api_docs

import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

class StrategicIndicatorRepositoryImpl implements StrategicIndicatorRepository {
  final _dataSource = injector.get<StrategicIndicatorRemoteDataSource>();

  @override
  Future<Either<Failure, ApiResponse<List<StrategicIndicator>>>> get({
    required String domain,
    DataLanguage lang = DataLanguage.id,
    int? variableID,
    int page = 1,
  }) async {
    try {
      final result = await _dataSource.get(
        variableID: variableID,
        domain: domain,
        lang: lang,
        page: page,
      );

      return Right(
        ApiResponse<List<StrategicIndicator>>(
          data: result.data,
          status: result.status,
          message: result.message,
          pagination: result.pagination?.toEntity(),
          dataAvailability: result.dataAvailability,
        ),
      );
    } catch (e) {
      log(e.toString(), name: 'StadataException');
      return Left(
        StrategicIndicatorFailure(
          message: e.toString(),
        ),
      );
    }
  }
}
