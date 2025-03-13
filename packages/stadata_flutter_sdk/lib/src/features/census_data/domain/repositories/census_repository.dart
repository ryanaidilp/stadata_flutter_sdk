import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

abstract class CensusRepository {
  Future<Result<Failure, ApiResponse<List<Census>>>> get();
  Future<Result<Failure, ApiResponse<List<CensusTopic>>>> getCensusTopics({
    required String censusID,
  });
}
