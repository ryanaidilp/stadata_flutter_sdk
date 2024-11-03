// ignore_for_file: public_member_api_docs

import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

abstract class StaticTableRepository {
  Future<Result<Failure, ApiResponse<List<StaticTable>>>> get({
    required String domain,
    int page = 1,
    DataLanguage lang = DataLanguage.id,
    int? month,
    int? year,
    String? keyword,
  });
  Future<Result<Failure, ApiResponse<StaticTable>>> detail({
    required int id,
    required String domain,
    DataLanguage lang = DataLanguage.id,
  });
}
