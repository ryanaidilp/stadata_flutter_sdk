import 'package:stadata_flutter_sdk/src/base/base.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

class GetCensusData
    extends
        UseCase<
          ApiResponse<List<CensusData>>,
          GetCensusDataParam,
          CensusRepository
        > {
  GetCensusData({required super.repo});

  @override
  Future<Result<Failure, ApiResponse<List<CensusData>>>> call(
    GetCensusDataParam param,
  ) => repo.getCensusData(
    censusID: param.censusID,
    censusAreaID: param.censusAreaID,
    datasetID: param.datasetID,
  );
}

class GetCensusDataParam extends BaseEntity {
  const GetCensusDataParam({
    required this.censusID,
    required this.censusAreaID,
    required this.datasetID,
  });

  final String censusID;
  final String censusAreaID;
  final String datasetID;

  @override
  List<Object?> get props => [censusID, censusAreaID, datasetID];
}
