// ignore_for_file: public_member_api_docs

import 'dart:developer';

import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

class VerticalVariableRepositoryImpl implements VerticalVariableRepository {
  final _remoteDataSource = injector.get<VerticalVariableRemoteDataSource>();

  @override
  Future<Result<Failure, ApiResponse<List<VerticalVariable>>>> get({
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

      return Result.success(
        ApiResponse<List<VerticalVariable>>(
          data: result.data,
          status: result.status,
          message: result.message,
          pagination: result.pagination,
          dataAvailability: result.dataAvailability,
        ),
      );
    } catch (e) {
      log(e.toString(), name: 'StadataException');
      return Result.failure(
        VerticalVariableFailure(
          message: e.toString(),
        ),
      );
    }
  }
}
