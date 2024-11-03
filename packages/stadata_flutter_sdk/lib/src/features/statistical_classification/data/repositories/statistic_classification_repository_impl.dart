import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

class StatisticClassificationRepositoryImpl
    implements StatisticClassificationRepository {
  final _remoteDataSource =
      injector.get<StatisticClassificationRemoteDataSource>();
  final _log = injector.get<Log>();

  @override
  Future<Result<Failure, ApiResponse<List<StatisticClassification>>>> detail({
    required String id,
    required ClassificationType type,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
    int perPage = 10,
  }) async {
    try {
      final response = await _remoteDataSource.detail(
        id: id,
        page: page,
        lang: lang,
        type: type,
        perPage: perPage,
      );

      return Result.success(
        ApiResponse<List<StatisticClassification>>(
          data: response.data,
          status: response.status,
          message: response.message,
          pagination: response.pagination,
          dataAvailability: response.dataAvailability,
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
        StatisticClassificationFailure(message: e.toString()),
      );
    }
  }

  @override
  Future<Result<Failure, ApiResponse<List<StatisticClassification>>>> get({
    required ClassificationType type,
    ClassificationLevel? level,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
    int perPage = 10,
  }) async {
    try {
      final response = await _remoteDataSource.get(
        page: page,
        lang: lang,
        type: type,
        level: level,
        perPage: perPage,
      );

      return Result.success(
        ApiResponse<List<StatisticClassification>>(
          data: response.data,
          status: response.status,
          message: response.message,
          pagination: response.pagination,
          dataAvailability: response.dataAvailability,
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
        StatisticClassificationFailure(message: e.toString()),
      );
    }
  }
}
