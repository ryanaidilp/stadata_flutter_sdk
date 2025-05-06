import 'package:stadata_flutter_sdk/src/base/base.dart';
import 'package:stadata_flutter_sdk/src/core/base/result.dart';
import 'package:stadata_flutter_sdk/src/core/failures/failures.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

class GetListOfCensusArea
    extends UseCase<ApiResponse<List<CensusArea>>, String, CensusRepository> {
  const GetListOfCensusArea({required super.repo});

  @override
  Future<Result<Failure, ApiResponse<List<CensusArea>>>> call(String param) =>
      repo.getCensusArea(censusID: param);
}
