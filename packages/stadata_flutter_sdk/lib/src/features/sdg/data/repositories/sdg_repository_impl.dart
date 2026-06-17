// Repository implementations use generic catch for comprehensive error handling
// ignore_for_file: avoid_catches_without_on_clauses
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

class SdgRepositoryImpl implements SdgRepository {
  final SdgRemoteDataSource _dataSource = injector.get<SdgRemoteDataSource>();
  final Log _log = injector.get<Log>();

  @override
  Future<Result<Failure, ApiResponse<List<SdgIndicator>>>> get({
    required String domain,
    required int goal,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
  }) async {
    try {
      final result = await _dataSource.get(
        domain: domain,
        goal: goal,
        lang: lang,
        page: page,
      );

      if (result.data == null) {
        throw const SdgNotAvailableException();
      }

      final data = result.data ?? [];

      return Result.success(
        ApiResponse<List<SdgIndicator>>(
          data: data,
          status: result.status,
          message: result.message,
          pagination: result.pagination,
          dataAvailability: result.dataAvailability,
        ),
      );
    } catch (e, s) {
      _log.console(e.toString(), error: e, stackTrace: s, type: LogType.error);
      return Result.failure(SdgFailure(message: e.toString()));
    }
  }
}
