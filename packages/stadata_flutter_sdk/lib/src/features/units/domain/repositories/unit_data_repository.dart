import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

abstract class UnitDataRepository {
  Future<Result<Failure, ApiResponse<List<UnitData>>>> get({
    required String domain,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
    int? variableID,
  });
}
