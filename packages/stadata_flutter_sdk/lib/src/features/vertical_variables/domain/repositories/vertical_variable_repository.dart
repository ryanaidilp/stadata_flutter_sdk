// ignore_for_file: public_member_api_docs

import 'package:dartz/dartz.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

abstract class VerticalVariableRepository {
  Future<Either<Failure, ApiResponse<List<VerticalVariable>>>> get({
    required String domain,
    int page = 1,
    DataLanguage lang = DataLanguage.id,
    int? variableID,
  });
}
