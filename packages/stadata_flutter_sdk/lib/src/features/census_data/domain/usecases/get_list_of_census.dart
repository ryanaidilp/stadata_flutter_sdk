import 'package:stadata_flutter_sdk/src/base/base.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

class GetListOfCensus
    extends UseCase<ApiResponse<List<Census>>, NoParams, CensusRepository> {
  const GetListOfCensus({required super.repo});

  @override
  Future<Result<Failure, ApiResponse<List<Census>>>> call(NoParams param) =>
      repo.get();
}
