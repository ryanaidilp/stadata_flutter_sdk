// ignore_for_file: public_member_api_docs

import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

class NewsCategoryRepositoryImpl implements NewsCategoryRepository {
  final _dataSource = injector.get<NewsCategoryRemoteDataSource>();

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

      final data = result.data?.map((e) => e).toList() ?? [];

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
