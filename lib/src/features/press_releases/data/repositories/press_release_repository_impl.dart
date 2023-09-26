// ignore_for_file: public_member_api_docs

import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:stadata_flutter_sdk/src/core/di/service_locator.dart';
import 'package:stadata_flutter_sdk/src/core/failures/failures.dart';
import 'package:stadata_flutter_sdk/src/features/press_releases/data/datasources/press_release_remote_data_source.dart';
import 'package:stadata_flutter_sdk/src/features/press_releases/data/models/press_release_model.dart';
import 'package:stadata_flutter_sdk/src/features/press_releases/domain/repositories/press_release_repository.dart';
import 'package:stadata_flutter_sdk/src/shared/data/models/pagination_model.dart';
import 'package:stadata_flutter_sdk/src/shared/domain/entities/api_response.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

@LazySingleton(as: PressReleaseRepository)
class PressReleaseRepositoryImpl implements PressReleaseRepository {
  final _remoteDataSource = getIt<PressReleaseRemoteDataSource>();

  @override
  Future<Either<Failure, ApiResponse<PressRelease>>> detail({
    required int id,
    required String domain,
    DataLanguage lang = DataLanguage.id,
  }) async {
    try {
      final result = await _remoteDataSource.detail(
        id: id,
        lang: lang,
        domain: domain,
      );

      if (result.data == null) {
        throw const PressReleaseNotAvailableException();
      }

      return Right(
        ApiResponse<PressRelease>(
          data: result.data?.toEntity(),
          status: result.status,
          message: result.message,
          pagination: result.pagination?.toEntity(),
          dataAvailability: result.dataAvailability,
        ),
      );
    } catch (e) {
      log(e.toString(), name: 'StadataException');
      return Left(PressReleaseFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ApiResponse<List<PressRelease>>>> get({
    required String domain,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
    int? month,
    int? year,
    String? keyword,
  }) async {
    try {
      final result = await _remoteDataSource.get(
        page: page,
        lang: lang,
        year: year,
        month: month,
        domain: domain,
        keyword: keyword,
      );

      if (result.data == null) {
        throw const NewsNotAvailableException();
      }

      final data = result.data?.map((e) => e.toEntity()).toList();

      return Right(
        ApiResponse<List<PressRelease>>(
          data: data,
          status: result.status,
          message: result.message,
          pagination: result.pagination?.toEntity(),
          dataAvailability: result.dataAvailability,
        ),
      );
    } catch (e) {
      log(e.toString(), name: 'StadataException');
      return Left(PressReleaseFailure(message: e.toString()));
    }
  }
}
