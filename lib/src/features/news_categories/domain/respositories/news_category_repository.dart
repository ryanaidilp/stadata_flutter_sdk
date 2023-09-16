// ignore_for_file: public_member_api_docs

import 'package:dartz/dartz.dart';
import 'package:stadata_flutter_sdk/src/core/failures/failures.dart';
import 'package:stadata_flutter_sdk/src/features/news_categories/domain/entities/news_category.dart';
import 'package:stadata_flutter_sdk/src/shared/domain/entities/api_response.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

abstract class NewsCategoryRepository {
  Future<Either<Failure, ApiResponse<List<NewsCategory>>>> get({
    required String domain,
    DataLanguage lang = DataLanguage.id,
  });
}
