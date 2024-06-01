import 'package:dartz/dartz.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';

import 'package:stadata_flutter_sdk/src/shared/shared.dart';

abstract interface class StatisticClassificationRepository {
  Future<Either<Failure, ApiResponse<List<StatisticClassification>>>> get({
    required ClassificationType type,
    ClassificationLevel? level,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
    int perPage = 10,
  });
  Future<Either<Failure, ApiResponse<List<StatisticClassification>>>> detail({
    required String id,
    required ClassificationType type,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
    int perPage = 10,
  });
}
