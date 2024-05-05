import 'package:dartz/dartz.dart';
import 'package:stadata_flutter_sdk/src/core/failures/failures.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

abstract interface class StatisticClassificationRepository {
  Future<Either<Failure, List<StatisticClassification>>> get({
    required ClassificationType type,
    ClassificationLevel? level,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
    int perPage = 10,
  });
  Future<Either<Failure, List<StatisticClassification>>> detail({
    required String id,
    required ClassificationType type,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
    int perPage = 10,
  });
}
