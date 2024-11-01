// ignore_for_file: one_member_abstracts, public_member_api_docs

import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

abstract class SubjectCategoryRepository {
  Future<Result<Failure, ApiResponse<List<SubjectCategory>>>> get({
    required String domain,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
  });
}
