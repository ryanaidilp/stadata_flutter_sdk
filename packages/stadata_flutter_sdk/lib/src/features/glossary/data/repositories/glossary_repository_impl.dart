// Repository implementations use generic catch for comprehensive error handling
// ignore_for_file: avoid_catches_without_on_clauses
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

class GlossaryRepositoryImpl implements GlossaryRepository {
  final GlossaryRemoteDataSource _dataSource = injector
      .get<GlossaryRemoteDataSource>();
  final Log _log = injector.get<Log>();

  @override
  Future<Result<Failure, ApiResponse<List<Glossary>>>> get({
    required String domain,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
    String? keyword,
    String? prefix,
  }) async {
    try {
      final result = await _dataSource.get(
        domain: domain,
        lang: lang,
        page: page,
        keyword: keyword,
        prefix: prefix,
      );

      if (result.data == null) {
        throw const GlossaryNotAvailableException();
      }

      final data = result.data ?? [];

      return Result.success(
        ApiResponse<List<Glossary>>(
          data: data,
          status: result.status,
          message: result.message,
          pagination: result.pagination,
          dataAvailability: result.dataAvailability,
        ),
      );
    } catch (e, s) {
      _log.console(e.toString(), error: e, stackTrace: s, type: LogType.error);
      return Result.failure(GlossaryFailure(message: e.toString()));
    }
  }
}
