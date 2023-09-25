// ignore_for_file: one_member_abstracts, public_member_api_docs

import 'package:dartz/dartz.dart';
import 'package:stadata_flutter_sdk/src/core/failures/failures.dart';
import 'package:stadata_flutter_sdk/src/shared/domain/entities/api_response.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

abstract class SubjectCategoryRepository {
  Future<Either<Failure, ApiResponse<List<SubjectCategory>>>> get({
    required String domain,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
  });
}
