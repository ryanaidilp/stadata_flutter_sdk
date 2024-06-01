// ignore_for_file: public_member_api_docs

import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

class InfographicRepositoryImpl implements InfographicRepository {
  final _remoteDataSource = injector.get<InfographicRemoteDataSource>();

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

      if (result.data == null) {
        throw const InfographicNotAvailableException();
      }

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
    } catch (e) {
      log(e.toString(), name: 'StadataException');
      return Left(InfographicFailure(message: e.toString()));
    }
  }
}
