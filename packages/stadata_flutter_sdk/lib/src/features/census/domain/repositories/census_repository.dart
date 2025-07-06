import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

abstract class CensusRepository {
  Future<Result<Failure, ApiResponse<List<CensusEvent>>>> get();
  Future<Result<Failure, ApiResponse<List<CensusTopic>>>> getCensusTopics({
    required String censusID,
  });
  Future<Result<Failure, ApiResponse<List<CensusArea>>>> getCensusArea({
    required String censusID,
  });
  Future<Result<Failure, ApiResponse<List<CensusDataset>>>> getCensusDatasets({
    required String censusID,
    required int topicID,
  });
  Future<Result<Failure, ApiResponse<List<CensusData>>>> getCensusData({
    required String censusID,
    required String censusAreaID,
    required String datasetID,
  });
}
