// ignore_for_file: public_member_api_docs

import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:stadata_flutter_sdk/src/core/di/service_locator.dart';
import 'package:stadata_flutter_sdk/src/core/failures/failures.dart';
import 'package:stadata_flutter_sdk/src/features/vertical_variables/data/datasources/vertical_variable_remote_data_source.dart';
import 'package:stadata_flutter_sdk/src/features/vertical_variables/data/models/vertical_variable_model.dart';
import 'package:stadata_flutter_sdk/src/features/vertical_variables/domain/repositories/vertical_variable_repository.dart';
import 'package:stadata_flutter_sdk/src/shared/data/models/pagination_model.dart';
import 'package:stadata_flutter_sdk/src/shared/domain/entities/api_response.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

@LazySingleton(as: VerticalVariableRepository)
class VerticalVariableRepositoryImpl implements VerticalVariableRepository {
  final _remoteDataSource = getIt<VerticalVariableRemoteDataSource>();

  @override
  Future<Either<Failure, ApiResponse<List<VerticalVariable>>>> get({
    required String domain,
    int page = 1,
    DataLanguage lang = DataLanguage.id,
    int? variableID,
  }) async {
    try {
      final result = await _remoteDataSource.get(
        domain: domain,
        lang: lang,
        page: page,
        variableID: variableID,
      );

      if (result.data == null ||
          result.dataAvailability == DataAvailability.listNotAvailable) {
        throw const VerticalVariableNotAvailableException();
      }

      final data = result.data?.map((e) => e.toEntity()).toList() ?? [];

      return Right(
        ApiResponse<List<VerticalVariable>>(
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
        VariableFailure(
          message: e.toString(),
        ),
      );
    }
  }
}
