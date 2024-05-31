import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:stadata_flutter_sdk/src/core/di/injector.dart';
import 'package:stadata_flutter_sdk/src/core/failures/failures.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/data/models/pagination_model.dart';
import 'package:stadata_flutter_sdk/src/shared/domain/entities/api_response.dart';
import 'package:stadata_flutter_sdk/src/shared/domain/enums/data_language.dart';

class StatisticClassificationRepositoryImpl
    implements StatisticClassificationRepository {
  final _remoteDataSource =
      injector.get<StatisticClassificationRemoteDataSource>();

  @override
  Future<Either<Failure, ApiResponse<List<StatisticClassification>>>> detail({
    required String id,
    required ClassificationType type,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
    int perPage = 10,
  }) async {
    try {
      final response = await _remoteDataSource.detail(
        id: id,
        page: page,
        lang: lang,
        type: type,
        perPage: perPage,
      );

      return Right(
        ApiResponse<List<StatisticClassification>>(
          data: response.data,
          status: response.status,
          message: response.message,
          pagination: response.pagination?.toEntity(),
          dataAvailability: response.dataAvailability,
        ),
      );
    } catch (e) {
      log(e.toString(), name: 'StadataException');
      return Left(StatisticClassificationFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ApiResponse<List<StatisticClassification>>>> get({
    required ClassificationType type,
    ClassificationLevel? level,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
    int perPage = 10,
  }) async {
    try {
      final response = await _remoteDataSource.get(
        page: page,
        lang: lang,
        type: type,
        level: level,
        perPage: perPage,
      );

      return Right(
        ApiResponse<List<StatisticClassification>>(
          data: response.data,
          status: response.status,
          message: response.message,
          pagination: response.pagination?.toEntity(),
          dataAvailability: response.dataAvailability,
        ),
      );
    } catch (e) {
      log(e.toString(), name: 'StadataException');
      return Left(StatisticClassificationFailure(message: e.toString()));
    }
  }
}
