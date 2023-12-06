// ignore_for_file: public_member_api_docs

import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:stadata_flutter_sdk/src/core/di/service_locator.dart';
import 'package:stadata_flutter_sdk/src/core/failures/failures.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/features/strategic_indicators/data/datasources/strategic_indicator_remote_data_source.dart';
import 'package:stadata_flutter_sdk/src/features/strategic_indicators/data/models/strategic_indicator_model.dart';
import 'package:stadata_flutter_sdk/src/shared/data/models/pagination_model.dart';
import 'package:stadata_flutter_sdk/src/shared/domain/entities/api_response.dart';
import 'package:stadata_flutter_sdk/src/shared/domain/enums/data_language.dart';

@LazySingleton(as: StrategicIndicatorRepository)
class StrategicIndicatorRepositoryImpl implements StrategicIndicatorRepository {
  final _dataSource = getIt<StrategicIndicatorRemoteDataSource>();

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

      final data = result.data?.map((e) => e.toEntity()).toList();

      return Right(
        ApiResponse<List<StrategicIndicator>>(
          data: data,
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
