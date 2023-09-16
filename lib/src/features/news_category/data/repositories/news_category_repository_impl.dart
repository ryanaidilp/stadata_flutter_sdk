// ignore_for_file: public_member_api_docs

import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:stadata_flutter_sdk/src/core/di/service_locator.dart';
import 'package:stadata_flutter_sdk/src/core/failures/failures.dart';
import 'package:stadata_flutter_sdk/src/features/news_category/data/datasources/news_category_remote_data_source.dart';
import 'package:stadata_flutter_sdk/src/features/news_category/data/models/news_category_model.dart';
import 'package:stadata_flutter_sdk/src/features/news_category/domain/entities/news_category.dart';
import 'package:stadata_flutter_sdk/src/features/news_category/domain/respositories/news_category_repository.dart';
import 'package:stadata_flutter_sdk/src/shared/data/models/pagination_model.dart';
import 'package:stadata_flutter_sdk/src/shared/domain/entities/api_response.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

@LazySingleton(as: NewsCategoryRepository)
class NewsCategoryRepositoryImpl implements NewsCategoryRepository {
  final _dataSource = getIt<NewsCategoryRemoteDataSource>();

  @override
  Future<Either<Failure, ApiResponse<List<NewsCategory>>>> get({
    required String domain,
    DataLanguage lang = DataLanguage.id,
  }) async {
    try {
      final result = await _dataSource.get(
        lang: lang,
        domain: domain,
      );

      if (result.data == null) {
        throw const NewsCategoryNotAvailableException();
      }

      final data = result.data
              ?.map(
                (e) => e.toEntity(),
              )
              .toList() ??
          [];

      return Right(
        ApiResponse<List<NewsCategory>>(
          data: data,
          status: result.status,
          message: result.message,
          pagination: result.pagination?.toEntity(),
          dataAvailability: result.dataAvailability,
        ),
      );
    } catch (e) {
      log(e.toString(), name: 'StadataException');
      return Left(
        NewsCategoryFailure(
          message: e.toString(),
        ),
      );
    }
  }
}
