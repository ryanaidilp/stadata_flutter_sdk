import 'package:stadata_flutter_sdk/src/base/base.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

class GetListOfCensusEvents
    extends
        UseCase<ApiResponse<List<CensusEvent>>, NoParams, CensusRepository> {
  const GetListOfCensusEvents({required super.repo});

  @override
  Future<Result<Failure, ApiResponse<List<CensusEvent>>>> call(
    NoParams param,
  ) => repo.get();
}
