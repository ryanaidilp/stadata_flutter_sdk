// ignore_for_file: public_member_api_docs

import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

class SubjectCategoryRepositoryImpl implements SubjectCategoryRepository {
  final _remoteDataSource = injector.get<SubjectCategoryRemoteDataSource>();

  @override
  Future<Either<Failure, ApiResponse<List<SubjectCategory>>>> get({
    required String domain,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
  }) async {
    try {
      final result = await _remoteDataSource.get(
        domain: domain,
        lang: lang,
        page: page,
      );

      if (result.data == null) {
        throw const SubjectCategoryNotAvailableException();
      }

      final data = result.data?.map((e) => e.toEntity()).toList() ?? [];

      return Right(
        ApiResponse<List<SubjectCategory>>(
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
        SubjectCategoryFailure(
          message: e.toString(),
        ),
      );
    }
  }
}
