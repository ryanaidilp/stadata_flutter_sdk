// Repository implementations use generic catch for comprehensive error handling
// ignore_for_file: avoid_catches_without_on_clauses

import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

class DomainRepositoryImpl implements DomainRepository {
  final DomainRemoteDataSource dataSource =
      injector.get<DomainRemoteDataSource>();
  final Log _logger = injector.get<Log>();

  @override
  Future<Result<Failure, ApiResponse<List<DomainEntity>>>> get({
    DomainType type = DomainType.all,
    String? provinceCode,
  }) async {
    try {
      if (type == DomainType.regencyByProvince && provinceCode == null) {
        return Result.failure(const DomainProvinceCodeMissingFailure());
      }

      final result = await dataSource.get(
        type: type,
        provinceCode: provinceCode,
      );

      if (result.data == null) {
        throw const DomainNotAvailableException();
      }

      final entities = result.data ?? [];

      final apiResponse = result;

      return Result.success(
        ApiResponse<List<DomainEntity>>(
          status: apiResponse.status,
          dataAvailability: apiResponse.dataAvailability,
          message: apiResponse.message,
          pagination: apiResponse.pagination,
          data: entities,
        ),
      );
    } catch (e, s) {
      _logger.console(
        e.toString(),
        error: e,
        stackTrace: s,
        type: LogType.error,
      );
      return Result.failure(DomainFailure(message: e.toString()));
    }
  }
}
