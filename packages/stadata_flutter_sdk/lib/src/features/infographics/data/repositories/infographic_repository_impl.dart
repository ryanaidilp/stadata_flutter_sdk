// Repository implementations use generic catch for comprehensive error handling
// ignore_for_file: avoid_catches_without_on_clauses
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

class InfographicRepositoryImpl implements InfographicRepository {
  final InfographicRemoteDataSource _remoteDataSource =
      injector.get<InfographicRemoteDataSource>();
  final Log _logger = injector.get<Log>();

  @override
  Future<Result<Failure, ApiResponse<List<Infographic>>>> get({
    required String domain,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
    String? keyword,
  }) async {
    try {
      final result = await _remoteDataSource.get(
        domain: domain,
        page: page,
        lang: lang,
        keyword: keyword,
      );

      if (result.data == null) {
        throw const InfographicNotAvailableException();
      }

      final data = result.data;

      return Result.success(
        ApiResponse(
          status: result.status,
          data: data,
          dataAvailability: result.dataAvailability,
          message: result.message,
          pagination: result.pagination,
        ),
      );
    } catch (e, s) {
      await _logger.console(
        e.toString(),
        error: e,
        stackTrace: s,
        type: LogType.error,
      );
      return Result.failure(InfographicFailure(message: e.toString()));
    }
  }
}
