// ignore_for_file: public_member_api_docs

import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:stadata_flutter_sdk/src/core/di/service_locator.dart';
import 'package:stadata_flutter_sdk/src/core/failures/failures.dart';
import 'package:stadata_flutter_sdk/src/features/variables/data/datasources/variable_remote_data_source.dart';
import 'package:stadata_flutter_sdk/src/features/variables/data/models/variable_model.dart';
import 'package:stadata_flutter_sdk/src/features/variables/domain/entity/variable.dart';
import 'package:stadata_flutter_sdk/src/features/variables/domain/repositories/variable_repository.dart';
import 'package:stadata_flutter_sdk/src/shared/data/models/pagination_model.dart';
import 'package:stadata_flutter_sdk/src/shared/domain/entities/api_response.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

@LazySingleton(as: VariableRepository)
class VariableRepositoryImpl implements VariableRepository {
  final _remoteDataSource = getIt<VariableRemoteDataSource>();

  @override
  Future<Either<Failure, ApiResponse<List<Variable>>>> get({
    required String domain,
    int page = 1,
    DataLanguage lang = DataLanguage.id,
    bool showExistingVariables = false,
    int? year,
    int? subjectID,
  }) async {
    try {
      final result = await _remoteDataSource.get(
        domain: domain,
        lang: lang,
        page: page,
        showExistingVariables: showExistingVariables,
        year: year,
        subjectID: subjectID,
      );

      if (result.data == null ||
          result.dataAvailability == DataAvailability.listNotAvailable) {
        throw const VariableNotAvailableException();
      }

      final data = result.data?.map((e) => e.toEntity()).toList() ?? [];

      return Right(
        ApiResponse<List<Variable>>(
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
