// ignore_for_file: public_member_api_docs, unnecessary_import

import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

class SubjectRepositoryImpl implements SubjectRepository {
  final _remoteDataSource = injector.get<SubjectRemoteDataSource>();
  @override
  Future<Either<Failure, ApiResponse<List<Subject>>>> get({
    required String domain,
    int? subjectCategoryID,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
  }) async {
    try {
      final result = await _remoteDataSource.get(
        lang: lang,
        page: page,
        domain: domain,
        subjectCategoryID: subjectCategoryID,
      );

      if (result.data == null) {
        throw const SubjectNotAvailableException();
      }

      final data = result.data?.map((e) => e).toList();

      return Right(
        ApiResponse<List<Subject>>(
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
        SubjectFailure(
          message: e.toString(),
        ),
      );
    }
  }
}
