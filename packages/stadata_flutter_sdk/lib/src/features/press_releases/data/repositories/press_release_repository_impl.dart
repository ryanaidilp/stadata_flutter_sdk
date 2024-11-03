// ignore_for_file: public_member_api_docs

import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

class PressReleaseRepositoryImpl implements PressReleaseRepository {
  final _remoteDataSource = injector.get<PressReleaseRemoteDataSource>();

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
          data: result.data,
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

      final data = result.data?.map((e) => e).toList();

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
