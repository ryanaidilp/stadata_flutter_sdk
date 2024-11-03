// ignore_for_file: public_member_api_docs

import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

abstract class NewsRepository {
  Future<Result<Failure, ApiResponse<List<News>>>> get({
    required String domain,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
    String? newsCategoryID,
    int? month,
    int? year,
    String? keyword,
  });
  Future<Result<Failure, ApiResponse<News>>> detail({
    required int id,
    required String domain,
    DataLanguage lang = DataLanguage.id,
  });
}
