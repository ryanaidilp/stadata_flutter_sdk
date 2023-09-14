// ignore_for_file: public_member_api_docs

import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:stadata_flutter_sdk/src/core/di/service_locator.dart';
import 'package:stadata_flutter_sdk/src/core/exceptions/exceptions.dart';
import 'package:stadata_flutter_sdk/src/core/failures/failures.dart';
import 'package:stadata_flutter_sdk/src/features/infographics/data/datasources/infographic_remote_data_source.dart';
import 'package:stadata_flutter_sdk/src/features/infographics/data/models/infographic_model.dart';
import 'package:stadata_flutter_sdk/src/features/infographics/domain/entities/infographic.dart';
import 'package:stadata_flutter_sdk/src/features/infographics/domain/repositories/infographic_repository.dart';
import 'package:stadata_flutter_sdk/src/shared/data/models/pagination_model.dart';
import 'package:stadata_flutter_sdk/src/shared/domain/entities/api_response.dart';
import 'package:stadata_flutter_sdk/src/shared/domain/enums/data_language.dart';

@LazySingleton(as: InfographicRepository)
class InfographicRepositoryImpl implements InfographicRepository {
  final _remoteDataSource = getIt<InfographicRemoteDataSource>();

  @override
  Future<Either<Failure, ApiResponse<List<Infographic>>>> get({
    required String domain,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
    String? keyword,
  }) async {
    try {
      final result = await _remoteDataSource.get(
        domain: domain,
        page: page,
        lang: lang,
        keyword: keyword,
      );

      final data = result.data?.map((e) => e.toEntity()).toList();

      return Right(
        ApiResponse(
          status: result.status,
          data: data,
          dataAvailability: result.dataAvailability,
          message: result.message,
          pagination: result.pagination?.toEntity(),
        ),
      );
    } on InfographicException catch (e) {
      log(e.message, name: 'StadataException');
      return Left(InfographicFailure(message: e.message));
    } on InfographicNotAvailableException catch (e) {
      log(e.message, name: 'StadataException');
      return Left(InfographicFailure(message: e.message));
    } catch (e) {
      log(e.toString(), name: 'StadataException');
      return Left(InfographicFailure(message: e.toString()));
    }
  }
}
