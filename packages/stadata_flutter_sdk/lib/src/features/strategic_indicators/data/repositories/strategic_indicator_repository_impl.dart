import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

class StrategicIndicatorRepositoryImpl implements StrategicIndicatorRepository {
  final _dataSource = injector.get<StrategicIndicatorRemoteDataSource>();
  final _log = injector.get<Log>();

  @override
  Future<Result<Failure, ApiResponse<List<StrategicIndicator>>>> get({
    required String domain,
    DataLanguage lang = DataLanguage.id,
    int? variableID,
    int page = 1,
  }) async {
    try {
      final result = await _dataSource.get(
        variableID: variableID,
        domain: domain,
        lang: lang,
        page: page,
      );

      return Result.success(
        ApiResponse<List<StrategicIndicator>>(
          data: result.data,
          status: result.status,
          message: result.message,
          pagination: result.pagination,
          dataAvailability: result.dataAvailability,
        ),
      );
    } catch (e, s) {
      await _log.console(
        e.toString(),
        error: e,
        stackTrace: s,
        type: LogType.error,
      );
      return Result.failure(
        StrategicIndicatorFailure(
          message: e.toString(),
        ),
      );
    }
  }
}
