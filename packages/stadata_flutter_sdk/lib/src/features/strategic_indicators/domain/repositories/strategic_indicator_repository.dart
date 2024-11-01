// ignore_for_file: public_member_api_docs

import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

abstract interface class StrategicIndicatorRepository {
  Future<Result<Failure, ApiResponse<List<StrategicIndicator>>>> get({
    required String domain,
    DataLanguage lang = DataLanguage.id,
    int? variableID,
    int page = 1,
  });
}
