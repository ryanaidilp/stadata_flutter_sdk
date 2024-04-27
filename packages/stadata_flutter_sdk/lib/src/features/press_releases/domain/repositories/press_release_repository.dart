// ignore_for_file: public_member_api_docs

import 'package:dartz/dartz.dart';
import 'package:stadata_flutter_sdk/src/core/failures/failures.dart';
import 'package:stadata_flutter_sdk/src/shared/domain/entities/api_response.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

abstract class PressReleaseRepository {
  Future<Either<Failure, ApiResponse<List<PressRelease>>>> get({
    required String domain,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
    int? month,
    int? year,
    String? keyword,
  });
  Future<Either<Failure, ApiResponse<PressRelease>>> detail({
    required int id,
    required String domain,
    DataLanguage lang = DataLanguage.id,
  });
}
