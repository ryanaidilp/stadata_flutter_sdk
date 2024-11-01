// ignore_for_file: public_member_api_docs

import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

class VariableRepositoryImpl implements VariableRepository {
  final _remoteDataSource = injector.get<VariableRemoteDataSource>();

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

      return Right(
        ApiResponse<List<Variable>>(
          data: result.data,
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
