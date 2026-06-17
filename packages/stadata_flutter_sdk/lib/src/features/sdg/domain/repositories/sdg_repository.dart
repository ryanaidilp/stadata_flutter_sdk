import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

abstract class SdgRepository {
  Future<Result<Failure, ApiResponse<List<SdgIndicator>>>> get({
    required String domain,
    required int goal,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
  });
}
