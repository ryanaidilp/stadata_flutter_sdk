// ignore_for_file: public_member_api_docs, unnecessary_import

import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:stadata_flutter_sdk/src/core/di/service_locator.dart';
import 'package:stadata_flutter_sdk/src/core/failures/failures.dart';
import 'package:stadata_flutter_sdk/src/features/subjects/data/datasources/subject_remote_data_source.dart';
import 'package:stadata_flutter_sdk/src/features/subjects/data/models/subject_model.dart';
import 'package:stadata_flutter_sdk/src/features/subjects/domain/entities/subject.dart';
import 'package:stadata_flutter_sdk/src/features/subjects/domain/repositories/subject_repository.dart';
import 'package:stadata_flutter_sdk/src/shared/data/models/pagination_model.dart';
import 'package:stadata_flutter_sdk/src/shared/domain/entities/api_response.dart';
import 'package:stadata_flutter_sdk/src/shared/domain/enums/data_language.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

@LazySingleton(as: SubjectRepository)
class SubjectRepositoryImpl implements SubjectRepository {
  final _remoteDataSource = getIt<SubjectRemoteDataSource>();
  @override
  Future<Either<Failure, ApiResponse<List<Subject>>>> get({
    required String domain,
    int? subjectCategoryId,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
  }) async {
    try {
      final result = await _remoteDataSource.get(
        lang: lang,
        page: page,
        domain: domain,
        subjectCategoryId: subjectCategoryId,
      );

      if (result.data == null) {
        throw const SubjectNotAvailableException();
      }

      final data = result.data?.map((e) => e.toEntity()).toList();

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
