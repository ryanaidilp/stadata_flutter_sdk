import 'package:stadata_flutter_sdk/src/base/base.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

class GetListOfCensusDatasets
    extends
        UseCase<
          ApiResponse<List<CensusDataset>>,
          GetListOfCensusDatasetsParam,
          CensusRepository
        > {
  GetListOfCensusDatasets({required super.repo});

  @override
  Future<Result<Failure, ApiResponse<List<CensusDataset>>>> call(
    GetListOfCensusDatasetsParam param,
  ) => repo.getCensusDatasets(censusID: param.censusID, topicID: param.topicID);
}

class const GetListOfCensusDatasetsParam({
  required final String censusID,
  required final int topicID,
}) extends BaseEntity {
  @override
  List<Object?> get props => [censusID, topicID];
}
