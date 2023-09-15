// ignore_for_file: public_member_api_docs

import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:stadata_flutter_sdk/src/core/di/service_locator.dart';
import 'package:stadata_flutter_sdk/src/core/failures/failures.dart';
import 'package:stadata_flutter_sdk/src/features/static_tables/data/datasources/static_table_remote_data_source.dart';
import 'package:stadata_flutter_sdk/src/features/static_tables/data/models/static_table_model.dart';
import 'package:stadata_flutter_sdk/src/features/static_tables/domain/repositories/static_table_repository.dart';
import 'package:stadata_flutter_sdk/src/shared/data/models/pagination_model.dart';
import 'package:stadata_flutter_sdk/src/shared/domain/entities/api_response.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

@LazySingleton(as: StaticTableRepository)
class StaticTableRepositoryImpl implements StaticTableRepository {
  final _remoteDataSource = getIt<StaticTableRemoteDataSource>();

  @override
  Future<Either<Failure, ApiResponse<StaticTable>>> detail({
    required int id,
    required String domain,
    DataLanguage lang = DataLanguage.id,
  }) async {
    try {
      final response = await _remoteDataSource.detail(
        id: id,
        lang: lang,
        domain: domain,
      );

      final staticTable = response.data;

      if (staticTable == null) {
        throw const StaticTableNotAvailableException();
      }

      return Right(
        ApiResponse<StaticTable>(
          data: staticTable.toEntity(),
          status: response.status,
          message: response.message,
          pagination: response.pagination?.toEntity(),
          dataAvailability: response.dataAvailability,
        ),
      );
    } on StaticTableException catch (e) {
      log(e.message, name: 'StadataException');
      return Left(StaticTableFailure(message: e.message));
    } catch (e) {
      log(e.toString(), name: 'StadataException');
      return Left(StaticTableFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ApiResponse<List<StaticTable>>>> get({
    required String domain,
    int page = 1,
    DataLanguage lang = DataLanguage.id,
    int? month,
    int? year,
    String? keyword,
  }) async {
    try {
      final response = await _remoteDataSource.get(
        page: page,
        lang: lang,
        year: year,
        domain: domain,
        month: month,
        keyword: keyword,
      );

      final staticTables = response.data?.map((e) => e.toEntity()).toList();

      return Right(
        ApiResponse<List<StaticTable>>(
          data: staticTables,
          status: response.status,
          message: response.message,
          pagination: response.pagination?.toEntity(),
          dataAvailability: response.dataAvailability,
        ),
      );
    } on StaticTableException catch (e) {
      log(e.message, name: 'StadataException');
      return Left(StaticTableFailure(message: e.message));
    } catch (e) {
      log(e.toString(), name: 'StadataException');
      return Left(StaticTableFailure(message: e.toString()));
    }
  }
}
