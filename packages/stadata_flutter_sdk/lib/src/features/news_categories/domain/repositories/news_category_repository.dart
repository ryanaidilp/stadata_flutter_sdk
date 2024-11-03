// ignore_for_file: public_member_api_docs

import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

abstract class NewsCategoryRepository {
  Future<Result<Failure, ApiResponse<List<NewsCategory>>>> get({
    required String domain,
    DataLanguage lang = DataLanguage.id,
  });
}
