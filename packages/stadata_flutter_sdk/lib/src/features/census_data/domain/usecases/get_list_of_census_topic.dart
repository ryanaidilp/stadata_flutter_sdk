import 'package:stadata_flutter_sdk/src/base/base.dart';
import 'package:stadata_flutter_sdk/src/core/base/result.dart';
import 'package:stadata_flutter_sdk/src/core/failures/failures.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

class GetListOfCensusTopic
    extends UseCase<ApiResponse<List<CensusTopic>>, String, CensusRepository> {
  const GetListOfCensusTopic({required super.repo});

  @override
  Future<Result<Failure, ApiResponse<List<CensusTopic>>>> call(String param) =>
      repo.getCensusTopics(censusID: param);
}
