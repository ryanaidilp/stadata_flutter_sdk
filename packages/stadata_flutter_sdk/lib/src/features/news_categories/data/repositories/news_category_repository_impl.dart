import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

class NewsCategoryRepositoryImpl implements NewsCategoryRepository {
  final _dataSource = injector.get<NewsCategoryRemoteDataSource>();
  final _log = injector.get<Log>();

  @override
  Future<Result<Failure, ApiResponse<List<NewsCategory>>>> get({
    required String domain,
    DataLanguage lang = DataLanguage.id,
  }) async {
    try {
      final result = await _dataSource.get(
        lang: lang,
        domain: domain,
      );

      if (result.data == null) {
        throw const NewsCategoryNotAvailableException();
      }

      final data = result.data ?? [];

      return Result.success(
        ApiResponse<List<NewsCategory>>(
          data: data,
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
        NewsCategoryFailure(
          message: e.toString(),
        ),
      );
    }
  }
}
